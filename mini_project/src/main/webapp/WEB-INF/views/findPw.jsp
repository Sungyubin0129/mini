<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/joinMember.css">
<title>비밀번호 찾기 페이지</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page='./includes/topBeforeLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerBeforeLogin.jsp'/>
	
	<!-- 비밀번호 찾기 컨텐츠 부분 -->
	<div class="wrap-contents">
		<h1><b>비밀번호 찾기</b></h1>
		<hr>
		<form id="findPw_form" method="post">
			<table class="join-table">
				<tr>
					<th>* 가입한 아이디</th>
					<td>
						<input type="text" name="MemberID" id="MemberID" placeholder="학번을 입력해주세요" class="input-form"/><br>
						<div class="valid">아이디 형식 : 8자리 숫자(학번)</div>
					</td>	
				</tr>	
				<tr>
					<th>* 가입한 이메일</th>
					<td>
						<input type="text" name="MemberEmail" id="MemberEmail" placeholder="이메일을 입력해주세요" class="input-form"/><br>
						<c:if test="${listCheck eq 'none'}">
							<div class="incorrect">아이디 혹은 이메일을 확인해주세요</div>
						</c:if>
						<c:if test="${not empty list}">
							<div class="vaild" style="color:green; font-size:12px;">가입된 회원입니다</div>
						</c:if>
					</td>				
				</tr>
			</table>
			<button type="button" id=checkList class="btn btn-primary" style="margin-top:50px; margin-right:150px; float:right;">가입여부확인</button>
			<c:if test="${not empty list}">
				<button type="button" id=findBtn class="btn btn-primary" style="margin-top:50px; margin-right:20px; float:right;">비밀번호 재발급</button>
			</c:if>
			<button type="button" id=login-home class="btn btn-primary" style="margin-top:50px; margin-right:20px; float:right;">로그인 화면</button>
		</form>
	</div>
	
	<!-- 재발급 된 비밀번호 컨트롤러로 전송 -->
	<form id="updatePw-form" method="post">
		<input id="MemberPW" name="MemberPW" type="text" hidden="hidden" value="${newPw}">
		<input id="MemberID" name="MemberID" type="text" hidden="hidden" value="${list.memberID}">
		<input id="MemberEmail" name="MemberEmail" type="text" hidden="hidden" value="${list.memberEmail}">
	</form>
	
	<!-- JS 부분 -->
	
	<!-- 로그인 전 메뉴 접근 불가능 -->
	<script>
		$(".menu_button").click(function(){
			alert("로그인이 필요합니다.");
			return false;
		});
	</script>
	
	<!-- 가입여부확인 버튼 동작 -->
	<script>
		$("#checkList").click(function(){
			
			// 유효성 검사 : 공백여부
			if($("#MemberID").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#MemberID").focus();
				return false;
			}
			
			if($("#MemberEmail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#MemberEmail").focus();
				return false;
			}   
			
	        $("#findPw_form").attr("action", "/findPw.do");      
	        $("#findPw_form").submit();
		});
	</script>
	
	<!-- 비밀번호 찾기 버튼 동작 -->
	<script>
		var code = ""; // 이메일으로 전송한 비밀번호 저장 변수
		
		$("#findBtn").click(function(){
			
			// 유효성 검사 : 공백여부
			if($("#MemberID").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#MemberID").focus();
				return false;
			}
			
			if($("#MemberEmail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#MemberEmail").focus();
				return false;
			}
			
			var email=$("#MemberEmail").val(); // 입력한 이메일
			
	       	$.ajax({   	
	        	type:"GET",
	           	url:"emailPw?email="+email,
	           	success:function(data){
	                code = data;
	           	}   
	       	});    
			
			alert("새로운 비밀번호가 이메일로 전송되었습니다.");
		});
	</script>
	
	<!-- 로그인 화면 버튼 동작 -->
	<script>		
		$("#login-home").click(function(){  
	        $("#updatePw-form").attr("action", "/updatePw.do");      
	        $("#updatePw-form").submit();
		});
	</script>

</body>
</html>