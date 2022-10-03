package com.bit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNumber;
	private	String noticeName;
	private	String noticeWriter;
	private String noticeValue;
	private Date noticeDate;
}
