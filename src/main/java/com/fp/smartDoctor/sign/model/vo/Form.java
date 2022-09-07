package com.fp.smartDoctor.sign.model.vo;

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
public class Form {

	private int formNo;
	private String formTitle;
	private String formContent;
	private String formType;
	private String formStatus;
	private String enrollDate;
	private String modifyDate;
	private String formInfo;
	private String formDel;
	
}
