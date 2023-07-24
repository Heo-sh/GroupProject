<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board_css/board.css">
<script src="resources/js/all.min.js"></script>
<script type="text/javascript">
			function send(f) {
				var f = document.getElementById("nickname");
				var nickname = f.nickname.value.trim();
				
			
				if (nickname == '') {
					alert("로그인 후 사용하세요");
					location.href = "login_join";
					return;
				} 
				
				f.action = "insert_form.do";
				f.method = "POST";
				f.submit();
			}
		</script>
</head>
<body>
	<header>
		<nav>
			<div class="container" align="center">
				<div class="common" onclick="location.href='intro.do'">
					<img src="resources/img/banner_icon01.png" width="100px">
					<div class="hov_txt">
						<p>소개</p>
					</div>
				</div>
				
				<div class="common">
					<img src="resources/img/banner_icon02.png" width="100px">
					<div class="hov_txt">
						<p>위치</p>
					</div>	
				</div>
				
				<div class="logo" onclick="location.href='main_test'">
					<img src="resources/img/logo.png" >
				</div>
				
				<div class="common" onclick="location.href='life.do'">
					<img src="resources/img/banner_icon04.png" width="100px">
					<div class="hov_txt">
						<p>프레임</p>
					</div>
				</div>
				
				<div class="abm common" onclick="location.href='board.do'">
					<img src="resources/img/banner_icon05.png" width="100px">
					<div class="hov_txt">
						<p>앨범</p>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="board_mainbox">
		<div class="brand_btn_box">
			<button type="button" id="b1" class="brand_btn"> <img src="resources/img/frame_img/62c2e9727b583.png" width="100px" height="100px"> </button>
			<button type="button" id="b2" class="brand_btn"> <img src="resources/img/frame_img/9c700cae91a0d.png" width="130px"></button>
			<button type="button" id="b3" class="brand_btn"> <img src="resources/img/frame_img/harufilm.png" width="100px" height="100px"> </button>
			<button type="button" id="b4" class="brand_btn"> <img src="resources/img/frame_img/photogrey_logo.png" width="130px" > </button>
			<button type="button" id="b5" class="brand_btn"> <img src="resources/img/frame_img/9cca6783613b7.png" width="140px"> </button>
		</div>
		<input type="button" class="send_btn" onclick="send();" value="작성">
		<form name="f" id="nickname">
			<input type="hidden" name="nickname" value="${param.nickname}" /> 
			<input type="hidden" name="member_idx" value="${param.member_idx}" />
		</form>
		<div class="board_box">
			<c:forEach var="vo" items="${list}">
				<div class="board" onclick="location.href='board.view?member_idx=${vo.member_idx}&photo_name=${vo.photo_name}'">
					<input type="hidden" value="${vo.member_idx}" readonly="readonly">
					<p>${vo.nickname}</p>
					<div class="img">
						<img src="resources/upload/${vo.photo_name}">
					</div>
					<div class="like_main_box">
						<i class="fa-solid fa-heart"></i>
						<input type="text" class="like_b_box" value="${vo.like_b}" readonly="readonly"/>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>