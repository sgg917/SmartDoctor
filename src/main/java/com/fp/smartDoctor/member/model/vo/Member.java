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
public class Member {
	
	private int empNo;
	private String empName;
	private String empPwd;
	private String phone;
	private String email;
	private String originName;
	private String path;
	private String status;
	private int vacAll;
	private int jobNo;
	private int deptNo;
	private String jobName;
	private String deptName;

}
