package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;

public interface NoticeService {
	//공지사항 등록
	public void NoticeInsert(NoticeVO notice);
	
	// 공지사항 목록 
    public List<NoticeVO> noticeGetList(Criteria cri) throws Exception;
	
    // 공지사항 총 수 
    public int noticeGetTotal(Criteria cri) throws Exception;
    
    // 공지사항 상세페이지
	public NoticeVO noticeGetDetail(int noticeNumber) throws Exception;
	
	//공지사항 수정
	public int noticeModify(NoticeVO notice)throws Exception;
	
	//공지사항 삭제
	public int noticeDelete(int noticeNumber);
}
