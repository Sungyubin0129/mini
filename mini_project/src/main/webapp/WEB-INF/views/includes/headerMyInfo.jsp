<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/menu.css">
<title>사이드 메뉴바 부분</title>
</head>
<body>
	<div class = "nav">
		<div class="menu_logo"></div>
		<div class = "wrap-menu">
			<ul class = "menulist">
				<li>
					<a href = "/studentNotice"><img src = "../resources/images/icon-studentNotice.png"></a>
				</li>
				<li style="background-color:rgb(237, 193, 47);">
					<a href = "/myInfo"><img src = "../resources/images/icon-myinfo.png"></a>
				</li>
				<li>
					<a href = "/selectSubject"><img src = "../resources/images/icon-select.png"></a>
				</li>
				<li id="listBtn">
					<a href = "#"><img src = "../resources/images/icon-list.png"></a>
				</li>
				<li>
					<a href = "/finalDecision"><img src = "../resources/images/icon-final.png"></a>
				</li>
			</ul>
		</div>
	</div>
	<form id="myName" method="post">
		<input type="text" id="StudentID" name="StudentID" value="${member.memberID}" hidden="hidden">
	</form>
	
	<!-- JS 부분 -->
	<!-- 선택내역 메뉴 클릭 시 동작 -->
	<script>
		$("#listBtn").click(function(){
		        $("#myName").attr("action", "/mySelectList");      
		        $("#myName").submit();
		});
	</script>

</body>
</html>