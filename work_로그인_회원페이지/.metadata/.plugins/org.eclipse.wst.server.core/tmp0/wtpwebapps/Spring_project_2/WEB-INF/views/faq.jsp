<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>faq</title>		
		<style type="text/css">
			input[id*="answer"] {
				display:none;
			}
			
			input[id*="answer"] + label {
				display: block;
				padding: 20px;
				border: 1px solid #232188;
				border-bottom: 0;
				color:#fff;
				font-weight: 900;
				background: #3634a5;
				cursor: pointer;	
			}
			
			input[id*="answer"] + label em {
				position: absolute;
				top:50%;
				right:10px;
				width: 30px;
				height: 30px;
				margin-top: 15px;
				display: inline-block;
				background: url('./resources/img/arrow.png') 0 0 no-repeat;	
			}
			
			input[id*="answer"] + label + div {
				
				max-height: 0;
				transition: all .35s;
				overflow: hidden;
				background: #ebf8ff;
				font-size: 11px;
			}
			
			input[id*="answer"] + label + div p {
				display: inline-block;
				padding: 20px;
			}
			
			input[id*="answer"]:checked + label + div {max-height: 100px;}
			
			input[id*="answer"]:checked + label em {background-position: 0 -30px;}
		</style>
	</head>
	<body>
		<div class= "accordion">
			<input type ="checkbox" id="answer01">
			<label for="answer01">Q  1.질문<em></em></label>
			<div><p>자주묻는 질문의 답변이 여기에 들어갑니다
					이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다</p></div>
			<input type ="checkbox" id="answer02">
			<label for="answer02">Q  2.질문<em></em></label>
			<div><p>자주묻는 질문의 답변이 여기에 들어갑니다
					이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다</p></div>
			<input type ="checkbox" id="answer03">
			<label for="answer03">Q  3.질문<em></em></label>
			<div><p>자주묻는 질문의 답변이 여기에 들어갑니다
					이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다</p></div>
			<input type ="checkbox" id="answer04">
			<label for="answer04">Q  4.질문<em></em></label>
			<div><p>자주묻는 질문의 답변이 여기에 들어갑니다
					이곳에서 자연스럽게 나오는 효과를 볼 수 있습니다</p></div>
		</div>
	</body>
</html>