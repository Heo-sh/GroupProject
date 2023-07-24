<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 	href="resources/css/board_css/board_view.css?after">
<script src="resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/all.min.js"></script>
<!-- 게시글 삭제하기 -->
<script type="text/javascript">
	function del(){
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		var writter_nickname = document.getElementById("writter_nickname").value; 
		var admin = document.getElementById("admin").value; 
		
		/* console.log(writter_nickname);
		console.log(admin); */
		
		if (writter_nickname != admin) {
			alert("작성자만 삭제 가능합니다.");
			return;
		}
		
		var url = "del.do";
		var param = "board_id=${bp.board_id}";
		
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			if (json[0].res == 'yes') {
				alert("삭제되었습니다.");
				location.href = "board.do";
			} else {
				alert("삭제 실패");
			}
		}
	}
</script>
<!-- 좋아요 버튼 기능 활성화 -->
<script type="text/javascript">
	var result = false; //하트 이미지를 바꾸기 위한 변수
	
	function addLike() {
		var like_count = document.getElementById("like_count");
		
		if (!result) {
			const pushHeartBtn = document.getElementById("like_btn");
			pushHeartBtn.innerHTML = '<i class="fa-solid fa-heart" style="width: 100%; height: 100%;"></i>';
			pushHeartBtn.style.color = 'red';
			result = true;
			like_count.setAttribute("value", "true");
			console.log(like_count.value);
			
		} else {
			const pushHeartBtn = document.getElementById("like_btn");
			pushHeartBtn.innerHTML = '<i class="fa-regular fa-heart" style="width: 100%; height: 100%;"></i>';
			pushHeartBtn.style.color = 'black';
			result = false;
			like_count.setAttribute("value", "false");
			console.log(like_count.value);
		}
		
		var url = "like.do";
		var param = "board_id=${bp.board_id}" + "&like_count=" + like_count.value.trim() +
					"&nickname=${param.nickname}" + "&photo_name=${param.photo_name}"
		
 		sendRequest(url, param, resultLike, "POST"); 
	}
	
	function resultLike() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			var countlike = document.getElementById("counting");
			//console.log(countlike);
			if (json[0].res == 'up') {
				countlike.value = ${bp.like_b + 1};
			} else if (json[0].res == 'down') {
				countlike.value = ${bp.like_b};
			} else {
				alert("좋아요 반응이 안되었습니다.");
				
			}
		}
	}
</script>
<!-- 댓글을 위한 기능 -->
<script type="text/javascript">
	function reply() {
		var admin_nickname = document.getElementById("admin").value;
		var content = document.getElementById("comment").value.trim();
		
		if(!confirm("댓글을 등록하시겠습니까?")) {
			return;
		}
		
		if (admin_nickname == '') {
			alert("로그인 후 이용 가능합니다.");
			location.href = 'login_join';
			return;
		}
		if (content == '') {
			alert("댓글을 입력하세요");
			return;
		}			
		
		if (admin_nickname != '' && content != '') {
			var url = "reply";
			var param = "member_idx=" + ${email.member_idx} + "&board_id=" + ${bp.board_id} +
						"&content=" + content;
			
			sendRequest(url, param, resComm, "POST");			
		}
	}
	
	function resComm() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = (new Function('return' + data))();
			
			if (json[0].result == 'yes') {
				alert("댓글 등록 완료");
			} else {
				alert("댓글 등록 중 이상이 생겼습니다.");				
			}
		}
	}
</script>
<!-- 대댓글을 보이게 하기 위한 jQuery문-->
<script type="text/javascript">
$(document).ready(function() {
    $(".reply_btn").click(function() {
        var comment = $(this).closest(".comment_each");
        var admin = comment.find(".admin");
        var text = comment.find(".text");
        text.prop("type", "text");
        admin.prop("type", "text");
        var replyBtn = comment.find(".reply_submit_btn");
        replyBtn.css("visibility", "visible");
        var cancelBtn = comment.find(".cancel_btn");
        cancelBtn.css("visibility", "visible");
    });

    $(".cancel_btn").click(function() {
        var comment = $(this).closest(".comment_each");
        var text = comment.find(".text");
        var admin = comment.find(".admin");
        text.prop("type", "hidden");
        admin.prop("type", "hidden");
        var replyBtn = comment.find(".reply_submit_btn");
        replyBtn.css("visibility", "hidden");
        var cancelBtn = comment.find(".cancel_btn");
        cancelBtn.css("visibility", "hidden");
    });
    
    /* 대댓글 추가를 위한 기능 */
    $(".reply_submit_btn").click(function() {
    	var comment = $(this.closest(".comment_each"));
    	var text = comment.find(".text").val();
    	var idx = comment.find(".idx").val();
    	var member_idx = comment.find(".member_idx").val();
		var admin_nickname = comment.find(".admin").val();
		
    	if(!confirm("댓글을 등록하시겠습니까?")) {
			return;
		}
		
		if (admin_nickname == '') {
			alert("로그인 후 이용 가능합니다.");
			location.href = 'login_join';
			return;
		}
		if (text == '') {
			alert("댓글을 입력하세요");
			return;
		}			
    	
    	$.ajax({
    		url: "re_reply",
    		method: "POST",
    		data: {
    			content: text,
    			idx: idx,
    			member_idx: member_idx
    		},
    		success: function(response) {
    			alert("댓글 등록 완료");
    			return;
    		},
    		error: function(xhr, status, error) {
    			alert("댓글 등록 중 오류 발생");
    		}
    	})
    })
    
    /* 댓글 삭제를 위한 기능 */
    $(".del_btn").click(function() {
    	var comment = $(this.closest(".comment_each"));
    	var admin = comment.find(".admin").val();
    	var com_nick = comment.find(".com_nick").val();
    	var idx = comment.find(".idx").val();

    	if (!confirm("삭제하시겠습니까?")) {
    		return;	
    	}
    	
   		if (admin == '') {
   			alert("로그인하세요");
   			location.href = 'login_join';
   		} else {
	    	if (admin != com_nick) {
	    		alert("작성자만 삭제 가능합니다.");
	    		return;
	    	}
   		}
    	
    	
    	$.ajax({
    		url: "del_reply",
    		method: "POST",
    		data: {
    			idx: idx
    		},
    		success: function(response) {
    			alert("댓글 삭제 완료");
    			return;
    		},
    		error: function(xhr, status, error) {
    			alert("댓글 삭제 중 오류 발생");
    			return;
    		}
    	})
    })
    /* 댓글 좋아요 기능 */
    var result = false;
    $(".comment_like_btn").click(function() {
    	var comment = $(this.closest(".comment_each"));
    	var idx = comment.find(".idx").val();
    	var like_image = comment.find("i.fa-heart");
    	var comment_like = comment.find("comment_like").val();
    	
    	if (!result) {
    		comment_like = true;
    		result = true;
    	} else {
    		comment_like = false;
    		result = false;
    	}
    	
    	$.ajax({
    		url: "comment_like",
    		method: "POST",
    		data: {
    			idx: idx,
    			comment_like: comment_like
    		},
    		success: function(response) {
    			if (response[0].res == "up") {
	    			like_image.removeClass("fa-regular fa-heart").addClass("fa-solid fa-heart");
	    			comment.find(".comment_like_count").val(parseInt(comment.find(".comment_like_count").val()) + 1);
    			} else {
    				comment.find(".comment_like_count").val(parseInt(comment.find(".comment_like_count").val()) - 1);
    			}
    		},
    		error: function(xhr, status, error) {
    		}
    	})
    }) 
});
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
					<li><a href="#">${brand[0].brand_name}</a></li>
					<li><a href="#">${brand[1].brand_name}</a></li>
					<li><a href="#">${brand[2].brand_name}</a></li>
					<li><a href="#">${brand[3].brand_name}</a></li>
					<li><a href="#">${brand[4].brand_name}</a></li>
				</ul></li>
			<li class="board_btn"><a href="#">게시판</a></li>
			<li class="login_btn"><a href="#">Login</a>
				<ul>
					<li><a href="#">sign in</a></li>
					<li><a href="#">my page</a></li>
				</ul></li>
		</ul>
	</div>
	<hr style="color: gray;">
	<div class="board_mainbox">
		<h1>게시글 보기</h1>
		<div class="flex_container">
			<div class="board">
				<div class="nickname_box">
					<input type="text" class="nickname" id="writter_nickname" value="${bp.nickname}" readonly /> 
					<input type="button" class="delete_btn" onclick="del()" value="삭제">
					<input type="hidden" name="board_idx" value="${bp.board_id}">
				</div>
				<div class="img_box">
					<img src="resources/upload/${bp.photo_name}">
				</div>
				<div class="function_box">
					<button id="like_btn" onclick="addLike()">
						<i class="fa-regular fa-heart" style="width: 100%; height: 100%;"></i>
					</button>
					<input type="hidden" value="false" id="like_count"> 
					<input type="text" value="${bp.like_b}" id="counting" readonly /> 
				</div>
				<div class="content_mainbox">
					<input type="text" class="nickname2" value="${bp.nickname}" readonly />
					<textarea class="content" readonly>
                            ${bp.content}
                        </textarea>
				</div>
			</div>
			<div class="comment_mainbox">
				<div class="h2_box">
					<h2>Comment Box</h2>
				</div>
				<div class="real_comment_box">
						<c:forEach var="comment" items="${comment}">
							<div class="comment_each">
								<c:if test="${comment.parentnum ne 0 }">
									&nbsp;
								</c:if>
								<c:if test="${comment.step ne 0 }">
									<i class="fa-solid fa-arrow-right"></i>
								</c:if>
								<input type="text" name="com_nick" value="${comment.nickname}" id="com_nick" class="com_nick">
								<input type="text" name="com_cotent" value="${comment.content}" class="com_content"> 
		                        <div class="com_func_box"> 
		                            <button class="comment_like_btn" >
										<i class="fa-regular fa-heart" style="width: 15px; height: 15px;"></i>
									</button>
									<input type="hidden" value="false" class="comment_like"> 
									<input type="text" value="${comment.like_b}" class="comment_like_count" readonly />		            
		                            <input type="button" value="삭제" class="del_btn">
		                        </div>
					    		<input type="button" class="reply_btn" value="답글 달기">
							    <div>
							        <input type="hidden" class="admin" id="reply_admin" value="${email.nickname}">
									<input type="hidden" class="member_idx" value="${email.member_idx}">
							        <input type="hidden" class="idx" value="${comment.idx}">
							        <input type="hidden" class="text"> 
							        <input type="button" class="reply_submit_btn" value="등록" style="visibility: hidden;">
							        <input type="button" class="cancel_btn" value="취소" style="visibility: hidden;">
							    </div>
							</div>
						</c:forEach>
				</div>
				<div class="comment_insert_box">
					<input type="text" name="nickname" id="admin" value="${email.nickname}" readonly /> 
					<input type="hidden" id="member_idx" value="${email.member_idx}">
					<input type="text" id="comment" placeholder="댓글을 입력하세요" class="comment"> 
					<input type="button" value="게시" onclick="reply()">
				</div>
			</div>
		</div>
	</div>
</body>
</html>