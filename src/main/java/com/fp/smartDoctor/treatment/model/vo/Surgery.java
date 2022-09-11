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
public class Surgery {
	private String surgeryNo;
	private String surgeryName;
	private String period;//입원기간
	private String sPayment;
	private String leadTime;//소요시간
	
	

}
