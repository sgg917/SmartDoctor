package com.fp.smartDoctor.reception.model.vo;

import java.util.ArrayList;

import com.fp.smartDoctor.treatment.model.vo.PreMed;

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
public class Prescription {
	
	private String preNo; // 처방전번호
	private String clinicNo; // 진료번호
	private String injectDay; // 총 투여일수
	private String usage; // 식전, 식후
	private String preDate; // 처방전 날짜(진료 접수 날짜)
	private String patientName; // 환자 이름
	private String idNo; // 환자 주민등록번호
	private String docNo; // 의사 번호(emp_no)
	private String docName; // 의사 이름
	private String diseasesCode; // 질병코드
	private String diseaseName; // 질병이름
	
	
	private ArrayList<PreMed> preMedList;
}
