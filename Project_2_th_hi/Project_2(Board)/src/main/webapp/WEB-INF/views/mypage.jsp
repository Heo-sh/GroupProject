<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test3</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my_page.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).on("click", ".naccs .menu div", function() {
			  var numberIndex = $(this).index();

			  if (!$(this).is("active")) {
			    $(".naccs .menu div").removeClass("active");
			    $(".naccs ul li").removeClass("active");

			    $(this).addClass("active");
			    $(".naccs ul").find("li:eq(" + numberIndex + ")").addClass("active");

			    var listItemHeight = $(".naccs ul")
			      .find("li:eq(" + numberIndex + ")")
			      .innerHeight();
			    $(".naccs ul").height(listItemHeight + "px");
			  }
			});
		</script>
	</head>
	<body>
		<header>
			<div class="logo">
			<img src="resources/img/logo.png" onclick="location.href='main_test'">
			</div>
		</header>
		<div class="naccs">
		  <div class="grid">
		   <div class="gc gc--1-of-3">
		    <div class="menu">
		     <div class="active"><span class="light"></span><span>프로필</span></div>
		     <div><span class="light"></span><span>정보수정</span></div>
		     <div><span class="light"></span><span>회원탈퇴</span></div>
		    </div>
		   </div>
		   <div class="gc gc--2-of-3">
		    <ul class="nacc">
		     <li class="active">
		      <div>
		       <p>Beer is the world's oldest[1][2][3] and most widely consumed[4] alcoholic drink; it is the third most popular drink overall, after water and tea.[5] The production of beer is called brewing, which involves the fermentation of sugars, mainly derived
		        from cereal grain starches—most commonly from malted barley, although wheat, maize (corn), and rice are widely used.[6] Most beer is flavoured with hops, which add bitterness and act as a natural preservative, though other flavourings such as
		        herbs or fruit may occasionally be included. The fermentation process causes a natural carbonation effect, although this is often removed during processing, and replaced with forced carbonation.[7] Some of humanity's earliest known writings refer
		        to the production and distribution of beer: the Code of Hammurabi included laws regulating beer and beer parlours,[8] and "The Hymn to Ninkasi", a prayer to the Mesopotamian goddess of beer, served as both a prayer and as a method of remembering
		        the recipe for beer in a culture with few literate people.[9][10]</p>
		      </div>
		     </li>
		     <li>
		      <div>
		       <p>A vine (Latin vīnea "grapevine", "vineyard", from vīnum "wine") in the narrowest sense is the grapevine (Vitis), but more generally it can refer to any plant with a growth habit of trailing or scandent (that is, climbing) stems, lianas or runners.
		        The word also can refer to such stems or runners themselves, for instance when used in wicker work.[1][2] In the United Kingdom, the term "vine" applies almost exclusively to the grapevine. The term "climber" is used for all climbing plants.[3]</p>
		      </div>
		     </li>
		     <li>
		      <div>
		       <p>Lemonade is any of various sweetened beverages found around the world, all characterized by lemon flavor. Most lemonade varieties can be separated into two distinct types: cloudy and clear; each is known simply as "lemonade" (or a cognate) in countries
		        where dominant.[1] Cloudy lemonade, generally found in North America and India, is a traditionally homemade drink made with lemon juice, water, and sweetener such as cane sugar or honey.[2] Found in the United Kingdom, Ireland, South Africa, Australia,
		        and New Zealand, clear lemonade is a lemon flavoured carbonated soft drink. Not to be confused with Sprite a lemon-lime flavored, soft drink.</p>
		      </div>
		     </li>
		    </ul>
		   </div>
		  </div>
		 </div>
	</body>
</html>