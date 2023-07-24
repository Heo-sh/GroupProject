<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>index</title>
<link rel="stylesheet" href="resources/css/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/css/main_test.css">
<script type="text/javascript">
	function send(f) {
		var f = document.getElementById("nickname");
		
		f.method = "POST";
		f.action = "board.do";
		f.submit();
	}
</script>
</head>
<body>
	<div id="fullpage">
		<div class='quick'>
			<ul></ul>
		</div>
		<div class="fullsection full1 section01" pageNum="1">
			<div class="header">
				<div class="logo">
					<img src="resources/img/logo.png" alt=""
						onclick="location.href='main_test'">
				</div>
			</div>

			<div class="banner_con section_top">
				<div class="floor_box">
					<button class="bc_floor floor1">
						<button class="bn_icon">
							<img src="resources/img/banner_icon01.png" alt="소개 아이콘">
							<div class="bn_txt">
								<p>소개</p>
							</div>
						</button>
					</button>
				</div>
				<div class="floor_box">
					<div class="bc_floor floor2">
						<button class="bn_icon">
							<img src="resources/img/banner_icon02.png" alt="위치 아이콘">
							<div class="bn_txt">
								<p>위치</p>
							</div>
						</button>
						<button class="bn_icon" onclick="location.href='login_join'">

							<img src="resources/img/banner_icon03.png" alt="회원 아이콘">
							<c:if test="${email.nickname ne null}">
								<div class="bn_txt">
									<p>My page</p>
								</div>
							</c:if>
							<c:if test="${email.nickname eq null}">
								<div class="bn_txt">
									<p>회원</p>
								</div>
							</c:if>
						</button>
					</div>
				</div>
				<div class="floor_box">
					<div class="bc_floor floor3">
						<button class="bn_icon">
							<img src="resources/img/banner_icon04.png" alt="프레임 아이콘">
							<div class="bn_txt">
								<p>프레임</p>
							</div>
						</button>
						<form name="f" id="nickname">
							<input type="hidden" name="nickname" value="${email.nickname}">
							<input type="hidden" name="member_idx" value="${email.member_idx}">
						</form>
						<button class="bn_icon" onclick="send()">
							<img src="resources/img/banner_icon05.png" alt="게시판 아이콘">
							<div class="bn_txt">
								<p>게시판</p>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="fullsection full2" pageNum="2">
			<div class="section">
				<div class="contents">
					<div class="con_l">
						<div class="swiper eventSwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide slide01">
									<img src="resources/img/event_img01.png" alt="인생네컷 이벤트">
								</div>
								<div class="swiper-slide slide02">
									<img src="resources/img/event_img02.png" alt="포토그레이 이벤트">
								</div>
							</div>
							<div class="swiper-pagination"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
					<div class="con_r">
						<div class="swiper reviewSwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="인생네컷 이벤트">
								</div>
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="포토그레이 이벤트">
								</div>
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="인생네컷 이벤트">
								</div>
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="포토그레이 이벤트">
								</div>
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="인생네컷 이벤트">
								</div>
								<div class="swiper-slide">
									<img src="resources/img/review_img01.png" alt="포토그레이 이벤트">
								</div>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
				<div class="partners">
					<h2>제휴사 로고</h2>
					<ul class="partners_list">
						<li><img src="resources/img/partners_logo01.png"
							alt="인생네컷 로고"></li>
						<li><img src="resources/img/partners_logo02.png"
							alt="포토이즘 로고"></li>
						<li><img src="resources/img/partners_logo03.png"
							alt="포토그래이 로고"></li>
						<li><img src="resources/img/partners_logo04.png"
							alt="하루필름 로고"></li>
						<li><img src="resources/img/partners_logo05.png"
							alt="포토매틱 로고"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/swiper-bundle.min.js"></script>
<script src="resources/js/main.js"></script>

</html>