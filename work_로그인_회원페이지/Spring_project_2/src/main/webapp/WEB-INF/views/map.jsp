<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>여러개 마커 표시하기</title>
	    <style>
	    	/* .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:200px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: center;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;}
			#placesList li {list-style: none;}
			#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
			#placesList .item span {display: block;margin-top:4px;}
			#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
			#placesList .item .info{padding:10px 0 10px 55px;}
			#placesList .info .gray {color:#8a8a8a;}
			#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
			#placesList .info .tel {color:#009900;}
			#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
			#placesList .item .marker_1 {background-position: 0 -10px;}
			#placesList .item .marker_2 {background-position: 0 -56px;}
			#placesList .item .marker_3 {background-position: 0 -102px}
			#placesList .item .marker_4 {background-position: 0 -148px;}
			#placesList .item .marker_5 {background-position: 0 -194px;}
			#placesList .item .marker_6 {background-position: 0 -240px;}
			#placesList .item .marker_7 {background-position: 0 -286px;}
			#placesList .item .marker_8 {background-position: 0 -332px;}
			#placesList .item .marker_9 {background-position: 0 -378px;}
			#placesList .item .marker_10 {background-position: 0 -423px;}
			#placesList .item .marker_11 {background-position: 0 -470px;}
			#placesList .item .marker_12 {background-position: 0 -516px;}
			#placesList .item .marker_13 {background-position: 0 -562px;}
			#placesList .item .marker_14 {background-position: 0 -608px;}
			#placesList .item .marker_15 {background-position: 0 -654px;}
			#pagination {margin:10px auto;text-align: center;}
			#pagination a {display:inline-block;margin-right:10px;}
			#pagination .on {font-weight: bold; cursor: default;color:#777;} */
			
		    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;z-index: 9999;}
		    .wrap * {padding: 0;margin: 0;}
		    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');border: none;z-index: 9999;}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: none;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
		</style>
	</head>
	<body>
		<div id="map" style="width:100%;height:350px;"></div>
		
		<!-- <div class="map_wrap">
		    <div id="map" style="width:600px;height:300px;overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
		                    <button type="submit">검색하기</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div> -->
		
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d86ec3f2222be57b11c4cad7c716f61"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(${list[0].latitude}, ${list[0].longitude}), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			
			
			// --
			/* // 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  
			
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			// 키워드로 장소를 검색합니다
			searchPlaces();
			
			
			 */
			
			// --
			
			
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [];
			var jsonData = JSON.parse('${list}');
			
			for(var i = 0; i < jsonData.length; i++) {
				var position = {
						latlng: new kakao.maps.LatLng(jsonData[i].latitude, jsonData[i].longitude),
						/* lat: new kakao.maps.LatLng(jsonData[i].latitude),
						lng: new kakao.maps.LatLng(jsonData[i].longitude), */
						brand: jsonData[i].brand,
						region: jsonData[i].region,
						location: jsonData[i].location,						
						address: jsonData[i].address
				};
				
				positions.push(position);
				
			} // for(jsonData.length)
			
			
			
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			  
			
			// 지도에 마커를 표시합니다
			for (var i = 0; i < positions.length; i ++) {
				var data = positions[i];
				displayMarker(data)
				
			} // for(positions)
				
				
				
			function displayMarker(data) {
				
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35);
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    /* var markerImage;

			    if (positions[i].brand === '포토이즘') {
			        markerImage = new kakao.maps.MarkerImage('resources/img/photoism2.png', imageSize);
			    } else if (positions[i].brand === '인생네컷') {
			        markerImage = new kakao.maps.MarkerImage('resources/img/lifefourcuts2.png', imageSize);
			    } else if (positions[i].brand === '포토그레이') {
			        markerImage = new kakao.maps.MarkerImage('resources/img/photogray2.png', imageSize);
			    } else if (positions[i].brand === '하루필름') {
			        markerImage = new kakao.maps.MarkerImage('resources/img/harufilm2.png', imageSize);
			    } else {
			        markerImage = new kakao.maps.MarkerImage('#', imageSize); // 기본값으로 설정하거나 다른 처리 방식을 적용할 수 있습니다.
			    }

			    // markerImage를 사용하여 마커 생성
			    var marker = new kakao.maps.Marker({
			        position: position,
			        image: markerImage
			    }); */

			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: data.latlng, // 마커를 표시할 위치
			        image : markerImage // 마커 이미지 
			    });
			 	
			    
			    
			    // 마커 위에 커스텀오버레이를 표시합니다
			    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			    var overlay = new kakao.maps.CustomOverlay({
			    	map: map,
			    	yAnchor: 3,
			    	position: marker.getPosition()       
			    });
			     
			    
			    // document.createElement로 HTMLElement 구성
			    var wrap = document.createElement('div');
		        wrap.className = 'wrap';
		        wrap.style.display = 'none'; // wrap 요소를 숨김 처리
				
		        var info = document.createElement('div');
		        info.className = 'info';

		        wrap.appendChild(info);
				
		        // 제목
		        var title = document.createElement('div');
		        title.className = 'title';
		        textContent = document.createTextNode(data.brand);
		        
		        title.appendChild(textContent);
		        info.appendChild(title);
				
		        // 닫기
		        var close = document.createElement('button'); 
		        close.className = 'close';
		        close.onclick = function () {
					overlay.setMap(null);
				}
		        title.appendChild(close);

		        var body = document.createElement('div');
		        body.className = 'body';
		        info.appendChild(body);

		        // 이미지
		        var imgDiv = document.createElement('div');
		        imgDiv.className = 'img';
		        body.appendChild(imgDiv);
		        
		        var img = document.createElement('img');
		        img.width = '73';
		        img.height = '70';
				
		        if (positions[i].brand === '포토이즘') {
		            img.src = 'resources/img/photoism2.png';
		        } else if (positions[i].brand === '인생네컷') {
		            img.src = 'resources/img/lifefourcuts2.png';
		        } else if (positions[i].brand === '포토그레이') {
		            img.src = 'resources/img/photogray2.png';
		        } else if (positions[i].brand === '하루필름') {
		            img.src = 'resources/img/harufilm2.png';
		        } else {
		            img.src = '#'; // 기본값으로 설정하거나 다른 처리 방식을 적용할 수 있습니다.
		        }

		        imgDiv.appendChild(img);

		        

		        var desc = document.createElement('div');
		        desc.className = 'desc';
		        body.appendChild(desc);

		        var ellipsis = document.createElement('div');
		        ellipsis.className = 'ellipsis';

		        var text = document.createTextNode(data.region + ' ' + data.location);

		        ellipsis.appendChild(text);

		        desc.appendChild(ellipsis);

		        var jibun = document.createElement('div');
		        jibun.className = 'jibun ellipsis';

		        var text2 = document.createTextNode(data.address);

		        jibun.appendChild(text2);

		        desc.appendChild(jibun);

		        var footerDev = document.createElement('div');
		        desc.appendChild(footerDev);

		        var link = document.createElement('a');
		        link.className = 'link';

		        var text3 = document.createTextNode(data.brand + " 홈페이지");

		        link.appendChild(text3);
		        link.target = '_blank';
		        // positions[i].brand 값에 따라 링크를 설정
		        if (data.brand === '포토이즘') {
		            link.href = 'https://photoism.com';
		        } else if (data.brand === '인생네컷') {
		            link.href = 'https://lifefourcuts.com';
		        } else if (data.brand === '포토그레이') {
		            link.href = 'http://photogray.com';
		        } else if (data.brand === '하루필름') {
		            link.href = 'https://harufilm.com';
		        } else {
		            link.href = '#'; // 기본값으로 설정 or 다른 처리 방식으로 변경
		        }
	
		        footerDev.appendChild(link);
				
		        overlay.setContent(wrap);
		        
			    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			    	// 모든 wrap 요소를 숨김 처리
			        var wraps = document.getElementsByClassName('wrap');
			        for (var i = 0; i < wraps.length; i++) {
			            wraps[i].style.display = 'none';
			        }
			        // 클릭한 마커에 해당하는 wrap 요소만 표시
			        wrap.style.display = 'block';
			        overlay.setMap(map);
			    });
			    
			}

		</script>
	</body>
</html>