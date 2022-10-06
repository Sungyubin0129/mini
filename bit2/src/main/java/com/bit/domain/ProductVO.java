package com.bit.domain;

import lombok.Data;

@Data
public class ProductVO {
	private String productName;
	private int productQuantity;
	private String productDetail;
	private int productPrice;
	private String brand;
	private String productThumbnail;
	private int ThumbsUp;
	private String productColor;
	private String productGender;
	private String productSeason;
	private String productSize;
}
