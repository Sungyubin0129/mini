package com.bit.domain;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeID;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeValue;
}
