<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/managerNotice.css">
<link rel="stylesheet" href="/resources/css/joinMember.css">

<style>

/*입력 폼 위치 css*/
.input-form {
	margin-top: 30px;
}
/* 버튼 영역 */
.btn_section{
	text-align: center;
	margin: 80px 0;
}

.btn{
    min-width: 180px;
    padding: 4px 30px;
    font-size: 25px;
    font-weight: 600;
    line-height: 40px;
}

.modify_btn{
	background-color: #b8d3e8;
	margin-left:15px;
}

</style>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>

<!-- 상단바 -->
<jsp:include page='./includes/topManager.jsp' />

<!--사이드 메뉴바-->
<jsp:include page='./includes/headerManagerNotice.jsp' />

<body>

	<div class="wrap-contents">
		<h1><b>게시물 상세정보</b></h1>
		<hr>
		<table class="join-table">
			<tr>
				<th>* 번호</th>
				<td>
					<input name="noticeNumber" value='${list.noticeNumber}' readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>* 제목</th>
				<td>
					<input name="noticeName" value='${list.noticeName}' readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>* 등록 날짜</th>
				<td>
					<input name="noticeDate" value='${list.noticeDate}' readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>* 내용</th>
				<td>
					<textarea name="noticeValue" readonly="readonly" style="height: 300px; width:500px;">${list.noticeValue}</textarea>
				</td>
			</tr>
		</table>
		<button type=button id="cancelBtn" class="btn btn-primary" style="margin-top:20px; margin-right:180px; margin-bottom:20px; float:right;">게시판 목록</button>	
		<button type=button id="modifyBtn" class="btn btn-primary" style="margin-top:20px; margin-right:20px; margin-bottom:20px; float:right;">수 정</button>
		
		<form id="moveForm" method="get">
			<input type="hidden" name="noticeNumber" value='<c:out value="${list.noticeNumber}"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'> 
			<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
		</form>
		
	</div>
	<!-- JS 부분 -->
	
	<!-- 버튼 작동 -->
	<script>
		let moveForm = $("#moveForm");
		// 게시물 목록 페이지 이동
		$("#cancelBtn").on("click", function(e){
			
			e.preventDefault();
			
			$("input[name=noticeNumber]").remove();
			moveForm.attr("action", "/managerNotice")
			moveForm.submit();
			
		});
		
		// 게시물 수정 페이지 이동
		$("#modifyBtn").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.attr("action", "/noticeModify");
			moveForm.submit();
			
		});
	</script>
</body>
</html>