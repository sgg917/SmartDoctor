package com.fp.smartDoctor.attendance.model.vo;

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
public class Attendance {
	private int attNo;
	private int empNo;
	private String attDate;
	private String startTime;
	private String endTime;
	private String status;
	private int totalTime;
	private int overTime;
	private String modifyDate;
	private int modifyNo;
	
	// 근태 날짜 검색용 필드
	private String startDate;
	private String endDate;
	// 근태 상태 검색용 필드
	private String[] statusArr;
}
