package com.fp.smartDoctor.messenger.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchCondition {
	
	private String mailTitle;
	private String mailContent;
	private String mailnameFrom;
	private String mailnameTo;
	private String mailTo;
	private String mailFrom;
	private String mailOwn;
}