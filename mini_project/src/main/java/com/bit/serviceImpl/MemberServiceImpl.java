package com.bit.serviceImpl;

import java.io.PrintWriter;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.bit.domain.MemberVO;
import com.bit.mapper.MemberMapper;
import com.bit.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		log.info("login...." + member);
		return mapper.memberLogin(member);
	}
	
	//회원가입
	@Override
	public void register(MemberVO member) throws Exception {
		log.info("register...." + member);
		mapper.register(member);
	}
	
	//내 정보
	@Override
	public MemberVO myInfo(MemberVO member) throws Exception {
		log.info("myinfo..." + member);
		return mapper.myInfo(member);
	}
	
	//내 정보 수정
	@Override
	public int updateMyInfo(MemberVO member) {
		log.info("editInfo..." + member);
		
		return mapper.updateMyInfo(member);
	};
	
	// 비밀번호 재발급 신청
	@Override
	public MemberVO findPw(MemberVO member) {
		return mapper.findPw(member);
	}
	
	// 재발급 받은 비밀번호로 변경
	@Override
	public void updatePw(MemberVO member) {
		mapper.updatePw(member);
	}
	
	@Override
	public List<MemberVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}
	
	@Override
	public MemberVO get(String MemberID) {
		log.info("get..."+ MemberID);
		return mapper.read(MemberID);
	}
	
	@Override
	public boolean remove(String MemberID) {
		log.info("remove..." + MemberID);
		return mapper.delete(MemberID) == 1;
	}

	@Override
	public boolean modify(MemberVO member) {
		// TODO Auto-generated method stub
		return false;
	}
}
