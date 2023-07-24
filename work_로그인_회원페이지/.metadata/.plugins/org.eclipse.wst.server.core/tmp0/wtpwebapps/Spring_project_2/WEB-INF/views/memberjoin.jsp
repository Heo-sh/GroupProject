<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>memberjoin</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
		<script src="resources/js/httpRequest.js"></script>
		<script type="text/javascript">
			var b_nickCheck = false;
			
			// 별명 중복체크를 하기 위한 메서드
			function check_nick() {
				
				var nickname = document.getElementById("nickname").value.trim();
				
				// 유효성 체크
				if (nickname == "") {
					
					alert("별명을 입력하세요");
					return;
				}
				
				var url = "check_nickname";
				var param = "nickname="+encodeURIComponent(nickname);
				
				sendRequest(url, param, resultFn, "POST");
	
			}
			
			function resultFn() {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					if(json[0].result == "no") {
						
						alert("이미 사용중인 별명 입니다");
						return;
						
					} else {
						
						alert("사용가능한 별명 입니다");
						b_nickCheck = true;
					}
					
					
				}
				
			}
			
			// input 태그에 글자가 한 글자라도 바뀔 때 호출
			function nick() {
				
				b_nickCheck = false;
			}
		
			function send(f) {
				
				var email = f.email.value.trim();
				var pw = f.pw.value.trim();
				var nickname = f.nickname.value.trim();
				var name = f.name.value.trim();
				var address = f.address.value;
				var phone = f.phone.value;
							
				if (email == "") {
					
					alert("이메일을 입력해주세요");
					return;
				}
								
				if (pw == "") {
					
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				if (name == "") {
					
					alert("이름을 입력해주세요");
					return;
				}
				
				if (nickname == "") {
					
					alert("별명을 입력해주세요");
					return;
				}
				
				if(!b_nickCheck) {
					
					alert("별명 중복체크를 하세요");
					return;
				}
				
				f.action = "member_insert";
				f.method = "POST";
				f.submit();
			}
		</script>
	</head>
	<body>
		<header>
			<div class="logo" >
			<img src="resources/img/logo.png" onclick="location.href='main'">
			</div>
		</header>
		<form>
			<table border="1" align="center">
				<caption>회원가입</caption>
				<tr>
					<th>이메일</th>
					<td>
						<input name="email" placeholder="aaa@a.com">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pw" type="password" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input name="name" placeholder= "이름">
					</td>
				</tr>
				<tr>
					<th>별명</th>
					<td>
						<input name="nickname" id="nickname" placeholder="별명" onchange="nick()">
						<input type="button" value="별명중복체크" onclick="check_nick()" style="cursor:pointer;">
					</td>
				</tr>				
				<tr>
					<th>주소</th>
					<td>
						<input name="address" placeholder="주소">
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<input name="phone" placeholder="010-xxxx-xxxx">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="가입" onclick="send(this.form)" style="cursor:pointer;">
					<input type="button" value="취소" onclick="location.href='main'" style="cursor:pointer;">
					</td>
				</tr>
			</table>
		</form>		
	</body>
</html>