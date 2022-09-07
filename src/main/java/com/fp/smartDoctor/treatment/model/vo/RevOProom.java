package com.fp.smartDoctor.treatment.model.vo;

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
public class RevOProom {

	private int bookingNo;
	private int clinicNo;
	private String surgeryNo;
	private String roomName;
	private String surDate;
	private String surStartTime;
	private String memo;
	private String surStatus;
	private String doctorName;//수술 담당 의사 이름
	private String surEndTime;//시작시간+소요시간=수술 끝시간
}
