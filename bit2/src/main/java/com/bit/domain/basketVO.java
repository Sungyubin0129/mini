package com.bit.domain;

import lombok.Data;

@Data
public class basketVO {
	private String memberID;
	private String productName;
	private int productPrice;
	private String productThumbnail;
	private int orderQuantity;
}
