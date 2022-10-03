<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//주소찾기
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample4_roadAddress").value = roadAddr;                
	            }j
	        }).open();
	    }
	</script>
<style>
	/*입력 폼 위치 css*/
	.input-form{
		margin-top:30px;
	}
</style>
<meta charset="UTF-8">
<title>학생정보수정 페이지</title>
</head>
<body style="background-color:#e9e9e9;">
	
	<div style="padding:10px;">
		<h2 style="text-align: center;"><b>내 정보 수정</b></h2>
		<hr>
		<br>
		<form id="edit_form" method="post">
			<!-- 아이디 부분(수정불가) -->
			<div class="input-form">
				<p style="font-size:20px;">학번</p>
				<input type="text" name="MemberID" id="MemberID" style="width:300px; height:35px;" value="${member.memberID}" readonly>
			</div>
			<!-- 전화번호입력 -->
			<div class="input-form">
				<p style="font-size:20px;">전화번호</p>
				<input type="text" name="MemberPhoneNum" id=MemberPhoneNum style="width:300px; height:35px;" value="${member.memberPhoneNum}">
			</div>
			
			<!-- 이메일입력 -->
			<div class="input-form">
				<p style="font-size:20px;">이메일</p>
				<input type="text" name="MemberEmail" id="MemberEmail" style="width:300px; height:35px;" value="${member.memberEmail}">
			</div>
			
			<!-- 주소입력 -->
			<div class="input-form">
				<p style="display:inline-block; font-size:20px;">주소</p>
				<button type="button" onclick="execDaumPostcode()" style="background-color:#113769; color:white; border-radius:20px; width:100px; height:30px; margin-left:10px;">
					주소찾기
				</button>
				<br>
				<input type="text" id="MemberAddress" name="MemberAddress" value="${member.memberAddress}" style="width:300px; height:30px;">
			</div>
			<div class="input-form">
				<p style="font-size:20px;">비밀번호</p>
				<input type="password" name="MemberPW" id="MemberPW" style="width:300px; height:30px;">
			</div>
			<div class="input-form">
				<p style="font-size:20px;">비밀번호 확인</p>
				<input type="password" name="MemberPWCheck" style="width:300px; height:30px;">
			</div>
			<div style="text-align: center; margin-top:50px;">
				<button type="button" id="editBtn" name="editBtn" class="btn btn-primary" style="background-color:#113769;">수정하기</button>
			</div>
		</form>
	</div>
	
	<!-- JS 부분 -->
	
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
	
	<!-- 수정하기 버튼 작동 -->
	<script>
		$("#editBtn").click(function(){
			if(confirm("수정하시겠습니까?") ){
				alert("수정되었습니다.");
		        $("#edit_form").attr("action", "/editMyInfo.do");      
		        $("#edit_form").submit();
		        window.open("about:blank", "_self").close();
			}
		});
	</script>
</body>
</html>