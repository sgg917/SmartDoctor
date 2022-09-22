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
public class Clinic {

	private String clinicNo;
	private int chartNo;//문자는 안들어가나요?? 네!숫자로만 할게용 10000번 이후로용
	private int deptNo;
	private String enrollTime;
	private String enrollDate;
	private String diagnosisContent;
	private String surgery;
	private String enter;
	private String status;
	private String surgeryNo2;
	private String diseaseCode;
	private int empNo;
	private int fee;
	private String disease;
	private String deptName;
	private String checkSurgery;
	private String period;
	
	//수술실 예약 조회
	private String patientName;
	private String docName;
	private String leadTime;
	private String roomName;
	private String surgeryDate;
	private String surEndTime;
	private String surStartTime;
	private String surDate;
	private String memo;
	private int bookingNo;
	
	//입원실 예약 조회
	private int pbookingNo;
	private int proomNo;
	private String proomName;
	private String enterDate;
	private String leaveDate;
	private String pmemo;
	private String patientStatus;
	
	//진료 상태 조회
	private String gender;
	private int age;
	private String idNo;

}
