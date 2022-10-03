package com.bit.mapper;

import java.util.List;

import com.bit.domain.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	public void register(MemberVO vo);
	
	// 로그인
	public MemberVO memberLogin(MemberVO member); 
	
	// 내 정보 가져오기
	public MemberVO myInfo(MemberVO member) throws Exception;
	
	// 내 정보 수정
	public int updateMyInfo(MemberVO member);
	
	// 비밀번호 재발급 신청
	public MemberVO findPw(MemberVO member);
	
	// 재발급 받은 비밀번호로 변경
	public void updatePw(MemberVO member);
	
	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
	
	public MemberVO read(String MemberID);
	
	public int delete(String MemberID);
}
