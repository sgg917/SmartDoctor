package com.fp.smartDoctor.messenger.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.messenger.model.service.MessengerService;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;
import com.fp.smartDoctor.messenger.model.vo.MailCount;
import com.fp.smartDoctor.messenger.model.vo.Search;
import com.fp.smartDoctor.messenger.model.vo.SearchCondition;
import com.google.gson.Gson;




@Controller
public class MessengerController {

	@Autowired 
	private MessengerService mService;
	


	//-----------------------메일--------------------------------
	
	
	@RequestMapping("list.mil")
	public String selectList(int currentPage, String mailOwn, Model model) {
		int listCount = mService.selectListCount(mailOwn);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Email> list = mService.selectList(pi, mailOwn);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMailDateStr(format1.format(list.get(i).getMailDate()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "kcy/mailInbox";
	}
	
	
	
	@RequestMapping("flist.mil")
	public String selectToList(int currentPage, String mailOwn, Model model) {

		int listCount = mService.fselectListCount(mailOwn);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Email> list = mService.fselectList(pi, mailOwn);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMailDateStr(format1.format(list.get(i).getMailDate()));
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "kcy/mailSentbox";
	}
	
	
	
	@RequestMapping("ilist.mil")
	public String selectImportToList(int currentPage, String mailOwn, Model model) {

		int listCount = mService.iselectListCount(mailOwn);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Email> list = mService.iselectList(pi, mailOwn);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMailDateStr(format1.format(list.get(i).getMailDate()));
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "kcy/mailImportantbox";
	}
	
	@RequestMapping("dlist.mil")
	public String dselectList(int currentPage, String mailOwn, Model model) {
		int listCount = mService.dselectListCount(mailOwn);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Email> list = mService.dselectList(pi, mailOwn);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMailDateStr(format1.format(list.get(i).getMailDate()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "kcy/mailDeletebox";
	}
	
	
	@RequestMapping("search.mil")
	public String searchEmailList(String condition, String keyword, String mailOwn, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition();
		sc.setMailTo(mailOwn);
		
		switch(condition) {
		case "mailTitle" : sc.setMailTitle(keyword);  break;
		case "mailContent" : sc.setMailContent(keyword); break;
		case "mailnameFrom" : sc.setMailnameFrom(keyword); break;
		}
		
		
		int searchListCount = mService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Email> slist = mService.searchList(pi,sc);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<slist.size(); i++) {
			slist.get(i).setMailDateStr(format1.format(slist.get(i).getMailDate()));
		}
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);
		return "kcy/mailInbox";
	}
	
	
	
	@RequestMapping("fsearch.mil")
	public String fsearchEmailList(String condition, String keyword, String mailOwn, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition();
		sc.setMailFrom(mailOwn);
		
		switch(condition) {
		case "mailTitle" : sc.setMailTitle(keyword);  break;
		case "mailContent" : sc.setMailContent(keyword); break;
		case "mailnameTo" : sc.setMailnameTo(keyword); break;
		}
		
		
		
		int searchListCount = mService.searchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Email> slist = mService.searchList(pi,sc);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<slist.size(); i++) {
			slist.get(i).setMailDateStr(format1.format(slist.get(i).getMailDate()));
		}
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);	
		return "kcy/mailSentbox";
	}
	
	
	
	@RequestMapping("isearch.mil")
	public String isearchEmailList(String condition, String keyword, String mailOwn, int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition();
		sc.setMailOwn(mailOwn);
		
		switch(condition) {
		case "mailTitle" : sc.setMailTitle(keyword);  break;
		case "mailContent" : sc.setMailContent(keyword); break;
		case "mailnameTo" : sc.setMailnameTo(keyword); break;
		case "mailnameFrom" : sc.setMailnameFrom(keyword); break;
		}
		
		
		
		int searchListCount = mService.isearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(searchListCount, currentPage, 5, 10);
		
		ArrayList<Email> slist = mService.isearchList(pi,sc);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		for(int i=0; i<slist.size(); i++) {
			slist.get(i).setMailDateStr(format1.format(slist.get(i).getMailDate()));
		}
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", slist);
		model.addAttribute("sc", 1);	
		return "kcy/mailImportantbox";
	}
	
	
	
	@RequestMapping("detail.mil")
	public String detailMail(int mailNo, int currentPage, String mailOwn, Model model, String pt) {

		int readResult = mService.readFlagUpdate(mailNo);
		Email e = mService.selectMail(mailNo);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		
		e.setMailDateStr(format1.format(e.getMailDate()));
		
		model.addAttribute("e", e);
		model.addAttribute("pt", pt);
		return "kcy/mailDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="detailFile.mil", produces="application/json; charset=utf-8")
	public String fileList(int mailNo) {
		ArrayList<MailAttachment> list = mService.fileList(mailNo);
		return new Gson().toJson(list);
	}
	
	
	
	
	//메일 작성
	@RequestMapping("enrollForm.mil")
	public String enrollForm(@RequestParam(required=false)String empNo, Model model) {
		empNo = empNo;
		model.addAttribute("trans", empNo);
		return "kcy/mailSendForm";
	}
	
	@ResponseBody
	@RequestMapping(value="insert.mil", produces="application/json; charset=utf-8")
	public int insertBoard(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {
		
		String title[] = form.getParameterValues("mailTitle");
		String content[] = form.getParameterValues("mailContent");
		String tto[] = form.getParameterValues("mailTo");
		String toname[] = form.getParameterValues("mailnameTo");
		String from[] = form.getParameterValues("empNo");
		String fromname[] = form.getParameterValues("mailnameFrom");
		String with[] = form.getParameterValues("mailWith");
		String withname[] = form.getParameterValues("mailnameWith");
		String [] to = { "1", "2" };
		to[0] = tto[0].substring(0,tto[0].indexOf('@'));
		
		Email insertE = new Email();
		insertE.setMailTitle(title[0]);
		insertE.setMailContent(content[0]);
		insertE.setMailTo(to[0]);
		insertE.setMailFrom(from[0]);
		insertE.setMailnameTo(toname[0]);
		insertE.setMailnameWith(withname[0]);
		insertE.setMailWith(with[0]);
		if(toname[0].length() == 0) {
			insertE.setMailnameTo(mService.loadMailnameTo(to[0]));
		}
		
		insertE.setMailnameFrom(fromname[0]);
		System.out.println(insertE);
		
		int result = 0;
		result = mService.insertMail(insertE);
		String resources = form.getSession().getServletContext().getRealPath("resources");
		String filePath = resources + "\\uploadFiles\\mail\\";
		if(files.length > 0) {
			int flag = 0;
			int setFlag = 0;
			for(int i=0; i<files.length; i++) {
				setFlag = (int)(Math.random()*99) + 10;
				if(setFlag != flag) {
					flag = setFlag;
				}else {
					setFlag += 100;
					flag = setFlag;
				} // 같은 값이 나올 경우 대비
				String changeName = saveFile(files[i], form, flag);
				MailAttachment mt = new MailAttachment();
				mt.setChangeName(changeName);
				mt.setOriginName(files[i].getOriginalFilename());
				mt.setMailFileSize(String.valueOf(files[i].getSize()));
				mt.setFilePath(filePath);
				result += mService.insertMailAttachment(mt);
			}
		}else {
			Email currMail = mService.nowMailNo();
			int currNo = currMail.getMailNo();
			result = mService.updateMailFlag(currNo);
		}
		
		
		return result;
	}
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request, int flag) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\mail\\";
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명 (20200522202011.jpg)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 반복시의 구별값
		currentTime += flag;
		
		// 확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
				
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\mail\\";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	  //주소록
	  @RequestMapping("openSigner.mil")
	  public String openSigner(String documentNo,HttpSession session,Model model) {

		  model.addAttribute("documentNo",documentNo);
		  return "kcy/mailAddToList";
	  }
	  
	  
	  
	@RequestMapping("delete.mil")
	public String deleteMail(int mailNo[], String mailOwn, Model model) {
		
		int result = 0;
		for(int i=0; i<mailNo.length; i++) {
			result = mService.deleteMail(mailNo[i]);
		}
		
		return "redirect:dlist.mil?currentPage=1&mailOwn=" + mailOwn;
	}  
	
	@RequestMapping("fdelete.mil")
	public String foreverdeleteMail(int mailNo[], String mailOwn, Model model) {
		
		int result = 0;
		for(int i=0; i<mailNo.length; i++) {
			result = mService.foreverdeleteMail(mailNo[i]);
		}
		
		return "redirect:dlist.mil?currentPage=1&mailOwn=" + mailOwn;
	}  
	
	
	
	@ResponseBody
	@RequestMapping("importFlagUpdate.mil")
	public int importFlagUpdate(int mailNo) {
		
		int result = 0;
		Email e = mService.selectMail(mailNo);
		if(e.getMailImportFlag().equals("Y")) {
			
			result = mService.unImportFlagUpdate(mailNo);
		}else if(e.getMailImportFlag().equals("N")) {
			result = mService.importFlagUpdate(mailNo);
		}
			
		return result;
	}
	
	
	
	@RequestMapping("replyMail.mil")
	public String replyMail(int mailNo, Model model) {
		Email e = mService.selectMail(mailNo);
		model.addAttribute("m", e);
		model.addAttribute("f", 0);
		return "kcy/mailSentDetail";
	}
	
	
	
	@RequestMapping("transMail.mil")
	public String transMail(int mailNo, Model model) {
		Email e = mService.selectMail(mailNo);
		model.addAttribute("m", e);
		model.addAttribute("f", 1);
		return "kcy/mailSentDetail";
	}
	
	
	
	@ResponseBody
	@RequestMapping("mailCount.mil")
	public MailCount mailCount(String mailOwn) {
		
		MailCount mc = new MailCount();
		mc.setNotReadMail(mService.notReadMail(mailOwn));
		mc.setFromMail(mService.fromMail(mailOwn));
		mc.setImportMail(mService.importMail(mailOwn));
			
		return mc;
	}
	
	
	
	@ResponseBody
	@RequestMapping("miniFromMailList.mil")
	public ArrayList<Email> miniFromMailList(String mailOwn) {
		
		ArrayList<Email> list = mService.miniFromMailList(mailOwn);
		return list;
	}
	
	
	
	@ResponseBody
	@RequestMapping("miniToMailList.mil")
	public ArrayList<Email> miniToMailList(String mailOwn) {
		
		ArrayList<Email> list = mService.miniToMailList(mailOwn);
		return list;
	}
	
	
	
	@ResponseBody
	@RequestMapping("miniImportMailList.mil")
	public ArrayList<Email> miniImportMailList(String mailOwn) {
		ArrayList<Email> list = mService.miniImportMailList(mailOwn);
		return list;
	}
	
	
	
	
	
	
	
	
	//조직도 부서별 사원 조회
	@ResponseBody
	@RequestMapping(value="deptEmpList.gr", produces="application/json; charset=utf-8")
	public String selectDeptEmpList(String keyword) {
		
		ArrayList<Member> array = mService.selectDeptEmpList(keyword);
		return new Gson().toJson(array);
	}
	
	
	
	//조직도 키워드 검색 
	@ResponseBody
	@RequestMapping(value="empListSearch.gr", produces="application/json; charset=utf-8" )
	public String selectEmpListSearch(Search search) {
		
		ArrayList<Member> array = mService.selectEmpListSearch(search);
		return new Gson().toJson(array);
	}
	
	
	
	
	
	
	
	
	//-----------------채팅-------------------
	

	


}
