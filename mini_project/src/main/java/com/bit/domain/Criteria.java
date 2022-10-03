package com.bit.domain;

import java.util.Arrays;

public class Criteria {
   
   //현재 페이지
   private int pageNum;
   
   //페이지 표시
   private int amount;
   
   //검색 리스트
   private String[] MajorArr;
   
   //카테고리 키워드
   private String catecode;
   
   
   //페이지 skip?
   private int skip;
   
   //검색 타입
   private String type;
   
   public String[] getMajorArr() {
      return MajorArr;
   }

   public void setMajorArr(String[] majorArr) {
      MajorArr = majorArr;
   }

   public String getCatecode() {
      return catecode;
   }

   public void setCatecode(String catecode) {
      this.catecode = catecode;
   }

   //검색 키워드
   private String keyword;
   
   //criteria 생성자
   public Criteria(int pageNum, int amount) {
           this.pageNum = pageNum;
           this.amount = amount;
           this.skip = (pageNum -1) * amount;
   }
   
   // Criteria 기본 생성자 
    public Criteria(){
        this(1,10);
    }
    
    /* 검색 타입 데이터 배열 변환 */
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }
      
   public int getPageNum() {
      return pageNum;
   }
   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
      this.skip= (pageNum -1 ) * this.amount;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
      this.skip=(this.pageNum -1) * amount;
   }
   public int getSkip() {
      return skip;
   }
   public void setSkip(int skip) {
      this.skip = skip;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getKeyword() {
      return keyword;
   }
   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }

   @Override
   public String toString() {
      return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", MajorArr=" + Arrays.toString(MajorArr)
            + ", catecode=" + catecode + ", skip=" + skip + ", type=" + type + ", keyword=" + keyword + "]";
   }
   
   
}