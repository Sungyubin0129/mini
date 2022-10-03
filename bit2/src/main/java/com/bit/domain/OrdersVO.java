package com.bit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	private int orderID;
	private int deliveryFee;
	private String productName;
	private Date orderDate;
	private String memberID;
}
