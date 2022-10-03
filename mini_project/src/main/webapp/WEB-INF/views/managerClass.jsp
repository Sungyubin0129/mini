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
<link rel="stylesheet" href="/resources/css/managerClass.css">
<title>강좌관리페이지</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page='./includes/topManager.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerManagerClass.jsp'/>
	
	<!-- 강좌관리페이지 -->
	<div class="wrap-contents">
		<h1><b>강좌목록관리</b></h1>
		<hr>
		<h3>강좌관리</h3>
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
				<c:forEach items="${classList}" var="classList">
					<tr>
						<td>
							<c:out value="${classList.majorCode}"></c:out>
						</td>
						<td>
							<c:out value="${classList.majorName}"></c:out>
						</td>
						<td>
							<c:out value="${classList.majorDivision}"></c:out>
						</td>
						<td>
							<c:out value="${classList.targetGrade}"></c:out>
						</td>
						<td>
							<c:out value="${classList.majorLimit}"></c:out>
						</td>
						<td>
							<c:out value="${classList.professor}"></c:out>
						</td>
						<td>
							<c:out value="${classList.gradePoint}"></c:out>
						</td>
						<td>
							<c:out value="${classList.majorTime}"></c:out>
						</td>
						<td>
							<c:out value="${classList.majorLocation}"></c:out>
						</td>
						<td>
							<button type="button" class="delete" id="delete" style="background-color:red; color:white;">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" id="insertClass" name="insertClass" class="btn btn-primary" style="margin-top:20px; float:right" onclick="location.href='/classInsert'">
			강좌 추가하기
		</button>
	</div>
	
	<!-- 페이지 이동 인터페이스 영역 -->
        <div class="pageMaker_wrap" >         
	    	<ul class="pageMaker">   	    	        
	        	<!-- 이전 버튼 -->
	            <c:if test="${pageMaker.prev}">
	                <li class="pageMaker_btn prev">
	                 	<a href="${pageMaker.pageStart - 1}">이전</a>
	                </li>
	            </c:if>	
	            
	           	<!-- 페이지 번호 -->
	            <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
	            	<li class="pageMaker_btn ${pageMaker.cri.pageNum == num?"active":""}">
	             		<a href="${num}">${num}</a>
	                </li>
	            </c:forEach>
	                    	
	            <!-- 다음 버튼 -->
	            <c:if test="${pageMaker.next}">
	            	<li class="pageMaker_btn next">
	                	<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                </li>
	            </c:if>	                 	
	        </ul>	                    
        </div>
                    
        <form id="moveForm"  method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	
	<!-- Controller로 삭제할 강좌코드 전달 -->
	<form id="deleteSubject" method="post">
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
        		$("#deleteSubject").attr("action", "/classDelete")
        		$("#deleteSubject").submit();
        	} else { //no

        	}
    	});
    	
    	let moveForm = $('#moveForm');
    	let searchForm = $('#searchForm');
    	
    	// 페이지 이동
    	$(".pageMaker_btn a").on("click",function(e){
    		
    		e.preventDefault();
    		
    		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    		
    		moveForm.submit();
    		
    	});
	});
	</script>

</body>
</html>