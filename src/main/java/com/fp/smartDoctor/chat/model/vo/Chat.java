package com.fp.smartDoctor.chat.model.vo;

import java.io.Serializable;

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
public class Chat implements Serializable{


	private int co_no;				//co_no
	private int ol_no;				//ol_no
	private String id; 			
	private String id2; 			
	private String ol_cont;			//OL_CONT
	private String ol_date;			//OL_DATE

	private String rename_file;		//이미지
	private String name;			//이름
	private int count;				//안읽은 갯수
	private String ol_yn;			//읽음여부.
	
	private String ol_img;			//이미지
	

	
	private static final long serialVersionUID = -642269781780958932L;
	
	public String getOl_img() {
		return ol_img;
	}
	public void setOl_img(String ol_img) {
		this.ol_img = ol_img;
	}
	public String getOl_yn() {
		return ol_yn;
	}
	public void setOl_yn(String ol_yn) {
		this.ol_yn = ol_yn;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRename_file() {
		return rename_file;
	}
	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public int getOl_no() {
		return ol_no;
	}
	public void setOl_no(int ol_no) {
		this.ol_no = ol_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId2() {
		return id2;
	}
	public void setId2(String id2) {
		this.id2 = id2;
	}
	public String getOl_cont() {
		return ol_cont;
	}
	public void setOl_cont(String ol_cont) {
		this.ol_cont = ol_cont;
	}
	public String getOl_date() {
		return ol_date;
	}
	public void setOl_date(String ol_date) {
		this.ol_date = ol_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Chat [co_no=" + co_no + ", ol_no=" + ol_no + ", id=" + id + ", id2=" + id2 + ", ol_cont=" + ol_cont
				+ ", ol_date=" + ol_date + ", rename_file=" + rename_file + ", name=" + name + ", count=" + count
				+ ", ol_yn=" + ol_yn + ", ol_img=" + ol_img + "]";
	}


	
	

	
}
