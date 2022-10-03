package com.bit.service;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.MajorVO;

public interface ClassService {
	
	//신규강좌 등록
	public void classInsert(MajorVO major);
	
	//강좌 목록
	public List<MajorVO> classGetList(Criteria cri) throws Exception;
	
	//강좌 총수
	public int classGetTotal(Criteria cri) throws Exception;
	
	//강좌 삭제
	public int classDelete(int MajorCode);
}
