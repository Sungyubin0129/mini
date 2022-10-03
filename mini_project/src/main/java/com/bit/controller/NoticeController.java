package com.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.Criteria;
import com.bit.domain.NoticeVO;
import com.bit.domain.PageDTO;
import com.bit.service.MemberService;
import com.bit.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	
	@Autowired
	public MemberService memberservice;

	@Autowired
	public NoticeService noticeservice;
	
	// 공지관리 페이지 이동 + 공지게시물 목록 띄우기
	@RequestMapping(value = "/managerNotice", method = RequestMethod.GET)
	public void noticeListGet(Criteria cri, HttpServletRequest request) throws Exception {
		log.info("공지 관리 페이지 이동");
		
		List list = noticeservice.noticeGetList(cri);
		HttpSession session = request.getSession();

		if (!list.isEmpty()) {
			session.setAttribute("noticeList", list); // 게시물 존재 경우
		} else {
			session.setAttribute("listCheck", "empty"); // 게시물 존재하지 않을 경우
		}

		session.setAttribute("pageMaker", new PageDTO(cri, noticeservice.noticeGetTotal(cri)));
	}
		
	// 학생 공지페이지 이동 + 공지게시물 목록 띄우기
	@RequestMapping(value = "/studentNotice", method = RequestMethod.GET)
	public void noticeListGet2(Criteria cri, Model model) throws Exception {
		
		List list = noticeservice.noticeGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("noticeList", list); // 게시물 존재 경우
		} else {
			model.addAttribute("listCheck", "empty"); // 게시물 존재하지 않을 경우
		}
		model.addAttribute("pageMaker", new PageDTO(cri, noticeservice.noticeGetTotal(cri)));
	}

	// 공지사항 작성하기 페이지
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.GET)
	public void noticeInsertGet() throws Exception {
		log.info("공지 등록 페이지 이동");

	}
		
	// 공지사항 작성하기
	@RequestMapping(value = "/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsertPost(NoticeVO notice, RedirectAttributes rttr) throws Exception {
		log.info("게시물 입력" + notice);

		noticeservice.NoticeInsert(notice);
			
		rttr.addFlashAttribute("insert_result", notice.getNoticeName());
		// 뷰(View)로 전송된 데이터가 일회성으로 사용되도록 addFlashAttriubte 메서드를 사용한다.
		// 등록에 성공하면 메시지가뜬다 작성자 이름으로
		return "redirect:/managerNotice";
	}

	// 강좌관리 홈페이지
	@RequestMapping(value = "/classManager", method = RequestMethod.GET)
	public void classManagerGet() throws Exception {
		log.info("강좌 관리 페이지 이동");
	}
				

	// 게시물 상세보기 
	@GetMapping({"/noticeDetailList","/noticeModify","/noticeDetail"})
	public void noticeGetInfoGET(int noticeNumber,Criteria cri,Model model) throws Exception {
			
		log.info("공지사항 상세 페이지 이동"+noticeNumber);
			
		// 관리 페이지 넘어가기
		model.addAttribute("cri",cri);
		// 선택된 게시물 출력
		model.addAttribute("list", noticeservice.noticeGetDetail(noticeNumber));
			
	}
	
	// 게시물 수정 
	@PostMapping("/noticeModify")
	public String noticeModifyPost(NoticeVO notice, RedirectAttributes rttr) throws Exception{
		log.info("Post Modify ==> "+notice);	
		int result=noticeservice.noticeModify(notice);
		rttr.addFlashAttribute("modify_result", result);
		// addFlashAttribute로 전달한 값은 url뒤에 붙지않는다. 
		// addAttribute로 전달한 값은 url뒤에 붙으며 리프레쉬해도 데이터가 유지된다.
		return "redirect:/managerNotice";			 
		/* jsp에서 전달받은 데이터를 받기위해 vo로 파라미터로 받고 정보 수정후 관리 페이지로 이동할때 수정 성공여부를 alert한다.
		 * service noticeModify메서드를 호출하여 반환받은 결과값을 int result에 저장하고 
		 * 수정 성공 결과를 addflashattribute를 활용하여 value 속성명에 저장한다.
		 * redirect로 관리 페이지로 보낸다.
		 * */
	}
		
	// 게시물 삭제 
	@PostMapping("/noticeDelete")
	public String noticeDeletePost(int noticeNumber,RedirectAttributes rttr) {
		int result = noticeservice.noticeDelete(noticeNumber);
		rttr.addFlashAttribute("delete_result",result);
		return "redirect:/managerNotice";
	}
}
