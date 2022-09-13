package com.fp.smartDoctor.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Vacation {

	private int appNo;
	private int empNo;
	private String enrollDate;
	private String startDate;
	private String endDate;
	private int vacDays;
	private String vacCause;
	
	// 연차 결재 진행상태
	private String status;
	// 연차 잔여일수
	private int vacRemain;
	// 사원 이름
	private String empName;
	
}
