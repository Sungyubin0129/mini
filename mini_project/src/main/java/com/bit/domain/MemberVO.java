package com.bit.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String MemberID;
	private String MemberPW;
	private String MemberName;
	private String MemberPhoneNum;
	private String MemberEmail;
	private String MemberAddress;
	private String MemberGender;
	private int MemberGrade;
	private String MemberMajor;
	private int MemberMajorPoint;
	private int MemberClass;
}
