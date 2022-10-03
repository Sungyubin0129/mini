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
<link rel="stylesheet" href="/resources/css/managerNotice.css">
<title>공지페이지</title>
</head>
<body>
	
	<!-- 상단바 -->
	<jsp:include page='./includes/topAfterLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerStudentNotice.jsp'/>
	
	<!-- 공지관리페이지 -->		
	<div class="wrap-contents">
		<h1><b>공지사항</b></h1>
		<br>
		<!-- 게시물 목록 -->
		<h3>게시물 목록</h3>
        <table class="wrap-notice">
            <thead>
            	<tr>
                	<th style="width:60px;">번호</th>
                   	<th style="width:200px;">제목</th>
                   	<th style="width:950px;">내용</th>
                   	<th style="width:100px;">작성자</th>
               	</tr>
            </thead>
            <!-- 리스트 출력  -->
            <tbody>
	        	<c:forEach items="${noticeList}" var="noticeList">
	            	<tr>
	                	<td style="width:60px;">
	                    	<c:out value="${noticeList.noticeNumber}"></c:out>
	                    </td>
	                    <td style="width:200px;">
	                    	<c:out value="${noticeList.noticeName}"></c:out>
						</td>
	                    <td style="width:900px;">
	                    	<c:out value="${noticeList.noticeValue}"></c:out>
	                    </td>
	                    <td style="width:100px;">
	                    	<c:out value="${noticeList.noticeWriter}"></c:out>
	                    </td>
	                </tr>
	            </c:forEach>
            </tbody>
       	</table>  		              			

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
		                                    
	</div>        

	<!-- JS 부분 -->
	
	<script>
	$(document).ready(function(){
		
		let mresult= '<c:out value="${modify_result}"/>';
		let result = '<c:out value="${insert_result}"/>';
		
		checkResult(result);
		checkmResult(mresult);
		
		// 게시물 작성 시 알림창 출력
		function checkResult(result){
			if(result === ''){
				return;
			}
			alert("게시물 '${insert_result}'을 등록 하였습니다.");
		}
		
		// 게시물 수정 시 알림창 출력
		function checkmResult(mresult){
			if(mresult === '1'){			
				alert("게시물 정보 수정 완료");			
			}else if(mresult === '0'){			
				alert("게시물 정보 수정 실패");			
			}			
		}
	
		let delete_result ='${delete_result}';
	
		if(delete_result == 1){
		
			alert("삭제 완료");
		
		}else if(delete_result == 2){
			
			alert("다른곳에서 데이터를 점유중입니다.")
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
	// 메서드의 내용은 다음과 같습니다. '숫자 버튼'을 누르게 되면 <a> 태그의 동작을 멈추고, 
	//<a> 태그에 저장된 href속성 값을 <form> 태그의 내부에 있는 pageNum <input> 태그 값으로 저장을 시킨 뒤 
	//<form> 태그 속성에 설정되어 있는 url 경로와 method 방식으로 form을 서버로 전송합니다.
	
	// 검색 버튼 동작 
	$("#searchForm button").on("click", function(e){
		
		e.preventDefault();
		
		/* 검색 키워드 유효성 검사 */
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하십시오");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
		
	});
	</script>
	
</body>
</html>