package com.fp.smartDoctor.reception.model.vo;

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
public class Receipt {

	private String payNo;
	private String clinicNo;
	private String patientName;
	private String enrollDate;
	private String enterDate;
	private String leaveDate;
	private String fee;
	private String enterFee;
	private String surgeryFee;
	private String chartNo;
	private String meals;
	private String disease;
	private String surgeryName;
	private String total;
	
	
}
