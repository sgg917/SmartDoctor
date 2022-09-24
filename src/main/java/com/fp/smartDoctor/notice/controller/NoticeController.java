package com.fp.smartDoctor.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.FileUpload;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.notice.model.service.NoticeService;
import com.fp.smartDoctor.notice.model.vo.Notice;
import com.google.gson.Gson;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	// 공지사항 리스트 조회
	@RequestMapping("list.no")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 게시글 총 갯수 세기
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("listCount", listCount)
		  .setViewName("ljy/noticeListView");
		
		return mv;
		
	}
	
	// 공지사항 글 작성 페이지 조회
	@RequestMapping("enroll.no")
	public String enrollNotice() {
		return "ljy/noticeEnrollForm";
	}
	
	// 공지사항 작성하기
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 업로드한 파일 있을 때
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
			
			n.setNoticeOrigin(upfile.getOriginalFilename());
			n.setNoticePath(saveFilePath);
			
		}
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			// insert 성공
			session.setAttribute("alertMsg", "공지사항이 성공적으로 등록되었습니다.");
			return "redirect:list.no";
		}else {
			session.setAttribute("errorMsg", "게시물 등록 실패");
			return "ljy/boardEnrollForm";
		}
		
	}
	
	// 공지사항 상세페이지
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int no, ModelAndView mv) {
		
		int result = nService.increaseCount(no);
		
		if(result > 0) {
			Notice n = nService.selectNotice(no);
			mv.addObject("n", n)
			  .setViewName("ljy/noticeDetailView");
		}else {
			mv.addObject("errorMsg", "상세조회 실패")
			  .setViewName("ljy/noticeListView");
		}
		
		return mv;
	}
	
	// 공지사항 삭제하기
	@RequestMapping("delete.no")
	public String deleteNotice(int no, String noticePath, Model model, HttpSession session) {
		
		System.out.println(noticePath);
		
		int result = nService.deleteNotice(no);
		
		if(result > 0) {
			// 삭제 성공
			
			// 기존에 첨부파일 있었을 떄
			if(!noticePath.equals("")) { // 기존의 첨부파일 제거
				new File( session.getServletContext().getRealPath(noticePath) ).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다.");
			return "redirect:list.no";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "ljy/noticeListView";
		}
	}
	
	// 공지사항 수정하기 화면조회
	@RequestMapping("updateForm.no")
	public String updateForm(int no, Model model) {
		Notice n = nService.selectNotice(no);
		model.addAttribute("n", n);
		return "ljy/noticeUpdateForm";
	}
	
	// 공지사항 수정하기
	@RequestMapping("update.no")
	public String updateNotice(Notice n, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 수정할 때 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			if(n.getNoticeOrigin() != null) {
				new File( session.getServletContext().getRealPath(n.getNoticeOrigin()) ).delete();
			}
			
			// 새로운 첨부파일 서버에 업로드
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/");
			n.setNoticeOrigin(reupfile.getOriginalFilename());
			n.setNoticePath(saveFilePath);
		}
		
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			// 수정완료
			session.setAttribute("alertMsg", "공지사항 수정 완료");
			return "redirect:detail.no?no=" + n.getNoticeNo();
		}else {
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "ljy/noticeListView";
		}

	}
	
	// 공지사항 검색
	@RequestMapping("search.no")
	public ModelAndView searchNotice(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, ModelAndView mv) {
		
		int searchCount = nService.selectSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectSearchList(keyword, pi);
		
		System.out.println("searchCount : " + searchCount);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("searchCount", searchCount)
		  .addObject("keyword", keyword)
		  .setViewName("ljy/noticeListView");
		
		return mv;
		
	}
	
	// 메인 공지사항 조회수 상위 5개 조회
	@ResponseBody
	@RequestMapping(value="topList.no", produces="application/json; charset=utf-8")
	public String ajaxTopNoticeList() {
		ArrayList<Notice> list = nService.selectTopNoticeList();
		return new Gson().toJson(list);
	}

}
