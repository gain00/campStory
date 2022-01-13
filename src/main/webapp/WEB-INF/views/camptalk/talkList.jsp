<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
camptalk - camptalklist
<script>
var arr = new Array();
	<c:forEach items="${list}" var="map">
		arr.push({title:"${map.facltnm}",x:"${map.mapx}",y:"${map.mapy}"});
	</c:forEach>
</script>

<script>
	function openSelect(){
		var popupX = (document.body.offsetWidth / 2) - (500/2);
		var popupY = (window.screen.height /2) - (500/2);
		
		url = "/campTalk/areaSelect"
		open(url,"지역선택","width=500,height=500,left="+popupX+",top="+popupY);
	}
</script>


<table border="1" width="800">
	<tr>
	<td width="20%">${area}</td>
	<td width="10%"><a href="#" onclick="openSelect()">지역변경 </a></td>
	<td style="text-align:right;width:40%"> <input type="button" value="톡작성" onclick="window.location='/campTalk/talkWrite'"/>	</td>
	<td></td>
	</tr>
</table>

<table border="1" width="800">
	<tr><td width="70%" valign="top">

		
		<c:forEach items="${list}" var="dto">
			<table style="border: 1px solid #000; margin-top: 20px"   >
			<tr>
				<td height="100px" rowspan="2"><img src="/resources/campTalk/map/zz.png" width="100"></td>
				<!-- <td height="100px" rowspan="2"><input type="image" src="/resources/campTalk/map/zz.png" width="100" onclick="map_move()"></td> -->
				<%-- <td height="30px" width="300px">${dto.name} 캠프명 &nbsp;&nbsp;<input type="image" src="/resources/campTalk/map/zz.png" width="20" onclick="map_move(${dto.y}, ${dto.x })"></td> --%>
				<td height="30px" width="300px">캠프명 : ${dto.facltnm} &nbsp;&nbsp;<input type="button" value="위치확인" onclick="map_move(${dto.mapy}, ${dto.mapx })"></td>
				<td > time </td>
			</tr>
			<tr><td height="70px">${dto.contentid} talkContent </td>
			<td><a href="/campTalk/talkGood">관심이미지</a></td></tr>
		</table>
		</c:forEach>
	</td>
	<td>
		<div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b5778788b34c5b2d22e5d6adab50e0"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(38.00275028, 127.1388483), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var positions = new Array();
		for(var i = 0; i < ${fn:length(list)}; i++){
			positions.push ({
				title: arr[i].title,
		        latlng: new kakao.maps.LatLng(arr[i].y, arr[i].x)
			});
		}
		
		var imageSrc = "/resources/campTalk/map/zz.png"; 
		
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(10, 10); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
		function map_move(a,b) {
			var imageSrc = "/resources/campTalk/map/zz.png"; 
			 
			var imageSrc1 = "/resources/campTalk/map/qq.png"; 
			var imageSize1 = new kakao.maps.Size(15, 15);
			var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1);
		    
		    for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			   var imageSize = new kakao.maps.Size(10, 10);
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			}
		    
		    new kakao.maps.Marker({
		        position: new kakao.maps.LatLng(a, b),
		        image: markerImage1
		    }).setMap(map);
		    
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(a, b);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}   
		
		
		</script>
	</td>
	</tr>

</table>
