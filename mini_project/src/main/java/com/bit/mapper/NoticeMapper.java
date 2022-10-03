package com.bit.mapper;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;

public interface NoticeMapper {
	
	//공지사항 등록
	public void NoticeInsert(NoticeVO notice);
	
	//공지사항 목록
	public List<NoticeVO> noticeGetList(Criteria cri);
	
	//공지게시물 총수
	public int noticeGetTotal(Criteria cri);
	
    //게시글 상세 
	public NoticeVO noticeGetDetail(int noticeNumber);
	
	//게시물 수정
	public int noticeModify(NoticeVO notice);
	
	//게시물 삭제
	public int noticeDelete(int noticeNumber);
	
}
