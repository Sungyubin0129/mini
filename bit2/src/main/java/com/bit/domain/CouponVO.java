package com.bit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {
	private String memberID;
	private int couponType;
	private Date ExpirationPeriod;
}
