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
public class MailCount {

	private int notReadMail;
	private int fromMail;
	private int importMail;
	
}
