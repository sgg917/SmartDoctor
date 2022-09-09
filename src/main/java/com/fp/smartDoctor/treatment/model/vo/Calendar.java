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
public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private String calendarStart;
	private String calendarEnd;
	private String textColor;
	private String backgroundColor;
	
    }

