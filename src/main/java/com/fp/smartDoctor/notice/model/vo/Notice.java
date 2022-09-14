package com.fp.smartDoctor.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Notice {
	
	private int noticeNo;
	private String nTitle;
	private String nContent;
	private String enrollDate;
	private String modifyDate;
	private int count;
	private String nOriginName;
	private String nFilePath;
	private String nStatus;
	
}
