<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mymy.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script type="text/javascript">
			
			// 탭스타일 1
			$(function(){
			  $('.tabcontent > div').hide();
			  $('.tabnav a').click(function () {
			    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
			    $('.tabnav a').removeClass('active');
			    $(this).addClass('active');
			    return false;
			  }).filter(':eq(0)').click();
			  });
		
			// 탭스타일 2
			/* $(document).ready(function(){
			  
			  $('ul.tabs li').click(function(){
			    var tab_id = $(this).attr('data-tab');

			    $('ul.tabs li').removeClass('current');
			    $('.tab-content').removeClass('current');

			    $(this).addClass('current');
			    $("#"+tab_id).addClass('current');
			  })

			}) */
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
		</div>
	</div>
	<div class="right-frame">
		<div class="right-Content">
			<div class="tab">
			    <ul class="tabnav">
			      <li><a href="#tab01">탭1</a></li>
			      <li><a href="#tab02">탭2</a></li>
			    </ul>
			    <div class="tabcontent">
			      <div id="tab01">tab1 content</div>
			      <div id="tab02">tab2 content</div>
			    </div>
			  </div><!--tab-->
			<!-- <div class="container">
			  <ul class="tabs">
			    <li class="tab-link current" data-tab="tab-1">tab1</li>
			    <li class="tab-link" data-tab="tab-2">tab2</li>
			    <li class="tab-link" data-tab="tab-3">tab3</li>
			  </ul>
			
			  <div id="tab-1" class="tab-content current">tab content1</div>
			  <div id="tab-2" class="tab-content">tab content2</div>
			  <div id="tab-3" class="tab-content">tab content3</div>
			
			</div> -->
			<%-- <div class="profile">
				${vo.nickname}님 환영합니다
			</div> --%>
		</div>		
	</div>
	</body>
</html>