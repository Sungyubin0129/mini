<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/joinMember.css">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page='./includes/topBeforeLogin.jsp'/>
	
	<!--사이드 메뉴바-->
	<jsp:include page='./includes/headerBeforeLogin.jsp'/>
	
	<!-- 회원가입 -->
	<div class="wrap-contents">
		<h1><b>회원가입</b></h1>
		<hr>
		<form id="join_form" method="post">
			<table class="join-table">
				<tr>
					<th>* 아이디</th>
					<td>
						<input type="text" name="MemberID" id="MemberID" placeholder="학번을 입력해주세요" class="input-form"/><br>
						<div class="valid">아이디 형식 : 8자리 숫자(학번)</div>
					</td>
				</tr>
				<tr>
					<th>* 이름</th>
					<td><input type="text" name="MemberName" id="MemberName" placeholder="이름을 입력해주세요" class="input-form"/></td>
				</tr>
				<tr>
					<th>* 비밀번호</th>
					<td><input type="password" name="MemberPW" id="MemberPW" placeholder="비밀번호를 입력해주세요" class="input-form"/></td>
				</tr>
				<tr>
					<th>* 비밀번호 확인</th>
					<td><input type="password" name="MemberPWCheck" id="MemberPWCheck" placeholder="비밀번호를 입력해주세요" class="input-form"/></td>
				</tr>
				<tr>
					<th>* 주소</th>
					<td>
						<input type="text" name="MemberAddress" id="MemberAddress" placeholder="주소를 입력해주세요" class="input-form"/>
						<button onclick="execDaumPostcode()" type="button"
								style="background-color:#113769; color:white; border-radius:20px; width:100px; height:30px; margin-left:10px;">
							주소찾기
						</button> 
					</td>
				</tr>
				<tr>
					<th>* 이메일</th>
					<td>
						<input type="text" name="MemberEmail" id="MemberEmail" placeholder="Ex)example@sample.com" class="input-form"/>
						<button type="button" id="mail_check_button" class="mail_check_button"
                           style="background-color: #113769; color: white; border-radius: 20px; width: 100px; height: 30px; margin-left: 10px;">
                           메일인증
                        </button>	
					</td>
				</tr>
				<tr>
					<th>* 이메일 인증번호</th>
					<td>
						<input type="text" name="MemberEmailCheck" id="MemberEmailCheck" class="input-form" disabled="disabled"/>
						<span id="mail_check_input_box_warn"></span>
					</td>
				</tr>
				<tr>
					<th>* 전화번호</th>
					<td><input type="text" name="MemberPhoneNum" id="MemberPhoneNum" placeholder="Ex)010-XXXX-XXXX" class="input-form"/></td>
				</tr>
				<tr>
					<th>* 학년</th>
					<td>
						<select name="MemberGrade" id="MemberGrade" class="input-form">
							<option value="1">1학년</option>
							<option value="2">2학년</option>
							<option value="3">3학년</option>
							<option value="4">4학년</option>	
						</select>
					</td>
				</tr>
				<tr>
					<th>* 전공</th>
					<td>
						<select name="MemberMajor" id="MemberMajor" class="input-form" style="scroll:yes">
                        	<option value="" selected disabled="disabled">전공을 선택하세요</option>
                            <option value="소프트웨어학과">소프트웨어학과</option>
                            <option value="기계공학과">기계공학과</option>
                            <option value="화학공학과">화학공학과</option>
                            <option value="항공우주공학과">항공우주공학과</option>
                            <option value="전기전자공학과">전기전자공학과</option>
                            <option value="정보통신공학과">정보통신공학과</option>
                            <option value="생명공학과">생명공학과</option>
                            <option value="건축공학과">건축공학과</option>
                            <option value="도시공학과">도시공학과</option>
                            <option value="산업디자인학과">산업디자인학과</option>
                            <option value="신소재공학과">신소재공학과</option>
                        </select>	
					</td>
				</tr>
			</table>
			<button class="btn btn-primary" type="button" id="join_button"
				style="float:right; margin-top:30px; margin-right:220px; margin-bottom:50px;">
    			회원가입
    		</button>
		</form>
	</div>
	
	<!-- JS 부분 -->
	
	<!-- 로그인 전 메뉴 접근 불가능 -->
	<script>
		$(".menu_button").click(function(){
			alert("로그인이 필요합니다.");
			return false;
		});
	</script>
	
	<!-- 회원가입 버튼 동작 + 유효성 검사 -->
	<script>
		$("#join_button").click(function(){
		
			//아이디 공백
			if($("#MemberID").val() == "") {
				alert("아이디를 입력해주세요");
				$("#MemberID").focus();
				return false;
			}
			
			//아이디 형식이 불일치할때
			var idRegExp = /^[0-9]{8}$/;
			if(!idRegExp.test($("#MemberID").val())) {
				alert("아이디 형식을 확인해주세요")
				$("#MemberID").focus();
				return false;
			}
			
			//이름 공백
			if($("#MemberName").val() == "") {
				alert("이름을 입력해주세요");
				$("#MemberName").focus();
				return false;
			}
			
			//비밀번호 공백
			if($("#MemberPW").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#MemberPW").focus();
				return false;
			}
			
			//비밀번호 확인 공백
			if($("#MemberPWCheck").val() == "") {
				alert("비밀번호를 확인해주세요");
				$("#MemberPWCheck").focus();
				return false;
			}
			
			//비밀번호 확인 불일치
			if($("#MemberPW").val() != $("#MemberPWCheck").val()) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("#MemberPWCheck").focus();
				return false;
			}
			
			//주소 공백
			if($("#MemberAddress").val() == "") {
				alert("주소를 입력해주세요");
				$("#MemberAddress").focus();
				return false;
			}
			
			//이메일 공백
			if($("#MemberEmail").val() == "") {
				alert("이메일 입력해주세요");
				$("#MemberEmail").focus();
				return false;
			}
			
			//이메일 형식이 불일치
			var emailRegExp = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!emailRegExp.test($("#MemberEmail").val())) {
				alert("이메일 형식을 확인해주세요")
				$("#MemberEmail").focus();
				return false;
			}
			
			//이메일 인증 공백
			if($("#MemberEmailCheck").val() == "") {
				alert("이메일 인증이 필요합니다");
				$("#MemberEmailCheck").focus();
				return false;
			}
			
			// 전화번호 공백
			if($("#MemberPhoneNum").val() == "") {
				alert("전화번호를 입력해주세요");
				$("#MemberPhoneNum").focus();
				return false;
			}
			
			// 전화번호 형식 불일치
			var phoneNumRegExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
			if(!phoneNumRegExp.test($("#MemberPhoneNum").val())) {
				alert("전화번호 형식을 확인해주세요")
				$("#MemberPhoneNum").focus();
				return false;
			}
			
			// 학년 미선택
			if($("#MemberGrade").val() == "") {
				alert("학년을 선택해주세요");
				$("#MemberGrade").focus();
				return false;
			}
			
			// 전공 미선택
			if($("#MemberMajor").val() == "") {
				alert("전공을 선택해주세요");
				$("#MemberMajor").focus();
				return false;
			}
			
			alert("회원가입이 완료되었습니다.")
	        $("#join_form").attr("action", "/joinMember");      
	        $("#join_form").submit();
		 });
	</script>
	
	<!-- 주소찾기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.address; // 도로명 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("MemberAddress").value = roadAddr;                
	            }
	        }).open();
	    }
	</script>
	
	<!-- 이메일 인증번호 전송 -->
	<script>
		var code = ""; // 이메일 전송 인증번호 저장 변수
	    $(".mail_check_button").click(function(){
	     
	    	var email=$("#MemberEmail").val(); // 입력한 이메일
	      	var box=$("#MemberEmailCheck"); // 인증번호 입력란 박스
	      	var checkBox = $("#MemberEmailCheck"); // 인증번호 입력란
	      
	       	$.ajax({   
	        	type:"GET",
	           	url:"mailCheck?email="+email,
	           	success:function(data){
	            	alert("인증 번호가 발송되었습니다.");
	                checkBox.attr("disabled",false);
	                code = data; // 전송된 인증번호
	           	}   
	       	});       
	   	});
		
		// 이메일 인증번호 일치여부 확인
		$("#MemberEmailCheck").blur(function(){
			
			var inputCode = $("#MemberEmailCheck").val(); // 입력한 인증번호
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과
			
			if(inputCode == code){ // 일치할경우
				checkResult.html("인증번호가 일치합니다");
				checkResult.attr("class", "correct");
			} else { // 불일치할 경우
				checkResult.html("인증번호가 틀렸습니다. 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
			}
			
		});
	</script>
</body>
</html>