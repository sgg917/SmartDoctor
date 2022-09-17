package com.fp.smartDoctor.sign.model.vo;

import java.util.ArrayList;

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
public class Line {
	
	private int lineNo;
	private int lineLevel;
	private String lineStatus;
	private String lineComment;
	private String lineDisappr;
	private String lineRefer;
	private int empNo;
	private int apprNo;
	private String lineDate;
	private String empName;
	private String jobName;
	private ArrayList<Line> lineList;
	private ArrayList<Line> RefList;
	private int apprNow;
	
}
