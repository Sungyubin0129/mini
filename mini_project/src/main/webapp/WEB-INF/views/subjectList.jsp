<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/selectList.css">
<meta charset="UTF-8">
<title>선택강좌내역</title>
</head>
<body>

	<!-- 상단바 -->
	<jsp:include page='./includes/topAfterLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerSubjectList.jsp'/>
	
	
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
						<th>삭제하기</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${myList}" var="list">
					<tr>
						<td>
							<c:out value="${list.majorCode}"></c:out>
						</td>
						<td>
							<c:out value="${list.majorName}"></c:out>
						</td>
						<td>
							<c:out value="${list.majorDivision}"></c:out>
						</td>
						<td>
							<c:out value="${list.targetGrade}"></c:out>
						</td>
						<td>
							<c:out value="${list.majorLimit}"></c:out>
						</td>
						<td>
							<c:out value="${list.professor}"></c:out>
						</td>
						<td>
							<c:out value="${list.gradePoint}"></c:out>
						</td>
						<td>
							<c:out value="${list.majorTime}"></c:out>
						</td>
						<td>
							<c:out value="${list.majorLocation}"></c:out>
						</td>
						<td>
							<button type="button" class="delete" id="delete" style="background-color:red; color:white;">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/finalDecision">
			<button class="btn btn-primary" style="margin-top:50px; margin-left:500px;"> > 수강확정하러가기 < </button>
		</a>
	</div>
	
	<!-- Controller로 삭제할 강좌코드 전달 -->
	<form id="deleteSubject" method="post">
		<input type="text" name="StudentID" id="StudentID" value="${member.memberID}" hidden="hidden">
		<input type="number" name="MajorCode" id="MajorCode" value="" hidden="hidden">
	</form>
	
	<!-- JS부분 -->
	
	<!-- 삭제하기 버튼 동작 -->
	<script>
	$(document).ready(function(){
    	$('.delete').click(function() {
        	var result = confirm('삭제하시겠습니까?');
        	var tr = $(this).parent().parent(); // 내가 선택한 행
        	var td = tr.children(); // 선택한 행의 셀
        	$("input#MajorCode").val(parseInt(td.eq(0).text()));
        	
        	if(result) { //yes
           		alert("삭제되었습니다.");
           		$(this).parent().parent().remove(); // 행 삭제
           		
           		//내 신청목록에서 삭제
        		$("#deleteSubject").attr("action", "/deleteMyMajor")
        		$("#deleteSubject").submit();
        	} else { //no

        	}
    	});
	});
	</script>
	
</body>
</html>