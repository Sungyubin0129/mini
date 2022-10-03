package com.bit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewID;
	private String productName;
	private String memberID;
	private String reviewValue;
	private Date regDate;	
	private Date updateDate;
	private String reviewTitle;
	private int starRating;
	
}
