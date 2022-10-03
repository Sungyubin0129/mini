<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/selectList.css">
<meta charset="UTF-8">
<title>최종수강신청 페이지</title>
</head>
<body>

	<!-- 상단바 -->
	<jsp:include page='./includes/topAfterLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerFinalDecision.jsp'/>
	

	<!-- 선택한 강좌 리스트 -->
	<div class="wrap-contents">
		<h1><b>선택한 강좌 내역</b></h1>
		<br>
		<table class="subject-list">
			<thead>
				<tr>
					<th>강좌코드</th>
					<th>강좌명</th>
					<th>이수구분</th>
					<th>권장학년</th>
					<th>제한인원</th>
					<th>교수명</th>
					<th>학점</th>
					<th>시간</th>
					<th>강의실</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myList}" var="myList">
					<tr>
						<td>
							<c:out value="${myList.majorCode}"></c:out>
						</td>
						<td>
							<c:out value="${myList.majorName}"></c:out>
						</td>
						<td>
							<c:out value="${myList.majorDivision}"></c:out>
						</td>
						<td>
							<c:out value="${myList.targetGrade}"></c:out>
						</td>
						<td>
							<c:out value="${myList.majorLimit}"></c:out>
						</td>
						<td>
							<c:out value="${myList.professor}"></c:out>
						</td>
						<td>
							<c:out value="${myList.gradePoint}"></c:out>
						</td>
						<td>
							<c:out value="${myList.majorTime}"></c:out>
						</td>
						<td>
							<c:out value="${myList.majorLocation}"></c:out>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" id="decision" name="decision" class="btn btn-primary" style="background-color:#113769; margin-top:50px; margin-left:500px; width:150px; height:50px; font-size:20px;">
			<b>수강신청</b>
		</button>
		
		<!-- 최종수강신청 -->
		<form id="finalCheck" method="post">
			<input type="text" hidden="hidden" name="StudentID" id="StudentID" value="${member.memberID}">
			<input type="number" hidden="hidden" name="Check" id="Check" value="1">
		</form>
	</div>
	
	<!-- JS부분 -->
	<script>
	// 수강신청버튼 동작부분
	$(document).ready(function(){
    	$('#decision').click(function() {
        	var result = confirm('확정하시겠습니까?');

        	if(result) { //yes  
           		alert("성공적으로 신청되었습니다.");
           		//최종수강신청
        		$("#finalCheck").attr("action", "/enrolment")
        		$("#finalCheck").submit();
           	
        	} else { //no
        		
        	}
    	});
	});
	</script>
</body>
</html>