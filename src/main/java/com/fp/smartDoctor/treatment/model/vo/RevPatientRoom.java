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
public class RevPatientRoom {
	private int pbookingNo;
	private int proomNo;
	private int clinicNo;
	private String roomName;
	private String enterDate;
	private String leaveDate;
	private String memo;
	private String patientStatus;
	private int stayDate; //입원기간
	
}
