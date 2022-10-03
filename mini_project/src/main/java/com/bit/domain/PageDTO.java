package com.bit.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	// 페이지 시작 번호 
    private int pageStart;
    
    // 페이지 끝 번호 
    private int pageEnd;
    
    // 이전, 다음 버튼 존재 유무 
    private boolean next, prev;
    
    // 행 전체 개수 
    private int total;
    
    // 현재페이지 번호(pageNum), 행 표시 수(amount), 검색 키워드(keyword), 검색 종류(type) 
    private Criteria cri;
	
    
    // 생성자(클래스 호출 시 각 변수 값 초기화) 
    public PageDTO(Criteria cri, int total) {
        
        // cri, total 초기화 
        this.cri = cri;
        this.total = total;
        
        // 페이지 끝 번호 
        this.pageEnd = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        //Math.ceil() : 소수점 이하를 올림한다.
        
        // 페이지 시작 번호 
        this.pageStart = this.pageEnd - 9;
        
        // 전체 마지막 페이지 번호 
        int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount())); 
        
        // 전체 마지막 페이지(realEnd)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정
        if(realEnd < this.pageEnd) {
            this.pageEnd = realEnd;
        }
        //이전 페이지 존재 여부 경우 시작페이지가 1보다 크다면 존재하는거이기 때문에 startpage >1 이면 true가 저장되고 
        // 화면에 1부터 10페이지가 보이는 경우를 제외하면 시작 페이지가 모두 10보다 크기때문에 그 이전 10개의 번호페이지로 이동할수있는 이전페이지 버튼이 존재하고 보여야한다.
        //다음 페이지 존재 여부 경우 전체 페이지 마지막 번호 realEnd보다 화면에 보이는 마지막 번호 endPage가 작다면 존재하기때문에 end<real 이면 true가 되도록한다. 
        
        //   시작 페이지(startPage)값이 1보다 큰 경우 true 
        this.prev = this.pageStart > 1;
        
        //  마지막 페이지(endPage)값이 1보다 큰 경우 true 
        this.next = this.pageEnd < realEnd;
        
    }
	
}
