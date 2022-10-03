<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/css/main.css">
<meta charset="UTF-8">
<title>상단바 부분</title>
</head>
<body>
	<!-- 상단바 bootstrap -->
	<nav style="position:relative; left:120px; width:1550px; height:94px; background-color:#113769;">
		<nav class="navbar navbar-light" style="postion:relative; top:0px;">
  			<a class="navbar-brand" href="/mainManager">
  				<!-- 학교 로고 -->
	    		<img src="../resources/images/logo.png" width="70" height="70" class="d-inline-block" alt="학교로고">
	  			<b style="color:white; font-size:25px;">땡땡대학교 수강신청 관리자페이지</b>
  			</a>
  			<a href="javascript:void(0);" onclick="confirmLogout();">
  				<img src="../resources/images/icon-logout.png" width="70" height="70" style="margin-right:150px;">
			</a>
		</nav>
	</nav>
	
	<!-- 로그아웃 아이콘 동작 -->
	<script type="text/javascript">
		function confirmLogout() {
			if( confirm("정말 로그아웃 하시겠습니까?") ) {
			    location.href = "/logout";
			}    
		}    
	</script>
	
</body>
</html>