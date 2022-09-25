package com.fp.smartDoctor.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class openChat implements Serializable{

	
	
	private int cm_no;			//오픈채팅방 번호
	private String cm_title; 	// 오픈채팅방이름
	private String cm_pwd;		//오픈채팅방비밀번호
	private int cm_max;			//최대인원
	private int cm_cot;			//현재인원
	private String cm_con;		//방 소개
	private String cm_id;		//아이디
	
	private int ml_no;
	private String id;
	private String ml_cont;
	private String ml_date;
	
	private String rename_file;	//사진이름
	private String nickname;	//닉네임
	
	
	

	
	

}
