package com.fp.smartDoctor.messenger.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fp.smartDoctor.messenger.model.service.MessengerService;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;

@Controller
public class MessengerController {

	@Autowired 
	private MessengerService mService;
	

	
	//메일 작성하기
	
	//메일페이지 작성 페이지 호출
	@RequestMapping("enroll.em")
	public String enrollForm(@RequestParam(required=false)String empNo, Model model) {
		model.addAttribute("fulladress", empNo);
		return "kcy/mailMailEnrollForm";
	}
	
	
	//파일 업로드
	public String saveFile(MultipartFile file, HttpServletRequest request, int flag) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/mailFiles/";
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
	
	
	@ResponseBody
	@RequestMapping(value="insert.em", produces="application/json; charset=utf-8")
	public int insertBoard(MultipartHttpServletRequest form, @RequestParam(name="files", required=false) MultipartFile[] files) {
		
		String title[] = form.getParameterValues("mailTitle");
		String content[] = form.getParameterValues("mailContent");
		String tto[] = form.getParameterValues("mailTo");
		String toname[] = form.getParameterValues("mailnameTo");
		String from[] = form.getParameterValues("empNo");
		String fromname[] = form.getParameterValues("mailnameFrom");
		String with[] = form.getParameterValues("mailWith");
		String withname[] = form.getParameterValues("mailnameWith");
		String to[] = { "1", "2" };
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
		
		
		int result = 0;
		result = mService.insertMail(insertE);
		String resources = form.getSession().getServletContext().getRealPath("resources");
		String filePath = resources + "/mailFiles/";
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
				} // 혹시나 Math.random이 같은 값이 나올경우를 대비해서~
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



	 	
	 	
	 	
	
}
