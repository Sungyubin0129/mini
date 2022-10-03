<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/main.css">
	<link rel="stylesheet" href="/resources/css/menu.css">
	<meta charset="UTF-8">
	<title>메인 페이지(매니저)</title>
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
	<jsp:include page='./includes/topManager.jsp'/>

	<!-- 배경화면 -->
	<div class="wrap-login">
		<!-- 내 정보 박스 -->
		<div class="info-box">
			<div style="text-align:center; font-size:20px; margin-bottom:5px; font: small-caps bold 24px/1 sans-serif;">
				<b>환영합니다. ${member.memberName}님</b>
			</div>
			<div class="my-box">
				<div style="height:50px;
					background:url(../resources/images/icon-my.png;) no-repeat; background-size:contain; background-position: center;"></div>
				<div style="color:black; padding:20px; font-size:20px">
					<p>이름 : ${member.memberName}</p>
					<p>직책 : 학과조교</p>
					<p>학번 : ${member.memberID}</p>
					<p>학과 : ${member.memberMajor}</p>
				</div>
				<a href="/noticeManager">
					<button class="btn btn-primary" style="margin-left:53px; background-color:#113769;">공지관리하러가기</button>
				</a>
			</div>
		</div>
	</div>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerManager.jsp'/>
	
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
								background: url(../resources/images/btn-more-blue.png) center center no-repeat;"></span>
						</p>
						<div class="time" style="background: url(../resources/images/icon-clock.png) left center no-repeat;">
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
	
</body>
</html>