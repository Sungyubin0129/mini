package com.bit.mapper;

import java.util.List;

import com.bit.domain.Criteria;
import com.bit.domain.MajorVO;

public interface ClassMapper {
	
	//신규강좌 등록
	public void classInsert(MajorVO major);
	
	//강좌 목록
	public List<MajorVO> classGetList(Criteria cri);
	
	//강좌 총수
	public int classGetTotal(Criteria cri);
	
	//강좌 삭제
	public int classDelete(int MajorCode);
}
