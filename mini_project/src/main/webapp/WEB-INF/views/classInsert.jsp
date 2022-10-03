<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/managerNotice.css">
<link rel="stylesheet" href="/resources/css/joinMember.css">
<title>강좌 추가하기 페이지</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page='./includes/topManager.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerManagerClass.jsp'/>
	
	<!-- 강좌 추가하기 컨텐츠 -->
	<div class="wrap-contents">
		<h1><b>강좌 추가하기</b></h1>
		<hr>
		<form method="post" id="classForm">
			<table class="join-table">
					<tr>
						<th>* 강좌코드</th>
						<td>
							<input class="input-form" name="MajorCode" id="MajorCode" placeholder="강좌코드를 입력하세요.">
							<div class="valid">강좌코드 형식 : 4자리 숫자</div>
						</td>
					</tr>
					<tr>
						<th>* 강좌이름</th>
						<td>
							<input class="input-form" name="MajorName" id="MajorName" placeholder="강좌이름을 입력하세요.">
						</td>
					</tr>
					<tr>
						<th>* 강의시간</th>
						<td>
							<input class="input-form" name="MajorTime" id="MajorTime" placeholder="강의시간을 입력하세요.">	
							<div class="valid">Ex) 요일 + 123 or 456</div>
						</td>
					</tr>
					<tr>
						<th>* 강의실 위치</th>
						<td>
							<input class="input-form" name="MajorLocation" id="MajorLocation" placeholder="강의실을 입력하세요.">	
							<div class="valid">이용가능한 강의실: 종합강의동 / 공학관 / 창의예술관 / 자연과학관</div>
						</td>
					</tr>
					<tr>
						<th>* 권장학년</th>
						<td>
							<input class="input-form" name="TargetGrade" id="TargetGrade" placeholder="권장학년을 입력하세요.">
							<div class="valid">숫자만 입력</div>	
						</td>
					</tr>
					<tr>
						<th>* 학점</th>
						<td>
							<input class="input-form" name="GradePoint" id="GradePoint" placeholder="학점을 입력하세요.">
							<div class="valid">숫자만 입력</div>	
						</td>
					</tr>
					<tr>
						<th>* 인원제한</th>
						<td>
							<input class="input-form" name="MajorLimit" id="MajorLimit" placeholder="인원 수를 입력하세요.">
							<div class="valid">숫자만 입력</div>	
						</td>
					</tr>
					<tr>
						<th>* 교수이름</th>
						<td>
							<input class="input-form" name="Professor" id="Professor" placeholder="담당교수를 입력하세요.">	
						</td>
					</tr>
					<tr>
						<th>* 이수구분</th>
						<td>
							<input class="input-form" name="MajorDivision" id="MajorDivision" placeholder="이수구분을 입력하세요.">
							<div class="valid">이수구분 : 전필 / 전선 / 교필 / 교선</div>	
						</td>
					</tr>
			</table>
			<button type=button id="insertBtn" class="btn btn-primary" style="margin-bottom:20px; margin-top:20px; margin-right:180px; float:right;">작성완료</button>
			<button type=button id="cancelBtn" class="btn btn-primary" style="margin-bottom:20px; margin-top:20px; margin-right:20px; float:right;">목록가기</button>
		</form>
	</div>
	
	<!-- JS 부분 -->
	
	<!-- 등록 / 취소 버튼 동작 -->
	<script>
	
		// 등록 유효성 검사
		$("#insertBtn").click(function(){
	    	// 유효성 검사 : 공백칸 여부
	    	if($("#MajorCode").val() == ""){
	    	    alert("강좌코드를 입력해주세요");
	    	    $("#MajorCode").focus();
	    	    return false;
	    	}
			
	    	if($("#MajorName").val() == ""){
	    	    alert("강좌이름을 입력해주세요");
	    	    $("#MajorName").focus();
	    	    return false;
	    	}
	    	
	    	if($("#MajorTime").val() == ""){
	    	    alert("강좌시간을 입력해주세요");
	    	    $("#MajorTime").focus();
	    	    return false;
	    	}
	    	
	    	if($("#MajorLocation").val() == ""){
	    	    alert("강좌실 위치를 입력해주세요");
	    	    $("#MajorLocation").focus();
	    	    return false;
	    	}
	    	
	    	if($("#TargetGrade").val() == ""){
	    	    alert("권장학년을 입력해주세요");
	    	    $("#TargetGrade").focus();
	    	    return false;
	    	}
	    	
	    	if($("#GradePoint").val() == ""){
	    	    alert("학점을 입력해주세요");
	    	    $("#GradePoint").focus();
	    	    return false;
	    	}
	    	
	    	if($("#MajorLimit").val() == ""){
	    	    alert("인원제한을 입력해주세요");
	    	    $("#MajorLimit").focus();
	    	    return false;
	    	}
	    	
	    	if($("#Professor").val() == ""){
	    	    alert("교수이름을 입력해주세요");
	    	    $("#Professor").focus();
	    	    return false;
	    	}
	    	
			if($("#MajorDivision").val() == ""){
	    	    alert("내용을 입력해주세요");
	    	    $("#MajorDivision").focus();
	    	    return false;
	    	} else {
	    		$("#classForm").attr("action", "/classInsert.do")
	    		$("#classForm").submit();
	    	}	
		});
		
		// 목록가기 버튼
		$("#cancelBtn").click(function(){
			history.go(-1);
		});
	</script>

</body>
</html>