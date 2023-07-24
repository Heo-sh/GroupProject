<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>real_mypage</title>   

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/down3/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/down3/style.css">
</head>

    <body>
    <div class="logo">
			<img src="resources/img/logo.png" onclick="location.href='main_test'">
	</div>
        <div class="container web-portion">
            <div class="row top-det">
                <div class="col-md-4">
                    <div class="profil-det-img d-flex">
                       <div class="dp">
                            <img src="resources/images/profile.png" alt="">
                       </div>
                       <div class="pd">
                           <h2>${vo.nickname}님 환영합니다</h2>
                           <!-- <p><input type="button" value="정보수정" onclick="location.href='member_form'"></p> -->
                           <!-- <button class="btn-open-popup">정보수정</button> -->
                       </div>                                  
                    </div>
                </div>
            </div>
            <div class="nav-detail">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                   <li class="nav-item">
                     <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">정보수정</a>
                   </li> 
                   <li class="nav-item">
                     <a class="nav-link" id="education-tab" data-toggle="tab" href="#education" role="tab" aria-controls="contact" aria-selected="false">나의게시글</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" id="portfolio-tab" data-toggle="tab" href="#portfolio" role="tab" aria-controls="contact" aria-selected="false">내사진</a>
                   </li>
                 </ul>
                 <div class="tab-content" id="myTabContent">                 
                   <div class="tab-pane fade profile-tab" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                       <!-- <div class="profile-desic">
                               <p>Hello, I’m UI/UX Developer / Wordpress Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa.</p>
                           </div>
                           <div class="sec-title">
                               <h2>Services</h2>
                           </div>
                           <div class="row service-ro no-margin">
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fab fa-delicious"></i>
                                       <h4>Graphic Design</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fas fa-code"></i>
                                       <h4>Website Design</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fab fa-chrome"></i>
                                       <h4>Web Development</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fab fa-android"></i>
                                       <h4>Android Development</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fab fa-app-store-ios"></i>
                                       <h4>IOS Design</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                               <div class="col-lg-4 col-md-6 singe-servic">    
                                      <i class="fas fa-mobile-alt"></i>
                                       <h4>Ionic Development</h4>
                                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                           </div> -->
                       
                   </div>
                   <div class="tab-pane education-detail fade" id="education" role="tabpanel" aria-labelledby="contact-tab">
                       <div class="sec-title">
                             <h2>게시글 보기</h2>
                            <%--  <form name="f" id="member_idx">
								<input type="hidden" name="idx" value="${vo.member_idx}" />
							</form>
							<div class="board_box">
								<c:forEach var="vo" items="${mylist}">
									<div class="board" onclick="location.href='board.view?nickname=${vo.nickname}&photo_name=${vo.photo_name}'">
										<p>${vo.nickname}</p>
										<div class="img">
											<img src="resources/upload/${vo.photo_name}">
										</div>
										<div>
											<i class="fa-solid fa-heart" style="width: 10px; height: 10px;"></i>
											<input type="text" value=${vo.like_b}>
										</div>
									</div>
								</c:forEach>
							</div> --%>
							<%-- <form name="f" id="nickname">
								<input type="hidden" name="nickname" value="${param.nickname}" /> 
								<input type="hidden" name="idx" value="${param.idx}" />
							</form> --%>
							<div class="board_box">
								<c:forEach var="vo" items="${list}">
									<div class="board" onclick="location.href='board.view?nickname=${vo.nickname}&photo_name=${vo.photo_name}'">
										<p>${vo.nickname}</p>
										<div class="img">
											<img src="resources/upload/${vo.photo_name}">
										</div>
										<div>
											<i class="fa-solid fa-heart" style="width: 10px; height: 10px;"></i>
											<input type="text" value=${vo.like_b}>
										</div>
									</div>
								</c:forEach>
							</div>
                       </div>
                        <!-- <div class="service no-margin row">
                               <div class="col-sm-3 resume-dat serv-logo">
                                   <h6>2013-2015</h6>
                                 <p>Master Degree</p>
                               </div>
                               <div class="col-sm-9 rgbf">
                                   <h5>Cambridg University</h5>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                           </div>
                           <div class="service no-margin row">
                               <div class="col-sm-3 resume-dat serv-logo">
                                   <h6>2013-2015</h6>
                                 <p>Bacholers Degree</p>
                               </div>
                               <div class="col-sm-9 rgbf">
                                   <h5>Anna University</h5>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                           </div>
                           <div class="service no-margin row">
                               <div class="col-sm-3 resume-dat serv-logo">
                                   <h6>2013-2015</h6>
                                 <p>High School</p>
                               </div>
                               <div class="col-sm-9 rgbf">
                                   <h5>A.M.H.S.S</h5>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                           </div>
                           <div class="service no-margin row">
                               <div class="col-sm-3 resume-dat serv-logo">
                                   <h6>2013-2015</h6>
                                 <p>School</p>
                               </div>
                               <div class="col-sm-9 rgbf">
                                   <h5>Anna University</h5>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                               </div>
                           </div> -->
                       </div>
                        <div class="tab-pane portfolio-detail fade" id="portfolio" role="tabpanel" aria-labelledby="contact-tab">
                            <!-- <div class="row no-margin gallery">
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_01.jpg" alt="">
                               </div>
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_02.jpg" alt="">
                               </div>
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_03.jpg" alt="">
                               </div>
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_04.jpg" alt="">
                               </div>
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_05.jpg" alt="">
                               </div>
                               <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_06.jpg" alt="">
                               </div>
                                <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_10.jpg" alt="">
                               </div>
                                <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_08.jpg" alt="">
                               </div>
                                <div class="col-sm-4">
                                   <img src="resources/images/gallery/gallery_09.jpg" alt="">
                               </div>                                         
                           </div> -->
                        </div>                                  
                   </div>
                 </div>
            </div>

    

	<script src="resources/js/down/jquery-3.2.1.min.js"></script>
	<script src="resources/js/down/popper.min.js"></script>
	<script src="resources/js/down/bootstrap.min.js"></script>
	<script src="resources/js/down/script.js"></script>
	
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