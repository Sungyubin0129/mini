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
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/selectSubject.css">
<meta charset="UTF-8">
<title>강좌선택 페이지</title>
<script>
        function popup(){
            var url = "/subjectReview";
            var name = "popup test";
            var popupWidth = 500;
            var popupHeight = 500;
            var popupX = (window.screen.width / 2) - (popupWidth / 2);
            var popupY= (window.screen.height / 2) - (popupHeight / 2);
            window.open(url, name, 'status=no, height=500, width=500, left='+ popupX + ', top='+ popupY);
        }
</script>
<script>
  function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '지도보기';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '지도보기';
    }
  }
</script>
<script>
	var time = 600; // 기준 시간
	var min = "";
	var sec = "";
	
	var x = setInterval(function(){
		min = parseInt(time/60);
		sec = time%60;
		
	document.getElementById("timer").innerHTML = min + "분" + sec + "초";
	time--;
	
	// 타임 아웃 됐을 경우
	if(time < 0) {
		clearInterval(x);
		document.getElementById("timer").innerHTML = "시간초과";
	}
		
	}, 1000);
</script>
<style>

	#toc-content {
    	display: none;
  	}
  	
  	#toc-toggle {
    	cursor: pointer;
    	color: #2962ff;
  	}
  	
  	#toc-toggle:hover {
    	text-decoration: underline;
  	}
		
</style>
</head>
<body>

	<!-- 상단바 -->
	<jsp:include page='./includes/topAfterLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerSelectSubject.jsp'/>
	
	<div class="wrap-contents">
		<h1><b>희망강좌선택</b></h1>
		<br>
		<!-- 강좌목록 -->
		<div>
			<h3 style="display:inline-block;">개설강좌목록</h3>
			<!-- 강좌 검색 -->
         	<div class="search_wrap" style="">
            <form id="searchForm" action="/selectSubject.do" method="get">
               <select name="type">
                  <option value="#" seleted>검색 종류</option>
                  <option value="M">학과 번호</option>
                  <option value="T">수업 시간</option>
                  <option value="L">건물 이름</option>
                  <option value="G">학년</option>
                  <option value="D">이수 구분</option>
               </select>
               <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
               <button class="btn btn-primary" style="display:inline-block; margin-left:15px; margin-bottom:10px; height:40px;">강좌검색</button>
            </form>
         </div>

			<div style="margin-left:1160px;">
				신청가능학점: <em style = "color:orange;">18</em>학점
			</div>
			<!-- 신청가능강좌 목록 -->
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
						<th>신청하기</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="list">
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
								<button type="button" class="select" id="application" style="background-color:#113769; color:white;">선택하기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 선택한 강좌 정보 전송 -->
			<form id="major_form" method="post">
				<input type="text" name="StudentID" id="StudentID" value="${member.memberID}" hidden="hidden">
				<input type="number" name="MajorCode" id="MajorCode" value="" hidden="hidden">
				<input type="text" name="MajorName" id="MajorName" value="" hidden="hidden">
				<input type="text" name="MajorDivision" id="MajorDivision" value="" hidden="hidden">
				<input type="number" name="TargetGrade" id="TargetGrade" value="" hidden="hidden">
				<input type="number" name="MajorLimit" id="MajorLimit" value="" hidden="hidden">
				<input type="text" name="Professor" id="Professor" value="" hidden="hidden">
				<input type="number" name="GradePoint" id="GradePoint" value="" hidden="hidden">
				<input type="text" name="MajorTime" id="MajorTime" value="" hidden="hidden">
				<input type="text" name="MajorLocation" id="MajorLocation" value="" hidden="hidden">
			</form>
		</div>
	</div>
	
	<!-- JS부분 -->
	<script>
	// 신청하기버튼 동작부분
	$(document).ready(function(){
    	$('.select').click(function() {
        	var result = confirm('선택하시겠습니까?');
        	var str = ""
        	var tdArr = new Array(); // 배열 선언
        	var tr = $(this).parent().parent(); // 내가 선택한 행
        	var td = tr.children(); // 선택한 행의 셀
        	
        	// 내가 선택한 행의 값들을 value로 넣어주기
        	$("input#MajorCode").val(parseInt(td.eq(0).text()));
        	$("input#MajorName").val(td.eq(1).text());
        	$("input#MajorDivision").val(td.eq(2).text());
        	$("input#TargetGrade").val(parseInt(td.eq(3).text()));
        	$("input#MajorLimit").val(parseInt(td.eq(4).text()));
        	$("input#Professor").val(td.eq(5).text());
        	$("input#GradePoint").val(parseInt(td.eq(6).text()));
        	$("input#MajorTime").val(td.eq(7).text());
        	$("input#MajorLocation").val(td.eq(8).text());

        	if(result) { // 확인
           		alert("선택되었습니다.");
           		
           		//내 신청목록에 추가
        		$("#major_form").attr("action", "/insertMyMajor")
        		$("#major_form").submit();
           		
           		$(this).attr("disabled", true); // 버튼 비활성화
           		$(this).css("background", "gray"); // 버튼 색 변경
        	} else { // 아니요
 
        	}
    	});
	});
	</script>
</body>
</html>