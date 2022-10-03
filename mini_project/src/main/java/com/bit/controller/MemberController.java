package com.bit.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.domain.FinalVO;
import com.bit.domain.MemberVO;
import com.bit.service.MajorService;
import com.bit.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@RequestMapping("/")
public class MemberController {
	@Autowired
	public MemberService service; 
	
	@Autowired
	public MajorService majorService;
	
	// 로그인 기능
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginMain(HttpServletRequest request, MemberVO member, FinalVO finalVO, RedirectAttributes rttr) throws Exception {
		
		log.info("로그인 메소드 진입");
		HttpSession session = request.getSession();
		MemberVO vo = service.memberLogin(member);
		
		if(vo == null) { // 아이디, 비밀번호 일치하지 않을 때
			log.info("refuse");
			int result = 0;
			rttr.addFlashAttribute("result", result);
			
			return "redirect:/";
		}
		
		if(vo.getMemberClass() == 1) { // 매니저가 로그인했을때
			log.info("Manager");
			session.setAttribute("member", vo);
			return "redirect:/mainManager";
		} else {
			// 아이디, 비밀번호 일치할 경우
			log.info("ok");
			session.setAttribute("member", vo);
			session.setAttribute("checkOK", majorService.checkOK(finalVO));
			return "redirect:/mainAfterLogin";
		}
	}
	
	// 로그아웃 기능
	@GetMapping("/logout")
    public String logout(HttpSession session){
		
        session.invalidate();
        return "redirect:/";
    }
	
	// 내 정보 수정 기능
	@RequestMapping(value="/editMyInfo.do", method=RequestMethod.POST)
	public String updateMyInfo(MemberVO vo, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		int result=service.updateMyInfo(vo); // 내 정보 수정 
		/*
		 * service.myInfo(vo); // 수정된 내 정보 가져오기
		 */
		rttr.addFlashAttribute("member",result);
		
		//session.setAttribute("member", vo);
		return "redirect:/myInfo";
	}
	
	// 회원가입 기능
	@Autowired
	private JavaMailSender mailSender;
	   
	   @RequestMapping(value="/joinMember",method=RequestMethod.POST)
	   public String joinPost(MemberVO member) throws Exception {
	      
	      service.register(member);
	     
	      return"redirect:/";
	   }
	   
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception{
	      
	    log.info("이메일 확인 "+email);
	      
	    // 인증번호(난수) 생성
	    Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    log.info("인증번호 " + checkNum);
	      
	    /* 이메일 보내기 */
	    String setFrom = "wjdvnadldzm@naver.com";
	    String toMail = email;
	    String title = "회원가입 인증 이메일 입니다.";
	    String content = 
	          "홈페이지를 방문해주셔서 감사합니다." +
	          "<br><br>" + 
	          "인증 번호는 " + checkNum + "입니다." + 
	          "<br>" + 
	          "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";   
	      
	    try {
	         
	       MimeMessage message = mailSender.createMimeMessage();
	       MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	       helper.setFrom(setFrom);
	       helper.setTo(toMail);
	       helper.setSubject(title);
	       helper.setText(content,true);
	       mailSender.send(message);
	         
	    }catch(Exception e) {
	       e.printStackTrace();
	    }      
	    String num=Integer.toString(checkNum);
	      
	    return num;
	}
	
	// 비밀번호 재발급 신청(아이디, 이메일 일치여부 확인)
	@RequestMapping(value="/findPw.do", method=RequestMethod.POST)
	public String findPwPost(MemberVO member, Model model, HttpServletRequest request) {
		MemberVO list = service.findPw(member);
		HttpSession session = request.getSession();
		
		if (list.getMemberPW().equals("null")) { // 조건 해결 안됨
			model.addAttribute("listCheck", "none");
			return "/findPw";
		} else {
			session.setAttribute("list", list);
			return "redirect:/findPw";
		}
	}
	
	// 비밀번호 재발급
	@ResponseBody
	@RequestMapping(value="/emailPw", method=RequestMethod.GET)
	public String emailPwGET(String email, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		// 새로운 비밀번호 생성
		Random random = new Random();
		int newPw = random.nextInt(888888) + 111111;
		    log.info("인증번호 " + newPw);
		      
		// 이메일 보내기
		String setFrom = "wjdvnadldzm@naver.com";
		String toMail = email;
		String title = "땡땡대학교 비밀번호 재발급";
		String content = 
				"땡떙대학교 비밀번호 재발급입니다." +
		        "<br><br>" + 
		        "새로운 비밀번호는 " + newPw + "입니다." + 
		        "<br>" + 
		        "로그인 후 원하시는 비밀번호로 변경해주시길 바랍니다.";   
		      
		try {
		        
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		    helper.setFrom(setFrom);
		    helper.setTo(toMail);
		    helper.setSubject(title);
		    helper.setText(content,true);
		    mailSender.send(message);
		         
		}catch(Exception e) {
			e.printStackTrace();
		} 
		
		String num=Integer.toString(newPw);
		session.setAttribute("newPw", num);
		
		return "redirect:/findPw";
	}
	
	// 재발급 받은 비밀번호로 변경
	@RequestMapping(value="/updatePw.do", method={RequestMethod.GET, RequestMethod.POST})
	public String updatePwDoPost(MemberVO member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		service.updatePw(member);
		session.invalidate();
		return "redirect:/";
	}
	
}
