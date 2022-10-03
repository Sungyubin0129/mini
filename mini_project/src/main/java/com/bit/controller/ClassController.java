package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.Criteria;
import com.bit.domain.MajorVO;
import com.bit.domain.PageDTO;
import com.bit.service.ClassService;

@Controller
public class ClassController {
	@Autowired
	public ClassService classservice;
	
	// 강좌관리 페이지 이동 + 강좌목록 띄우기
	@RequestMapping(value = "/managerClass", method = RequestMethod.GET)
	public void classListGet(Criteria cri, HttpServletRequest request) throws Exception {
		
		List list = classservice.classGetList(cri);
		HttpSession session = request.getSession();

		if (!list.isEmpty()) {
			session.setAttribute("classList", list); // 게시물 존재 경우
		} else {
			session.setAttribute("listCheck", "empty"); // 게시물 존재하지 않을 경우
		}

		session.setAttribute("pageMaker", new PageDTO(cri, classservice.classGetTotal(cri)));
	}
	
	// 강좌 추가하기 페이지
	@RequestMapping(value = "/classInsert", method = RequestMethod.GET)
	public void noticeInsertGet() throws Exception {

	}
	
	// 강좌 추가하기
	@RequestMapping(value = "/classInsert.do", method = RequestMethod.POST)
	public String noticeInsertPost(MajorVO major) throws Exception {

		classservice.classInsert(major);
			
		// 뷰(View)로 전송된 데이터가 일회성으로 사용되도록 addFlashAttriubte 메서드를 사용한다.
		// 등록에 성공하면 메시지가뜬다 작성자 이름으로
		return "redirect:/managerClass";
	}
	
	// 기존강좌 삭제 
	@PostMapping("/classDelete")
	public String classDeletePost(int MajorCode) {
		int result = classservice.classDelete(MajorCode);
		return "redirect:/managerClass";
	}
}
