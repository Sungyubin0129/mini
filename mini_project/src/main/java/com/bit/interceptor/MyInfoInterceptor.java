package com.bit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bit.domain.MemberVO;

public class MyInfoInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)
	throws Exception{
		
		System.out.println("MyInfoInterceptor preHandle 작동");
	        
	    HttpSession session = request.getSession();
	   
	    MemberVO lvo = (MemberVO)session.getAttribute("member");
	    
	    if(lvo == null) { // 계정이 없는 경우
            
            response.sendRedirect("/");    // 메인페이지로 리다이렉트
            
            return false;
	    }
	    
	    else {
	    	return true;
	    }
 
	}
}
