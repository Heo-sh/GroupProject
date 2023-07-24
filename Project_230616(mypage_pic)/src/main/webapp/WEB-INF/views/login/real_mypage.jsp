<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>mypage</title>   

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login_css/style.css">
</head>
	<header>
			<nav>
				<div class="containerr" align="center">
					<div class="common" onclick="location.href='intro.do'">
						<img src="resources/img/frame_img/banner_icon01.png" width="80px">
						<div class="hov_txt">
							<p>소개</p>
						</div>
					</div>
					
					<div class="common">
						<img src="resources/img/frame_img//banner_icon02.png" width="80px">
						<div class="hov_txt">
							<p>위치</p>
						</div>	
					</div>
					
					<div class="logo" onclick="location.href='main_test'">
						<img src="resources/img/logo.png" >
					</div>
					
					<div class="common" onclick="location.href='life.do'">
						<img src="resources/img/frame_img/banner_icon04.png" width="80px">
						<div class="hov_txt">
							<p>프레임</p>
						</div>
					</div>
					
					<div class="abm common" onclick="location.href='board.do'">
						<img src="resources/img/frame_img/banner_icon05.png" width="80px">
						<div class="hov_txt">
							<p>앨범</p>
						</div>
					</div>
				</div>
			</nav>
		</header>
   <body>
    <div class="modal">
		<div class="modal_body">
			<p id="del_text" align="justify">
				가입된 회원정보가 모두 삭제됩니다.<br> 
				작성하신 게시물은 삭제되지 않습니다.<br>
				탈퇴 후 같은 계정으로 재가입 시<br>
				기존에 가지고 있던 적립금은 복원되지 않으며,<br>
				사용 및 다운로드했던 쿠폰도 사용 불가능합니다.<br>
				회원 탈퇴를 진행하시겠습니까?<br></p>
			<div id="delbutton">
				<input class="button" type="button" onclick="location.href='real_mypage'" value="취소">
			 	<input class="button" type="button" onclick="location.replace('meb_del.do')" value="탈퇴하기">
			</div>
		</div>
	</div>
        <div class="container web-portion">
            <div class="row top-det">
                <div class="col-md-4">
                    <div class="profil-det-img d-flex">
                       <div class="dp">
                            <img src="resources/img/profile.png" alt="">
                       </div>
                       <div class="pd">
                           <h2>${vo.nickname}님 환영합니다</h2>
							<!-- <button class="btn-open-popup">회원탈퇴</button> -->
                       </div>                                  
                    </div>
                </div>
            </div>
            <div class="nav-detail">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                   <li class="nav-item">
                     <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">회원수정</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" id="education-tab" data-toggle="tab" href="#education" role="tab" aria-controls="contact" aria-selected="false">나의게시물</a>
                   </li>
                   <!-- <li class="nav-item">
                     <a class="nav-link" id="portfolio-tab" data-toggle="tab" href="#portfolio" role="tab" aria-controls="contact" aria-selected="false">내사진</a>
                   </li> -->
                 </ul>
                 <div class="tab-content" id="myTabContent">
                   <div class="tab-pane fade profile-tab" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                   		<div class="right-frame">
							<div class="login-wrap">
							  <div class="login-html">
							    <input id="tab-1" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">정보수정</label>
							    <div class="login-form">
							     <form name="m">
							      <div class="sign-up-htm">
							        <div class="group">
							          <label for="email" class="label">이메일 &#42;</label>
							          <input id="email" type="text" class="input" name="email" value="${vo.email}" readonly>
							          <div class="check_form" id="email_f"></div>
							        </div>
							        <div class="group" id="pass">
							          <label for="pass" class="label">비밀번호 &#42;</label>
							          <input id="pw" type="password" class="input" name="pw" maxlength="30" placeholder="비밀번호를 입력하세요" oninput="check_pw()">
							       	</div>
							        <div class="group">  
							          <input id="pw_check" type="password" class="input" name="pw_check" maxlength="30" placeholder="비밀번호 확인" oninput="check_pw()">
							          <div class="check_form" id="pwcheck_f"></div>
							        </div>
							        <div class="group">
							          <label for="name" class="label">이름 &#42;</label>
							          <input type="text" class="input" name="name" maxlength="20" placeholder="이름을 입력하세요" value="${vo.name}">
							          <div class="check_form" id="name_f"></div>	
							        </div>
							        <div class="group">
							          <label for="nick" class="label">별명 &#42;</label>
							          <input id="nickname" type="text" class="input" name="nickname" maxlength="20" oninput="check_nick()" placeholder="별명을 입력하세요" value="${vo.nickname}">
							          <div class="check_form" id="nick_f"></div>								<!-- oninput: input에 값이 변경될 때마다 oninput 이벤트가 발생 -->
							        </div>
							        <div class="group">
							          <label for="addr" class="label">주소</label>
							          <input type="text" class="input" id="postcode" name="address_postcode" placeholder="우편번호" readonly onclick="findAddr()" value="${vo.address_postcode}">		          		          
							        </div>
							        <div class="group">
							        	<input type="text" class="input" id="address" class="input" name="address" placeholder="주소" readonly onclick="findAddr()" value="${vo.address}">
							        </div>
							        <div class="group">
							        	<input type="text" class="input" id="detailAddress" name="address_detail" placeholder="상세주소" value="${vo.address_detail}">
							        </div>
							        <div class="group">
							          <label for="phone" class="label">핸드폰</label>
							          <input type="text" class="input" name="phone" maxlength="13" oninput="autoHyphen(this)" placeholder="핸드폰번호" value="${vo.phone}">
							        </div>
							       	</form>
							        <div class="hr"></div>
							        <div class="group">
							          <input class="button" id="sign_update" value="정보수정" onclick="send()" readonly>
							        </div> 
							        <div class="group">  
							          <input class="button" id="cancel" value="취소" onclick="location.replace('real_mypage')" readonly>
							        </div>
							         <div class="group">  
							          <input class="button" id="btn-open-popup" value="회원탈퇴" readonly>
							        </div>
							      </div>							      
							    </div>
							  </div>
							</div>	
						</div>                       
                   </div>
                   <div class="tab-pane education-detail fade" id="education" role="tabpanel" aria-labelledby="contact-tab">
                       <div class="sec-title">
                             <!-- <h2>게시글 보기</h2>  -->
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
                   </div>
                 </div>
            </div>

    

	<script src="resources/js/mypage/jquery-3.2.1.min.js"></script>
	<script src="resources/js/mypage/popper.min.js"></script>
	<script src="resources/js/mypage/bootstrap.min.js"></script>
	<script src="resources/js/mypage/script.js"></script>
	<script src="resources/js/httpRequest.js"></script>
	<script src="resources/js/phone.js"></script> <!-- 핸드폰 정규식 적용(000-000-0000 or 000-0000-0000)-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 주소 api -->
	
	<script type="text/javascript">
	
		// 모달 창 스크립트
	    const body = document.querySelector('body');
	    const modal = document.querySelector('.modal');
	    const btnOpenPopup = document.querySelector('#btn-open-popup');
	
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
		
		/* 정보수정 */					
		// 이메일 중복체크
		function check_email() {
			
			var email = document.getElementById("email").value.trim();
			var email_f = document.getElementById("email_f");
			
			/* 이메일 정규식 */
			// ex) abc123@defgh456.ijk
			// " -" ," _"," ." 세개의 문자 입력을 허용하며 
			// 도메인 주소 " ."  이전에 "@" 가 나와야 하고
			// 도메인 주소 "."   이후에 2-3 문자는 와야된다
			var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			// 유효성 체크
			// 이메일이 값이 비어있거나 이메일형식이 아닐 때 빨간색으로 텍스트 출력
			if (email == "") {
				
				email_f.innerHTML="이메일을 입력해주세요";
				email_f.style.color = '#DF0000';
				return;
				
			} else if (!pattern.test(email)) {
				
				email_f.innerHTML="이메일 형식으로 입력해주세요";
				email_f.style.color = '#DF0000';
				return;
			}
			
			var url = "check_email";
			var param = "email="+encodeURIComponent(email);
			
			sendRequest(url, param, resultFn, "POST");	
		}
		
		function resultFn() {
			
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
									
				if(json[0].result == "no") {
					
					email_f.innerHTML="이미 사용중인 이메일 입니다";
					email_f.style.color = '#DF0000';
					document.getElementById("sign_update").disabled = true;
					
				} else {
					
					email_f.innerHTML="사용가능한 이메일 입니다";
					email_f.style.color = 'green';
					document.getElementById("sign_update").disabled = false;
				}										
			}				
		}
		
		// 비밀번호 확인
		function check_pw() {
							
			var pw = document.getElementById("pw").value.trim();
			var pw_check = document.getElementById("pw_check").value.trim();
			var pwcheck_f = document.getElementById("pwcheck_f");
			//document.getElementById("sign_update").setAttribute("style","background-color:#7b7b7b;")
			
			if (pw != pw_check) {
				
				pwcheck_f.innerHTML = "비밀번호가 맞지 않습니다 다시 입력해주세요";
				pwcheck_f.style.color = '#DF0000';
				document.getElementById("sign_update").disabled = true; // 정보수정 버튼 비활성화 
				//document.getElementById("sign_update").setAttribute("style","background-color:#efeeee;")
				return;
									
			} else if (pw == "" || pw_check == "") {
				
				pwcheck_f.innerHTML = "비밀번호를 입력해주세요";
				pwcheck_f.style.color = '#DF0000';
				document.getElementById("sign_update").disabled = true; // 정보수정 버튼 비활성화 
				//document.getElementById("sign_update").setAttribute("style","background-color:#efeeee;")
				return;

			} else {
				
				pwcheck_f.innerHTML = "비밀번호가 일치합니다";
				pwcheck_f.style.color = 'green';
				document.getElementById("sign_update").disabled = false; // 정보수정 버튼 활성화
			}
			
		}
		
		// 별명 중복체크
		function check_nick() {
			
			var nickname = document.getElementById("nickname").value.trim();
			var nick_f = document.getElementById("nick_f");
			
			// 유효성 체크
			// 별명 값이 비어있을 때 빨간색(#DF0000)으로 텍스트 출력
			if (nickname == "") {
				
				nick_f.innerHTML="별명을 입력해주세요";
				nick_f.style.color = '#DF0000';
				return;
			}
			
			var url = "check_nickname";
			var param = "nickname="+encodeURIComponent(nickname);
			
			sendRequest(url, param, resultFnn, "POST");	
		}
		
		function resultFnn() {
			
			if(xhr.readyState == 4 && xhr.status == 200) {
				
				var data = xhr.responseText;
				var json = (new Function('return'+data))();
									
				if(json[0].result == "no") {
					
					nick_f.innerHTML="이미 사용중인 별명 입니다";
					nick_f.style.color = '#DF0000';
					document.getElementById("sign_update").disabled = true;
					
				} else if (json[0].result == "same") {
					
					nick_f.innerHTML="";
					document.getElementById("sign_update").disabled = false;
					
				} else {
					
					nick_f.innerHTML="사용가능한 별명 입니다";
					nick_f.style.color = 'green';
					document.getElementById("sign_update").disabled = false;
					
				}									
			}				
		}
		
		// 주소 api
	    function findAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

	                var addr = ''; // 주소 변수
	                		                
	              	//사용자가 선택한 주소 타입(도로명, 지번)에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postcode").value = data.zonecode;		                
	                document.getElementById("address").value = addr;
	                
	             	// 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
					
	            }
	        }).open();
		}
	    
		
		function send() {
						
			var m = document.m;
			var email = m.email.value.trim();
			var pw = m.pw.value.trim();
			var name = m.name.value.trim();
			var nickname = m.nickname.value.trim();
			
			// 유효성 검사
			// 500에러 방지
			
			if (pw == "" || pw_check == "") {
				
				return;
			}
			
			if (name == "") {
				
				document.getElementById("name_f").innerHTML="이름을 입력해주세요";
				document.getElementById("name_f").style.color = '#DF0000';
				return;
			}
			
			if (nickname == "") {
				
				return;
			}				
			
			m.action = "update.do";
			m.method = "POST";
			m.submit();
			
		}
	</script>
	
	</body>
</html>