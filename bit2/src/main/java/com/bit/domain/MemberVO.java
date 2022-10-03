package com.bit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhoneNum;
	private String memberEmail;
	private String memberAddress;
	private int memberAccount;
	private int memberPosition;
	private Date joinDate;
	private String memberBirth;
	private String memberGender;
	private int orderCount;
}
