package com.bit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.domain.Criteria;
import com.bit.domain.MyMajorVO;
import com.bit.domain.PageDTO;
import com.bit.service.MajorService;
import com.bit.service.MemberService;

@Controller
//@RequestMapping("/")
public class MainController {
	@Autowired
	public MemberService service;
	
	@Autowired
	public MajorService majorService; 
	
	//서버 시작 시 메인 페이지 이동
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String loginPageGET() {
		
		return "mainBeforeLogin";
		
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value="/joinMember", method=RequestMethod.GET)
	public String joinMemberPageGET() {
		
		return "joinMember";
		
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String findPwPageGET() {
		
		return "findPw";
		
	}
	
	//로그인 성공 시 메인페이지 이동
	@RequestMapping(value="/mainAfterLogin", method=RequestMethod.GET)
	public String mainPageGET() {
		
		return "mainAfterLogin";
		
	}
	
	//매니저 로그인 시 매니저 페이지 이동
	@RequestMapping(value="/mainManager", method=RequestMethod.GET)
	public String managerPageGET() {
		
		return "mainManager";
		
	}
	
	//내 정보수정 페이지 이동
	@RequestMapping(value="/editMyInfo", method=RequestMethod.GET)
	public String editMyInfoPageGET() {
		
		return "editMyInfo";
		
	}
	
	//내 정보페이지 이동
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public String myInfoPageGET() throws Exception {
		
		return "myInfo";
		
	}
	
	//강좌선택 페이지 이동
	@RequestMapping(value="/selectSubject", method=RequestMethod.GET)
	public String selectSubjectPageGET(Criteria cri, Model model) throws Exception {
		
		List list = majorService.majorList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, majorService.majorTotal(cri)));
		
		return "selectSubject";
		
	}
	
	//선택한 강좌목록 페이지 이동
	@RequestMapping(value="/subjectList", method = RequestMethod.GET)
	public String subjectListPageGET() throws Exception {
		
		return "subjectList";
	}
	
	//최종 수강신청 페이지 이동
	@RequestMapping(value="/finalDecision", method = RequestMethod.GET)
	public String finalDecisionPageGET() throws Exception {
		
		return "finalDecision";
	}
	
}
