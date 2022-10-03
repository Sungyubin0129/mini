package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.FinalVO;
import com.bit.domain.MajorVO;
import com.bit.domain.MyMajorVO;

public interface MajorService {
	
	// 강좌 목록 출력
	public List<MajorVO> majorList(Criteria cri) throws Exception;
	
	// 개설강좌 수 구하기
	public int majorTotal(Criteria cri) throws Exception;
	
	// 희망 강좌 선택
	public void selectMyMajor(MyMajorVO vo);
	
	// 내가 선택한 강좌 출력
	public List<MyMajorVO> myMajorList(MyMajorVO vo) throws Exception;
	
	// 목록에서 선택한 강좌 삭제
	public void deleteMyMajor(MyMajorVO vo);
	
	// 최종수강신청
	public void finalDecision(FinalVO vo);
	
	// 수강신청여부확인
	public FinalVO checkOK(FinalVO vo) throws Exception;
	
	//수강신청 검색
	public List<MajorVO> getMajorList(Criteria cri);
	   
	//강좌 총 검색
	public int MajorGetTotal(Criteria cri);
	   
}
