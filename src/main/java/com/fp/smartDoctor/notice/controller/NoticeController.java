package com.fp.smartDoctor.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.FileUpload;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.notice.model.service.NoticeService;
import com.fp.smartDoctor.notice.model.vo.Notice;

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
	
	// 공지사항 글 작성
	@RequestMapping("enroll.no")
	public String enrollNotice() {
		return "ljy/noticeEnrollForm";
	}
	
	// 공지사항 작성하기
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
		
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

}
