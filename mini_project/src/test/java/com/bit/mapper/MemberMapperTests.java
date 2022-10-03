package com.bit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.domain.Criteria;
import com.bit.domain.MemberVO;
import com.bit.domain.NoticeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private NoticeMapper noticemapper;
	
//	//Mapper 로그인 메소드 테스트
//	@Test
//	public void memberLogin() throws Exception {
//		MemberVO member = new MemberVO();
//		
//		// 올바른 아이디, 비밀번호일 경우
//		member.setMemberID("17126516");
//		member.setMemberPW("1234");
//		
//		// 올바르지 않은 아이디, 비밀번호일 경우
//		//member.setMemberID("17126588");
//		//member.setMemberPW("12345");
//		
//		mapper.memberLogin(member);
//		System.out.println("결과 값 : " + mapper.memberLogin(member));
//		log.info("결과 값 : " + mapper.memberLogin(member));
//	}
	
	
	 @Test public void authorGetListTest() throws Exception {
	  
	  Criteria cri = new Criteria(3, 11); // 3페이지 & 10개 행 표시 cri.setKeyword("관리자");
	  List<NoticeVO> list = noticemapper.noticeGetList(cri);
	  
	  for (int i = 0; i < list.size(); i++) { System.out.println("list" + i +
	  ".........." + list.get(i)); }
	  
	  }
}
