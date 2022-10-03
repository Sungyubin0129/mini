package com.bit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bit.domain.MemberVO;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)
	throws Exception{
		
		System.out.println("LoginInterceptor preHandle 작동");
	        
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
	// preHandle() 메서드 구현부에 세션을 제거해주는 코드를 추가한다.
	// preHandle이 정상적으로 작동했는지 확인하기 위해서 println() 메서드를 호출한다. 
	// println() 메서드는 정상적으로 실행이 되는지 확인 후 주석 처리하거나 삭제한다.
	
}
