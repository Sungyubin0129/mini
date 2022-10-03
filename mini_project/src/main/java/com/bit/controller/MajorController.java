package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.domain.Criteria;
import com.bit.domain.FinalVO;
import com.bit.domain.MyMajorVO;
import com.bit.domain.PageDTO;
import com.bit.service.MajorService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MajorController {
	@Autowired
	public MajorService service; 
	
	// 희망강좌선택
	@RequestMapping(value="/insertMyMajor", method=RequestMethod.POST)
	public String insertMajorPost(MyMajorVO major) throws Exception {
		service.selectMyMajor(major); // 선택한 강좌 DB에 등록		
		return "redirect:/selectSubject";
	}
	
	// 선택한 강좌 리스트 뽑아오기 (선택목록메뉴)
	@RequestMapping(value="/mySelectList", method= {RequestMethod.POST, RequestMethod.GET})
	public String mySelectList(MyMajorVO vo, HttpServletRequest request) throws Exception {
		List myList = service.myMajorList(vo);
		HttpSession session = request.getSession();
		session.setAttribute("myList", myList);		
		return "redirect:/subjectList";
	}
	
	// 선택한 강좌 목록에서 삭제
	@RequestMapping(value="/deleteMyMajor", method=RequestMethod.POST)
	public String deleteMyMajorPost(MyMajorVO vo, HttpServletRequest request) throws Exception {
		service.deleteMyMajor(vo);	
		List myList = service.myMajorList(vo);
		HttpSession session = request.getSession();
		session.setAttribute("myList", myList);
		return "redirect:/subjectList";
	}
	
	// 최종수강신청
	@RequestMapping(value="/enrolment", method=RequestMethod.POST)
	public String finalDecisionPost(FinalVO vo, HttpServletRequest request) throws Exception {
		service.finalDecision(vo);
		HttpSession session = request.getSession();
		session.setAttribute("checkOK", service.checkOK(vo));
		return "redirect:/mainAfterLogin";
	}
	
	// 강좌검색처리
	@GetMapping("/selectSubject.do")
	public void searchMajorGet(Criteria cri, Model model) {
	      
	    List list= service.getMajorList(cri);
	      
	    if (!list.isEmpty()) {
	       model.addAttribute("list", list); // 게시물 존재 경우
	    } else {
	       model.addAttribute("listCheck", "empty"); // 게시물 존재하지 않을 경우
	    }

	    model.addAttribute("pageMaker", new PageDTO(cri, service.MajorGetTotal(cri)));
	}   
}
	