<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mymy.css">		
	</head>
	<body>
	<div class="modal">
		<div class="modal_body">모달</div>
	</div>
		<div class="logo">
			<img src="resources/img/logo.png" onclick="location.href='main_test'">
		</div>
	<div class="main-frame">	
		<div class="profile-menu">
			<h1><img src="resources/img/mypage_person.png" width="40px">${vo.nickname}님 환영합니다!</h1><br>			
			<button class="btn-open-popup">정보수정</button>
    	</div>					
		<div class="tab-menu">
			<div class="tab_con">
				<input type="radio" name="tabmenu" id="tab01" checked>
				<label for = "tab01">home</label>
				<input type="radio" name="tabmenu" id="tab02">
				<label for = "tab02">회원정보</label>
				<input type="radio" name="tabmenu" id="tab03">
				<label for = "tab03">내가쓴글</label>

				<div class="conbox con1">home 정보</div>
				<div class="conbox con2">회원 정보</div>
				<div class="conbox con3">내가쓴글 정보</div>
			  			
			</div>
		</div>
	</div>
	<script>
		// 모달 창 스크립트
	    const body = document.querySelector('body');
	    const modal = document.querySelector('.modal');
	    const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	    btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	    modal.addEventListener('click', (event) => {
	      if (event.target === modal) {
	        modal.classList.toggle('show');
	
	        if (!modal.classList.contains('show')) {
	          body.style.overflow = 'auto';
	        }
	      }
	    });
  
	</script>

	</body>
</html>