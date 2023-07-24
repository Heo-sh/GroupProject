<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_css/mypage.css">
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
			<div class="profile">
				${vo.nickname}님 환영합니다
			</div>
		</div>		
	</div>
	</body>
</html>