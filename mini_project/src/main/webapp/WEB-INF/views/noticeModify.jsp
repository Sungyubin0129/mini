<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/managerNotice.css">
<link rel="stylesheet" href="/resources/css/joinMember.css">
<meta charset="UTF-8">
<title>게시물수정 페이지</title>
</head>
<body>

	<!-- 상단바 -->
	<jsp:include page='./includes/topManager.jsp' />
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerManagerNotice.jsp' />
	
	<!-- 수정 컨텐츠 부분 -->
	<div class="wrap-contents">
		<h1><b>게시글 수정</b></h1>
		<hr>
		<form id="modifyForm" action="/noticeModify" method="post">
			<table class="join-table">
				<tr>
					<th>* 번호</th>
					<td>
						<input id="noticeNumber" name="noticeNumber" value='${list.noticeNumber}' hidden="hidden">
						${list.noticeNumber}
					</td>
				</tr>
				<tr>
					<th>* 제목</th>
					<td>
						<input id="noticeName" name="noticeName" value='${list.noticeName}'>
					</td>
				</tr>
				<tr>
					<th>* 등록 날짜</th>
					<td>
						<input id="noticeDate" name="noticeDate" value='${list.noticeDate}' hidden="hidden">
						${list.noticeDate}
					</td>
				</tr>
				<tr>
					<th>* 내용</th>
					<td>
						<textarea id="noticeValue" name="noticeValue" style="height: 300px; width:500px;">${list.noticeValue}</textarea>
					</td>
				</tr>
			</table>
			<button id="modifyBtn" class="btn btn-primary" style="margin-top:20px; margin-right:180px; margin-bottom:20px; float:right;">수정하기</button>
			<button id="deleteBtn" class="btn btn-primary" style="background-color:#FF0000; margin-top:20px; margin-right:20px; margin-bottom:20px; float:right;">삭제하기</button>
			<button id="cancelBtn" class="btn btn-primary" style="background-color:gray; margin-top:20px; margin-right:20px; margin-bottom:20px; float:right;">돌아가기</button>
		</form>
	</div>
	
	<form id="moveForm" method="get">
           <input type="hidden" name="noticeNumber" value='<c:out value="${list.noticeNumber}"/>'>
           <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
           <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' >
           <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
    </form>
	
	
	<!-- JS 부분 -->
	
	<!-- 버튼 작동 -->
	<script>
	
	let moveForm = $("#moveForm");
	let modifyForm = $("#modifyForm");
	
	//돌아가기 버튼
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
				
		moveForm.attr("action", "/managerNotice")
		moveForm.submit();
		
	});
	
	// 삭제 버튼 
	$("#deleteBtn").on("click", function(e){
	
		e.preventDefault();
		
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="noticeNumber" value="${list.noticeNumber}">');
		moveForm.attr("action", "/noticeDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});	
	
	// 작가 수정 버튼 작동 및 유효성 검사 
	$("#modifyBtn").on("click", function(e){
	
		let noticeName = $("#noticeName").val();
		let noticeIntro = $("#noticeValue").val();		
	
		let	nameCk = false;
		let introCk = false;		
		
		e.preventDefault();
		
		if(!noticeName){
    	    alert("제목을 입력해주세요");
    	    $("#noticeName").focus();
    	    return false;
		} else {
			$("#warn_noticeName").css("display", "none");
			nameCk = true;
		}
		if(!noticeIntro){
    	    alert("내용을 입력해주세요");
    	    $("#noticeValue").focus();
    	    return false;
		} else {
			$("#warn_noticeIntro").css("display", "none");
			introCk = true;
		}
		
		if(nameCk && introCk ){
			modifyForm.submit();	
		} else {
			return false;
		}		
	});
	</script>
</body>
</html>