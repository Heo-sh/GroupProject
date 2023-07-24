<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mypage_del</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_css/mypage_del.css">
		<script type="text/javascript">
			function member_del() {
				
				if(!confirm("정말 탈퇴하시겠습니까?")) {
					
					return;
				}
				
				location.replace("meb_del.do");	
			}
		</script>
	</head>
	<body>
		<header>
		<div class="logo">
		<img src="resources/img/logo.png" onclick="location.href='main_test'">
		</div>
	</header>
	<div class="left-frame">
		<div class="left-menu">
			<a href="mypage" class="left_button">회원정보</a>
			<a href="member_form" class="left_button">정보수정</a>
			<a href="mypage_del" class="left_button">회원탈퇴</a>			
			<!-- <ul class="tab-menu">
				<li id="tab1" class="btnCon">
					<input type="button" name="tabmenu" id="tabmenu1">
					<label for="tabmenu1">회원정보</label>
					<a href="" title="Button" class="button btnBorder btnBlueGreen">회원정보</a>
				</li>
				<li id="tab2" class="btnCon">
					<input type="button" checked name="tabmenu" id="tabmenu2">
	      			<label for="tabmenu2">정보수정</label>
	      			<a href="" title="Button" class="button btnBorder btnBlueGreen">정보수정</a>
				</li>
				<li id="tab3" class="btnCon">
					<input type="button" name="tabmenu" id="tabmenu3">
					<label for="tabmenu3">회원탈퇴</label>
					<a href="" title="Button" >회원탈퇴</a>
				</li>				  
			</ul> -->
		</div>
	</div>
	<div class="right-frame">
		<div class="right-Content">
			<div class="memberdel">
				<p id="del_text">가입된 회원정보가 모두 삭제됩니다.<br> 
				작성하신 게시물은 삭제되지 않습니다.<br>
				탈퇴 후 같은 계정으로 재가입 시<br>
				기존에 가지고 있던 적립금은 복원되지 않으며,<br>
				사용 및 다운로드했던 쿠폰도 사용 불가능합니다.<br>
				회원 탈퇴를 진행하시겠습니까?<br></p>
				<div id="delbutton">
				 	<!-- <input class="button" type="button" onclick="member_del()" value="탈퇴하기"> -->
				 	<a href="javascript:member_del()" title="Button" class="left_button">탈퇴하기</a>
				</div>				
			</div>
		</div>		
	</div>
	</body>
</html>