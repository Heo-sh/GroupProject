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
	<div class="menu_box">
		<ul>
			<li class="info_btn"><a href="#">소개</a></li>
			<li class="loc_btn"><a href="#">위치</a></li>
			<li class="logo_box"><a href="#">logo</a></li>
			<li class="brand_btn"><a href="#">브랜드</a>
				<ul>
					<li><a href="#">하루필름</a></li>
					<li><a href="#">하루필름</a></li>
					<li><a href="#">하루필름</a></li>
					<li><a href="#">하루필름</a></li>
					<li><a href="#">하루필름</a></li>
				</ul></li>
			<li class="board_btn"><a href="#">게시판</a></li>
			<li class="login_btn"><a href="#">Login</a>
				<ul>
					<li><a href="#">sign in</a></li>
					<li><a href="#">my page</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="board_mainbox">
		<h1>뽐내기!</h1>
		<div class="search_box">
			<div>
				<!-- <input id="title" placeholder="게시물을 검색하세요">
                <input type="button" class="search_btn" value="search"> -->
			</div>
			<input type="button" class="send_btn" onclick="send();" value="작성">
		</div>
		<form name="f" id="nickname">
			<input type="hidden" name="nickname" value="${param.nickname}" /> 
			<input type="hidden" name="member_idx" value="${param.member_idx}" />
		</form>
		<div class="board_box">
			<c:forEach var="vo" items="${list}">
				<div class="board" onclick="location.href='board.view?member_idx=${vo.member_idx}&photo_name=${vo.photo_name}'">
					<input type="hidden" value="${vo.member_idx}">
					<p>${vo.nickname}</p>
					<div class="img">
						<img src="resources/upload/${vo.photo_name}">
					</div>
					<div>
						<i class="fa-solid fa-heart" style="width: 10px; height: 10px;"></i>
						<input type="text" value="${vo.like_b}"/>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>