package com.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bit.domain.MemberVO;

public interface MemberService {
	
	//로그인 메소드
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	//회원가입 메소드
	public void register(MemberVO member) throws Exception;
	
	//내 정보 가져오기
	public MemberVO myInfo(MemberVO member) throws Exception; 
	
	//내 정보 수정
	public int updateMyInfo(MemberVO member);
	
	// 비밀번호 재발급 신청
	public MemberVO findPw(MemberVO member);
	
	// 재발급 받은 비밀번호로 변경
	public void updatePw(MemberVO member);
	
	public MemberVO get(String MemberID);
	
	public boolean modify(MemberVO member);
	
	public boolean remove(String MemberID);
	
	public List<MemberVO> getList();
}
