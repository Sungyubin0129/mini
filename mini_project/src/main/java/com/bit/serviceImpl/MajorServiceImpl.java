package com.bit.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.domain.Criteria;
import com.bit.domain.FinalVO;
import com.bit.domain.MajorVO;
import com.bit.domain.MyMajorVO;
import com.bit.mapper.MajorMapper;
import com.bit.service.MajorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MajorServiceImpl implements MajorService {
	@Autowired
	private MajorMapper mapper;
	
	// 강좌 목록 출력
	@Override
	public List<MajorVO> majorList(Criteria cri) throws Exception {
		return mapper.majorList(cri);
	};
	
	// 개설강좌 수
	@Override
	public int majorTotal(Criteria cri) throws Exception {
		return mapper.majorTotal(cri);
	};
	
	// 희망 강좌 선택
	@Override
	public void selectMyMajor(MyMajorVO vo) {
		mapper.selectMyMajor(vo);
	};
	
	// 내가 선택한 강좌 출력
	@Override
	public List<MyMajorVO> myMajorList(MyMajorVO vo) throws Exception {
		return mapper.myMajorList(vo);
	};
	
	// 목록에서 선택한 강좌 삭제
	@Override
	public void deleteMyMajor(MyMajorVO vo) {
		mapper.deleteMyMajor(vo);
	};
	
	// 최종수강신청
	@Override
	public void finalDecision(FinalVO vo) {
		mapper.finalDecision(vo);
	}
	
	// 수강신청여부확인
	@Override
	public FinalVO checkOK(FinalVO vo) throws Exception {
		return mapper.checkOK(vo);
	}
	
	@Override
	public List<MajorVO> getMajorList(Criteria cri) {
	      // 이 검색의 조건은 강좌이름을 검색할때? 이루어 진다. 
	      log.info("-GET MAJOR LIST 출력-");
	      
	      String type=cri.getType();
	      String[] typeArr= type.split("");
	      //>> 뭔지 모르겠음 ?? type.split을 왜 쓰는지 
	      String[] majorArr = mapper.getMajorNameList(cri.getKeyword());
	      
	      if(type.equals("M")|| type.equals("MD")||type.equals("MDT")||type.equals("MDTL") ||type.equals("MDTLG")) {
	         if(majorArr.length == 0) {
	            return new ArrayList();
	         }
	      }
	      
	      for(String t : typeArr) {
	         if(t.equals("M")) {
	            cri.setMajorArr(majorArr);
	         }
	      }
	      return mapper.getMajorList(cri);
	   }

	   @Override
	   public int MajorGetTotal(Criteria cri) {
	      // TODO Auto-generated method stub
	      
	      return mapper.MajorGetTotal(cri);
	   }
}
