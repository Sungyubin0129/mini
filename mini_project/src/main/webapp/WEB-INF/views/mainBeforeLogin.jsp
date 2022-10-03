<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="/resources/css/menu.css">
	<meta charset="UTF-8">
	<title>메인 페이지(로그인 전)</title>
	<script>
        function popup(){
            var url = "notice.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
	<style>

		.login-contents {
			position : absolute;
			left: 135px;
			top: 620px;
		    width: 1260px;
		    padding: 45px 0 0;
		    box-sizing: border-box;
		}
		
		.login-contents .wrap-schedule {
		    display: flex;
		    align-items: stretch;
		    margin-bottom: 50px;
		    mar
		}
		
		.login-contents .wrap-schedule>div .schedule {
		    position: relative;
		    float: left;
		    width: 100%;
		    height: 110px;
		    padding-left: 20px;
		    border-left: 1px solid #70bded;
		    box-sizing: border-box;
		    cursor: pointer;
		}
		
		.login-contents .wrap-notice {
		    margin-bottom: 60px;
		    padding:10px;
		}
	
	</style>
</head>
<body>
	
	<!-- 상단바 -->
	<jsp:include page='./includes/topBeforeLogin.jsp'/>

	<!-- 배경화면 -->
	<div class="wrap-login">
		<!-- 로그인 박스 -->
		<div class="login-box">
			<form id="login_form" method="post">
		  		<div class="form-group">
			  		<h3 style = "text-align:center;">로그인</h3>
				    <label for="exampleInputEmail1">아이디</label>
				   	<input type="text" class="form-control" id="MemberID" name="MemberID" aria-describedby="emailHelp">
				   	<small id="emailHelp" class="form-text text-muted">※아이디는 학번과 동일합니다.</small>
				</div>
				<div class="form-group">
				    <label for="exampleInputPassword1">비밀번호</label>
				    <input type="password" class="form-control" id="MemberPW" name="MemberPW">
				</div>
				<div class="form-group form-check">
				    <input type="checkbox" class="form-check-input" id="exampleCheck1">
				    <label class="form-check-label" for="exampleCheck1">아이디 저장</label>
				</div>
				<!-- 로그인 실패 시 문구 -->
				<c:if test = "${result == 0}">
					<div class="login_warn"><b>ID 또는 비밀번호를 잘못 입력했습니다.</b></div>
				</c:if>
				<a href = '/findPw'>비밀번호 찾기</a> /
				<a href = '/joinMember'>회원가입</a><br>
				<!-- 로그인 버튼 -->
				<button type="button" id="login_button" class="btn btn-primary" style = "margin:5px; margin-top:30px; float:right">로그인</button>
			</form>
		</div>
	</div>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerBeforeLogin.jsp'/>
	
	<!-- 콘텐츠 부분 -->
	<div class = login-contents>
	<!-- 수강일정 부분 -->
		<div>
			<h1>
				수강신청 일정
				<small>Course Registration Schedule</small>
			</h1>
			<div class="wrap-schedule">
				<div style="margin-right:80px">
					<h2>학부 수강신청</h2>
					<div class="schedule" onclick="location.href='schedule.jsp';">
						<p> 학부 수강 안내 
							<br>Course Registration  
							<span class="btn-more" style="cursor: not-allowed; 
								background: url(resources/images/btn-more-blue.png) center center no-repeat;"></span>
						</p>
						<div class="time" style="background: url(resources/images/icon-clock.png) left center no-repeat;">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;2021/02/16 05:32:04</span>
						</div>
					</div>
				</div>
				<div style="margin-right:80px">
					<h2>희망과목 수강신청</h2>
						<div class="schedule" onclick="location.href='schedule.jsp';">
							<p> 희망과목 수강 안내 
								<br>WishList Course Registration 
								<span class="btn-more" style="cursor: not-allowed; 
									background: url(../resources/images/btn-more-blue.png) center center no-repeat;"></span>
							</p>
							<div class="time" style="background: url(../resources/images/icon-clock.png) left center no-repeat;">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;2021/02/16 05:32:04</span>
							</div>
						</div>
				</div>
				<div style="margin-right:80px">
					<h2>계절학기 수강신청</h2>
					<div class="schedule" onclick="location.href='schedule.jsp';">
						<p> 계절학기 수강 안내 
							<br> Summer/Winter Course Registration 
							<span class="btn-more" style="cursor: not-allowed; 
								background: url(../resources/images/btn-more-blue.png) center center no-repeat;"></span>
						</p>
						<div class="time" style=" background: url(../resources/images/icon-clock.png) left center no-repeat;">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;2021/02/16 05:32:04</span>
						</div>
					</div>
				</div>
				<div>
					<h2>대학원 수강안내</h2>
					<div class="schedule" onclick="location.href='schedule.jsp';">
						<p> 대학원 수강 안내 
							<br> Graduate Course Registration 
							<span class="btn-more" style="cursor: not-allowed; 
								background: url(../resources/images/btn-more-blue.png) center center no-repeat;"></span>
						</p>
						<div class="time" style=" background: url(../resources/images/icon-clock.png) left center no-repeat;">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;2021/02/16 05:32:04</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 수강신청 유의사항-->
		<div>
			<h1>
				수강신청 유의사항
				<small>Notice</small>
			</h1>
			<div class="wrap-notice">
				<div>
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;수강신청 최소/최대 학점
					</p>
					<div style="background: url(../resources/images/notice.png) no-repeat; width:941px; height:278px; margin-bottom:20px;"></div>
				</div><br>
				<div>	
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;졸업 최소 이수 학점
					</p>
					<div style="background: url(../resources/images/notice2.png) no-repeat; width:1221px; height:214px; margin-bottom:20px;"></div>	 
				</div>
				<div>	
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;수강신청시 본인의 학과, 학년을 지정하면 본인이 신청 가능한 교과목이 조회됨. 타 학과 및 다른 학년에 개설된 교과목을 수강하고자 할 때에도 해당 학과, 학년을 지정하여 조회한 후 수강 신청함
					</p>
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;수강신청을 하기 전에 수강신청 안내사항을 숙지한 후 수강 신청하고, 수강신청을 완료 후 반드시 수강신청확인서를 출력하여 본인의 수강신청 내용을 확인할 것(관련 유의사항을 준수하지 않아서 발생하는 모든 불이익은 학생 본인의 책임)
					</p>
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;등록한 학기에 이유 없이 수강신청을 포기하거나 학점을 취득하지 않아도 당해 학기 등록으로 간주되니 불이익을 받는 일이 없도록 유의하기 바람(등록금 환불 불가)
					</p>
					<p style="background: url(../resources/images/bullet-blue.png) 0px 7px no-repeat; margin-bottom:20px;">
						&nbsp;&nbsp;&nbsp;선착순 수강신청 실시로 원하는 강좌를 수강할 수 없게 될 수도 있으므로 반드시 정해진 기한내에 수강신청을 완료해야 하며, Pass학점 과목도 반드시 수강신청 해야 함
					</p>
				</div>
			</div>	
		</div>
	</div>
	
	
	<!-- JS 부분 -->
	
	<!-- 로그인 버튼 동작 -->
	<script>
    $("#login_button").click(function(){
    	
    	// var formObj = $("#login_form");
    	
    	// 유효성 검사 : 아이디, 비밀번호 공백칸 여부
    	if($("input[name=MemberID]").val() == ""){
    	    alert("아이디를 입력해주세요");
    	    $("#MemberID").focus();
    	    return false;
    	}

		if($("#MemberPW").val() == ""){
			console.log("password");
    	    alert("비밀번호를 입력해주세요");
    	    $("#MemberPW").focus();
    	    return false;
    	} else {
    		//로그인 메소드 서버 요청
    		console.log("else");
    		$("#login_form").attr("action", "/login")
    		$("#login_form").submit();
    	}
        
    });
	</script>
	
	<!-- 로그인 전 메뉴 접근 시 경고창 출력 -->
	<script>
	$(".menu_button").click(function(){
		alert("로그인이 필요합니다.");
		$("#MemeberID").focus();
		return false;
	});
	</script>
	
</body>
</html>