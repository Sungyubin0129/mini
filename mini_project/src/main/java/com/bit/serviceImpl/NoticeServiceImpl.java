package com.bit.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;
import com.bit.mapper.NoticeMapper;
import com.bit.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeMapper mapper;
	
	// 신규 공지사항 등록
	@Override
	public void NoticeInsert(NoticeVO notice) {
		mapper.NoticeInsert(notice);
	}
	
	// 공지사항 목록 출력
	@Override
	public List<NoticeVO> noticeGetList(Criteria cri) throws Exception {
		log.info("servicegetlist"+cri);
		return mapper.noticeGetList(cri); 
	}
	
	// 공지글 개수
	@Override
	public int noticeGetTotal(Criteria cri) throws Exception {
		return mapper.noticeGetTotal(cri);
	}

	@Override
	public NoticeVO noticeGetDetail(int noticeNumber) throws Exception {
		System.out.println("여기는 서비스 임플리"); 
		return mapper.noticeGetDetail(noticeNumber);
	}

	@Override
	public int noticeModify(NoticeVO notice) throws Exception {
		log.info("service and noticeModify -> "+notice);
		return mapper.noticeModify(notice);
	}

	@Override
	public int noticeDelete(int noticeNumber) {
		log.info("delete 호출");
		return mapper.noticeDelete(noticeNumber);
	}
}
