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
public class Medicine {
	
	private String medNo; // 약 코드
	private String medName; // 약 이름
	private String dosetime; // 1일 투여 횟수

}
