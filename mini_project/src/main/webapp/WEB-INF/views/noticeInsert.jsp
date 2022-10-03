<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/managerNotice.css">
<link rel="stylesheet" href="/resources/css/joinMember.css">
<meta charset="UTF-8">
<title>작성하기 페이지</title>
</head>
<body>
	
	<!-- 상단바 -->
	<jsp:include page='./includes/topManager.jsp' />

	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerManagerNotice.jsp' />
	
	<!-- 작성하기 콘텐츠 부분 -->
	<div class="wrap-contents">
		<h1><b>게시글 등록하기</b></h1>
		<br>
		<form method="post" id="noticeForm">
			<table class="join-table">
					<tr>
						<th>* 제목</th>
						<td>
							<input name="noticeName" id="noticeName" placeholder="제목을 입력하세요">
						</td>
					</tr>
					<tr>
						<th>* 작성자</th>
						<td>
							<input name="noticeWriter" id="noticeWriter" value="${member.memberName}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>* 내용</th>
						<td>
							<textarea name="noticeValue" id="noticeValue" placeholder="내용을 입력하세요" style="height: 300px; width:500px;"></textarea>
						</td>
					</tr>
			</table>
			<button type=button id="insertBtn" class="btn btn-primary" style="margin-top:20px; margin-right:180px; float:right;">작성완료</button>
			<button type=button id="cancelBtn" class="btn btn-primary" style="margin-top:20px; margin-right:20px; float:right;">목록가기</button>
		</form>
		
	</div>
	
	<!-- JS 부분 -->
	
	<!-- 등록 / 취소 버튼 동작 -->
	<script>
	
		// 등록 유효성 검사
		$("#insertBtn").click(function(){
	    	// 유효성 검사 : 공백칸 여부
	    	if($("#noticeName").val() == ""){
	    	    alert("제목을 입력해주세요");
	    	    $("#noticeName").focus();
	    	    return false;
	    	}

			if($("#noticeValue").val() == ""){
	    	    alert("내용을 입력해주세요");
	    	    $("#noticeValue").focus();
	    	    return false;
	    	} else {
	    		$("#noticeForm").attr("action", "/noticeInsert.do")
	    		$("#noticeForm").submit();
	    	}	
		});
		
		// 목록가기 버튼
		$("#cancelBtn").click(function(){
			history.go(-1);
		});
	</script>
</body>
</html>