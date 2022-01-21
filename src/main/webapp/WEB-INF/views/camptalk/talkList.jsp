<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
camptalk - camptalklist

<style>

#ex1 {
  background-color : #eee;
  border-radius: 50%
}

#ex1 {
  width: 50px;
  height: 50px;
  display: table-cell;
  vertical-align: middle;
  text-align:center;
}
</style>


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
	<td width="20%">${areaKor} /// ${areaEng}</td>
	<td width="10%"><a href="#" onclick="openSelect()">지역변경 </a></td>
	<td style="text-align:right;width:40%"> <input type="button" value="톡작성" onclick="window.location='/campTalk/talkWrite'"/>	</td>
	<td></td>
	</tr>
</table>


<script>
 	function good_on(on){
		on.style.backgroundColor="red";
	}
	
	function good_out(out){
		out.style.backgroundColor="#eee";
	}
	function good_click_up(num_talk){
		window.location="/campTalk/goodUp?num_talk="+num_talk;
	}
	function good_click_down(num_talk){
		window.location="/campTalk/goodDown?num_talk="+num_talk;
	}

</script>

<table border="1" width="800">
	<tr><td width="70%" valign="top">

		
		<c:forEach items="${list}" var="dto">
			<table style="border: 1px solid #000; margin-top: 20px"   >
			<tr>
				<td height="100px" rowspan="2"> <img src="${dto.firstimageurl}" width="100px" height="100px"> </td>
				<td height="30px" width="300px">캠프명 : ${dto.camp} &nbsp;&nbsp;<input type="button" value="위치확인" onclick="map_move(${dto.mapy}, ${dto.mapx })"></td>
				<td > <fmt:formatDate value="${dto.reg_time}" pattern="yy-MM-dd" /> </td>
			</tr>
			<tr><td height="70px">${dto.content} // ${dto.contentid } </td>
			<td>
				<c:set var="check" value="0" />
				<c:forEach items="${goodList}" var="goodL">
					<c:if test="${dto.num_talk == goodL.num_talk && goodL.writer == 'testid1'}">
					   <c:set var="check" value="1" />
					</c:if>
				</c:forEach>
				<c:if test="${check==1}">
					<div id='ex1' style="background-color: red" onclick="good_click_down(${dto.num_talk})">
				    ${dto.good} <br/>
					<img src = "/resources/campTalk/map/good.png" style="width: 30px;background-color: red" id="good_change" >
					</div>
			 	</c:if>
			 	<c:if test="${check==0}">
					<div id='ex1'  onmouseover="good_on(this)" onmouseout="good_out(this)" onclick="good_click_up(${dto.num_talk})">
					${dto.good} <br/>
					<img src = "/resources/campTalk/map/good.png" style="width: 30px;" id="good_change" >
					</div>
			 	</c:if>
			</td></tr>
		</table>
		</c:forEach>
	</td>
	<td>
		<div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b5778788b34c5b2d22e5d6adab50e0"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(38.001275028, 127.9136883), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var markers = [];
		
		var positions = new Array();
		for(var i = 0; i < ${fn:length(list)}; i++){
			positions.push ({
				title: arr[i].title,
		        latlng: new kakao.maps.LatLng(arr[i].y, arr[i].x)
			});
			
		}
		var imageSrc = "/resources/campTalk/map/zz.png"; 
		
		for (var i = 0; i < positions.length; i ++) {
		    
			var imageSize = new kakao.maps.Size(20, 20);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		    	map: map,
		        position: positions[i].latlng, // 마커를 표시할 위치
		        image : markerImage // 마커 이미지
		    });
		    markers.push(marker);
		}
		
		function map_move(a,b) {
			var imageSrc1 = "/resources/campTalk/map/qq.png"; 
			var imageSize1 = new kakao.maps.Size(20, 20);
			var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1);
		    for ( var i = 0; i < markers.length; i++ ) {
		       	markers[i].setMap(null);
	   		}   
	    	markers = [];
	     for (var i = 0; i < positions.length; i ++) {
				var imageSize = new kakao.maps.Size(10, 10);
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			    	map: map,
			        position: positions[i].latlng, // 마커를 표시할 위치
			        image : markerImage // 마커 이미지
			    });
			    markers.push(marker);
			} 
			
		     var mar1 = new kakao.maps.Marker({
		    	 map: map,
		        position: new kakao.maps.LatLng(a, b),
		        image : markerImage1 // 마커 이미지
		    });
		     markers.push(mar1);
		    
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(a, b);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);
		}   
		
		
		</script>
	</td>
	</tr>
	<tr><td align="center">
		<c:if test="${page.pageStart > 10}">
			<a href="/campTalk/talkList?pageNum=${page.pageStart - 10}&areaEng=${areaEng}">[이전]</a>
		</c:if>	
		
		<c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
			<a href="/campTalk/talkList?pageNum=${i}&areaEng=${areaEng}">${i}</a>
		</c:forEach>
	
					
		<c:if test="${page.pageEnd < page.pageCount}">
			<a href="/campTalk/talkList?pageNum=${page.pageStart + 10}&areaEng=${areaEng}">[다음]</a>
		</c:if>	

	</td></tr>

</table>
