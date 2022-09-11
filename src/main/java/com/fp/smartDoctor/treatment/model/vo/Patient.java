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
public class Patient {

	private int chartNo;
	private int lastDep;
	private String patientName;
	private String idNo;
	private String address;
	private String memo;
	private String firstVisit;//varchar로 안바꿔도 되나요?
	private String lastVisit;
	private String phone;
	private String protector;
	private String newOne;//초진내진여부

}
