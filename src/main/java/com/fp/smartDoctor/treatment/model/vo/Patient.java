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

	private String chartNo;
	private String lastDep;
	private String patientName;
	private String idNo;
	private String address;
	private String memo;
	private String firstVisit;//varchar로 안바꿔도 되나요? // 변경할게요!(테이블 지우고 변경하고 데이터 임폿해야해서 민주랑 상의하겠습니다)
	private String lastVisit;
	private String phone;
	private String protector;
	private String newOne;//초진내진여부
	private int age;
	private String gender;

}
