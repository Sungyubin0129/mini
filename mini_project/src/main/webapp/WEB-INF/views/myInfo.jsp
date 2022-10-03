<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/myInfoTable.css">
<title>내 정보 페이지</title>
<script>
	//내 정보 수정 페이지 팝업창
    function popup(){
    	var url = "/editMyInfo";
        var name = "popup test";
        var popupWidth = 500;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY= (window.screen.height / 2) - (popupHeight / 2);
        window.open(url, name, 'status=no, height=500, width=500, left='+ popupX + ', top='+ popupY);
    }
</script>
</head>
<body>

	<!-- 상단바 -->
	<jsp:include page='./includes/topAfterLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerMyInfo.jsp'/>
	
	<!-- 마이페이지 -->
	<div class="wrap-contents">
		<h1><b>마이페이지</b></h1>
		<br>
		<!-- 기본정보 테이블 -->
		<h3>기본정보</h3>
		<table class="wrap-myinfo">	
			<tbody>
		    	<tr>
		       		<th>이름</th>
		          	<td>${member.memberName}</td>
		        </tr>
		        <tr>
		          	<th>학번</th>
		          	<td>${member.memberID}</td>
		        </tr>
		        <tr>
		          	<th>학과</th>
		          	<td>${member.memberMajor}</td>
		        </tr>
		        <tr>
		          	<th>학년</th>
		          	<td>${member.memberGrade}학년</td>
		        </tr>
		   		<tr>
		          <th>신청학점</th>
		          <td>${member.memberMajorPoint}학점</td>
		        </tr>
			</tbody>
		</table>
		
		<br>
		<h3>상세정보</h3>	
		<!-- 상세정보 테이블 -->
		<table class="wrap-myinfo">     
			<tbody>
		        <tr>
		          <th>주소</th>
		          <td>${member.memberAddress}</td>
		        </tr>
		        <tr>
		          <th>전화번호</th>
		          <td>${member.memberPhoneNum}</td>
		        </tr>
		        <tr>
		          <th>이메일</th>
		          <td>${member.memberEmail}</td>
		        </tr>
			</tbody>
    	</table>
    	
    	<!-- 수정하기 버튼 -->
    	<button class="btn btn-primary" style="float:right; margin-top:30px; margin-right:220px;"
    			onclick="javascript:popup()">
    		수정하기
    	</button>
		<h3 style="margin-top:150px;">수강신청목록</h3>
		<!-- 수강신청 테이블 : 수강신청을 했을 경우 -->
		<c:if test="${not empty checkOK.checkOK}">
			<table class="select-table">
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
		<!-- 수강신청을 안했을 경우 -->
		<c:if test="${empty checkOK.checkOK}">
			<p>수강신청 내역이 없습니다.</p>
		</c:if>
	</div>
	
	<!-- JS 부분 -->

	
</body>
</html>