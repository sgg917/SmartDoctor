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
	private String noticeTitle;
	private String noticeContent;
	private String enrollDate;
	private String modifyDate;
	private int count;
	private String noticeOrigin;
	private String noticePath;
	private String noticeStatus;
	
}
