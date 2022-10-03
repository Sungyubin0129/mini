package com.bit.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.MajorVO;
import com.bit.mapper.ClassMapper;
import com.bit.service.ClassService;

@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	ClassMapper mapper;
	
	//신규강좌 등록
	@Override
	public void classInsert(MajorVO major) {
		mapper.classInsert(major);
	}
	
	//강좌 목록
	@Override
	public List<MajorVO> classGetList(Criteria cri) throws Exception {
		return mapper.classGetList(cri);
	}
	
	//강좌 총수
	@Override
	public int classGetTotal(Criteria cri) throws Exception {
		return mapper.classGetTotal(cri);
	}
	
	//강좌 삭제
	@Override
	public int classDelete(int MajorCode) {
		return mapper.classDelete(MajorCode);
	}
}
