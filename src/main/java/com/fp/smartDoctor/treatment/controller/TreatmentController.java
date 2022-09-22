package com.fp.smartDoctor.treatment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.reception.model.vo.Prescription;
import com.fp.smartDoctor.treatment.model.service.TreatmentService;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.PreMed;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.RevPatientRoom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;
import com.google.gson.Gson;

@Controller
public class TreatmentController {
	
	
	@Autowired 
	private TreatmentService tService;
	 
		
	//수술실 예약 풀캘린더 조회
	/*
 	@RequestMapping("enrollForm.op")
	public String getCalendarList(ModelAndView mv, HttpServletRequest request) {
		return "kcy/revOREnrollForm";
		
		
//		List<Calendar> calendar = null;
//		try {
//			calendar = mService.getCalendar();
//			request.setAttribute("calendarList", calendar);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(calendar);
//		mv.setViewName(viewpage);
//		return mv;
	}
	*/
 	
 	@ResponseBody
 	@RequestMapping(value="list.ca", produces="application/json; charset=utf-8")
 	public String selectCalendarList() {
 		List<RevOProom> calendar = tService.getCalendar();
 		return new Gson().toJson(calendar);
 	}
 	

 	//수술실 예약 조회
	@ResponseBody
	@RequestMapping(value="detail.op", produces="application/json; charset=utf-8")
	public String selectRevOProom(int clinicNo) {
		Clinic c = tService.selectRevOProom(clinicNo);
		return new Gson().toJson(c);
		
	}
	
	//수술실 예약조회 모달 호출
	@RequestMapping("detail.op2")
    public String Modal() {
        return "kcy/revORDetail";
    }

	
	//수술실 예약조회 달력 호출
	@RequestMapping("list.op")
    public String orList() {
        return "kcy/revORList";
    }
	
	
	//수술실 예약을 위한 정보 조회
	@ResponseBody
 	@RequestMapping(value="enrollForm.op", produces="application/json; charset=utf-8")
	public ModelAndView selectforInsertRevOP(int clinicNo, ModelAndView mv) {
		
		Clinic c=tService.selectforInsertRevOP(clinicNo);
		
		mv.addObject("c", c).setViewName("kcy/revOREnrollForm");
		
		return mv;
	}

	
	
	// 진료화면 조회
	@RequestMapping("enroll.tmt")
	public ModelAndView enrollTreatment(Patient p, Clinic c, Disease d, HttpSession session, ModelAndView mv) {
		
		
		// 교수만 진료 가능하게 수정
		
		
		// 로그인한 의사의 사번
		String empNo = ((Member)session.getAttribute("loginUser")).getEmpNo();
		//System.out.println("empNo" + empNo);
		
		// 진료할 환자의 정보 조회
		Patient nowPatient = tService.selectNowPatient(p, empNo);
		System.out.println("진료중인 환자 : " + nowPatient); // 나중에 지워야됨
		
		if(nowPatient != null) {
			
			// 진료할 환자 존재
			session.setAttribute("nowPatient", nowPatient);
			
			// 진료할 환자의 과거 내역 조회
			ArrayList<Clinic> list = tService.selectPatientInfo(nowPatient.getChartNo());
			mv.addObject("list", list);
			
			// 질병 리스트 조회
			ArrayList<Disease> dList = tService.selectDiseaseList();
			mv.addObject("dList", dList).setViewName("ljy/enrollTreatment");
			
			// 수술 전체 리스트 조회
			ArrayList<Surgery> sList = tService.selectSurgeryList();
			mv.addObject("sList", sList).setViewName("ljy/enrollTreatment");
			
			// 약 전체 리스트 조회
			ArrayList<Medicine> mList = tService.selectMedList();
			mv.addObject("mList", mList).setViewName("ljy/enrollTreatment");
			
			mv.setViewName("ljy/enrollTreatment");
			
		}else { 

			session.setAttribute("errorMsg", "진료중인 환자가 없습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	//수술실 예약
	@ResponseBody
	@RequestMapping(value="insert.op", produces="application/json; charset=utf-8")
	public ModelAndView insertReservation(HttpServletRequest request, HttpSession session,ModelAndView mv) {
		
		String surgeryNo = request.getParameter("surgeryNo");
		String clinicNo = request.getParameter("clinicNo");
		String roomName = request.getParameter("roomName");
		String surDate = request.getParameter("surDate");
		String surEndTime = request.getParameter("surEndTime");
		String surStartTime = request.getParameter("surStartTime");
		String patientName = request.getParameter("patientName");
		String doctorName = request.getParameter("doctorName");
		String memo = request.getParameter("memo");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("surgeryNo", surgeryNo);
		paraMap.put("clinicNo", clinicNo);
		paraMap.put("roomName", roomName);
		paraMap.put("surDate", surDate);
		paraMap.put("surEndTime", surEndTime);
		paraMap.put("surStartTime", surStartTime);
		paraMap.put("doctorName", doctorName);
		paraMap.put("memo", memo);
		paraMap.put("patientName", patientName);
		
		int result = tService.insertReservation(paraMap);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수술실 예약이 완료되었습니다.");
			mv.setViewName("kmj/rsvWaiting");
			//예약한 다음 수술실 예약 페이지 이전페이지로 이동 시킬것임 수정해야 함
		}else {
			session.setAttribute("errorMsg", "수술실 예약에 실패하였습니다.");
			mv.setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	
	//수술실 예약
	/*
	@RequestMapping("insert.op")
	public String insertNotice(Clinic c, HttpSession session, Model model) {
		
		int result = tService.insertRsv(c);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수술실 예약이 완료되었습니다.");
			return "redirect:enrollForm.op";
		}else {
			model.addAttribute("errorMsg", "수술실 예약에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	*/
	
	
	
	//수술실 예약 중복 막기
	@ResponseBody
	@RequestMapping(value="overlap.op", produces="application/json; charset=utf-8")
	public String chOverlap(String surgeryRoom, String surDate, HttpSession session) {
		
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("surgeryRoom", surgeryRoom);
		paraMap.put("surDate", surDate);
		
		ArrayList<Clinic> c = tService.blockOverlap(paraMap);
		
		return new Gson().toJson(c);
		
	}
	
	
	//수술예약 취소
	@RequestMapping("cancel.op")
	public String cslRsvOP(int no, Model model, HttpSession session) {
		
		int result = tService.cslRsvOP(no);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "수술실 예약이 취소되었습니다.");
			return "redirect:/";
			
		}else {
			model.addAttribute("errorMsg", "예약 취소 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
 	//입원실 달력 정보조회
 	@ResponseBody
 	@RequestMapping(value="list.cp", produces="application/json; charset=utf-8")
 	public String selectpCalendarList() {
 		List<RevPatientRoom> calendar = tService.getpCalendar();
 		return new Gson().toJson(calendar);
 	}
 	

 	//입원실 예약 조회
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=utf-8")
	public String selectRevProom(int clinicNo) {
		Clinic c = tService.selectRevProom(clinicNo);
		return new Gson().toJson(c);
		
	}
	
	//입원실 예약조회 모달 호출
	@RequestMapping("detail.pr2")
    public String Modal2() {
        return "kcy/revPRDetail";
    }


	
	
	//입원실 예약을 위한 정보 조회
	@ResponseBody
 	@RequestMapping(value="enrollForm.pr", produces="application/json; charset=utf-8")
	public ModelAndView selectforInsertRevP(int clinicNo, ModelAndView mv) {
		
		Clinic c=tService.selectforInsertRevPR(clinicNo);
		
		mv.addObject("c", c).setViewName("kcy/revPREnrollForm");
		
		return mv;
	}

	
	
	//입원실 예약
	@ResponseBody
	@RequestMapping(value="insert.pr", produces="application/json; charset=utf-8")
	public ModelAndView insertpr(HttpServletRequest request, HttpSession session,ModelAndView mv) {
		
		String clinicNo = request.getParameter("clinicNo");
		String proomNo = request.getParameter("proomNo");
		String enterDate = request.getParameter("enterDate");
		String leaveDate = request.getParameter("leaveDate");
		String patientName = request.getParameter("patientName");
		String doctorName = request.getParameter("doctorName");
		String memo = request.getParameter("memo");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("clinicNo", clinicNo);
		paraMap.put("proomNo", proomNo);
		paraMap.put("enterDate", enterDate);
		paraMap.put("leaveDate", leaveDate);
		paraMap.put("doctorName", doctorName);
		paraMap.put("memo", memo);
		paraMap.put("patientName", patientName);
		
		
		System.out.println(clinicNo);
		int result = tService.insertPR(paraMap);
		System.out.println(result);
		int result2 = tService.updatePRpay(Integer.parseInt(clinicNo));
		System.out.println(result2);
		
		if(result * result2 > 0) {
			session.setAttribute("alertMsg", "입원실 예약이 완료되었습니다.");
			mv.setViewName("kmj/rsvWaiting");
			//예약한 다음 수술실 예약 페이지 이전페이지로 이동 시킬것임 수정해야 함
		}else {
			session.setAttribute("errorMsg", "입원실 예약에 실패하였습니다.");
			mv.setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	@RequestMapping("insert.tmt")
	public String insertTreatment(Clinic c, Prescription pre, HttpSession session, String injectDay, String chartNo, String newOne) {
		
		//System.out.println("chartNo : " + chartNo);
		
		// 진료테이블 업데이트
		int clinicResult = tService.updateClinic(c); 
		System.out.println("진료테이블 : " + c);
		
		// 처방전 입력
		int preResult = tService.insertPre(pre);
		System.out.println("처방전 : " + pre);
		
		int pResult = 0;
		
		// 환자 초진/재진 여부 업데이트
		if(newOne.equals("초진")) {
			pResult = tService.updatePatient(chartNo);
			System.out.println("chartNo : " + chartNo);
		}
		
		if(clinicResult > 0 && preResult > 0 && pResult > 0) {
			
			System.out.println("1차성공");
			
			System.out.println(pre.getPreMedList()); // 입력한 약 list 보기
			
			int pMedResult = 0;
			String meals = "";
			System.out.println("meals" + meals);
			
			// 처방약 입력
			for(PreMed pmd : pre.getPreMedList()) {
				pMedResult = tService.insertPmed(pmd);
				System.out.println("처방약 : " + pmd);
			}
			
			System.out.println("안녕하세요");
			
			if(c.getSurgeryNo2().equals(" ")) { // 수술코드가 null이 아니면 == 수술을 한다면
				ArrayList<Surgery> sList = tService.selectSurgeryList();
				for(int i = 0; i<sList.size(); i++) {
					if(sList.get(i).getSurgeryNo().equals(c.getSurgeryNo2())) {
						meals = Integer.toString(Integer.parseInt(sList.get(i).getPeriod()) * 15000);
						System.out.println("meals : " + meals);
					}
				}
		
			}else {
				meals = null;
				System.out.println("meals2 : " + meals);
			}
			System.out.println("meals3 : " + meals);
			
			System.out.println("clinicNo : " + c.getClinicNo());
			System.out.println("surgeryNo2" + c.getSurgeryNo2());
			
			int payResult = tService.insertPay(c.getClinicNo(), c.getSurgeryNo2(), meals);
			
			
			
			
			if(pMedResult > 0 && payResult > 0) {
				session.setAttribute("alertMsg", "진료 완료되었습니다!");
				System.out.println("2차성공");
				return "redirect:/";
			}else {
				System.out.println("처방약 입력 실패");
				session.setAttribute("errorMsg", "진료 실패");
				return "ljy/enrollTreatment";
			
			}
			
		}else {
			System.out.println("실패");
			session.setAttribute("errorMsg", "진료 실패");
			return "ljy/enrollTreatment";
		}
		
	}
	
	
	/*
	 * //입원실 예약 후 수납 입원료 변경
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("updatePay.pr") public int
	 * updatePRpay(@RequestParam("clinicNo") int clinicNo, HttpSession session,
	 * Model model) {
	 * 
	 * int result = tService.updatePRpay(clinicNo);
	 * 
	 * return result > 0 ? clinicNo : null; }
	 */
	
	

	
	

}
