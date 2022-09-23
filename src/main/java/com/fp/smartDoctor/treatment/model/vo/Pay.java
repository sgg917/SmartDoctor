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
public class Pay {

	private String payNo;
	private String clinicNo;
	private String surgeryNo;
	private String meals;
	private String status;
	private String payDate;
	private int enterFee;
}
