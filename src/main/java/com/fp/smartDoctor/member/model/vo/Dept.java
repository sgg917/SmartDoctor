package com.fp.smartDoctor.member.model.vo;

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
public class Dept {

	private int deptNo;
	private int upperNo;
	private String deptName;
	
	// level 컬럼
	private int level;
}
