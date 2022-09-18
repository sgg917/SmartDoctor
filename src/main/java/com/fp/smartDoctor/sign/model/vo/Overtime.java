package com.fp.smartDoctor.sign.model.vo;

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
public class Overtime {
	
	private int apprNo;
	private int empNo;
	private String overDate;
	private String startTime;
	private String endTime;
	private String totalTime;
	private String overCause;
	private String overStatus;
	private String enrollDate;
	
}
