<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
#ex1 {
  background-color : #eee; border-radius: 50%
}

#ex1 {
  width: 50px; height: 50px; display: table-cell; vertical-align: middle; text-align:center;
}
</style>

<script>
	function openSelect(){
		var campS="${campS}";
		var popupX = (document.body.offsetWidth / 2) - (500/2);
		var popupY = (window.screen.height /2) - (500/2);
		
		url = "/campTalk/areaSelect?listType="+${listType}+"&campS="+campS;
		open(url,"지역선택","width=500,height=500,left="+popupX+",top="+popupY);
	}
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
	function talkUpdate(num_talk){
		window.location="/campTalk/talkUpdate?num_talk="+num_talk;
		
	}
	function talkDelete(num_talk){
		if(confirm("삭제?")){
			window.location="/campTalk/talkDelete?num_talk="+num_talk;
		}
	}
	

	$(document).ready(function(){
		$("#awBtn${dto.num_talk}").click(function(){
			$.ajax({
				type: "post",
				url: "/campTalk/qna",
				data: { num_talk: $("#qna${dto.num_talk}").val(), content: $("#aw${dto.num_talk}").val(), ano:$('input[name="ano${dto.num_talk}"]:checked').val(), writer:$("#qnaID").val() },
				success: function(data){
					if(data == 1){
						var anoCheck = $('input[name="ano${dto.num_talk}"]:checked').val();
						var anoResult = "";
						alert("답글 작성");
						
						if( anoCheck == "ano"){
							anoResult = "익명";
						} else {
							anoResult = $("#qnaID").val();
						}
						$("#a${dto.num_talk}").append( $("#aw${dto.num_talk}").val() +"&nbsp;&nbsp;&nbsp;&nbsp;작성자 : " +anoResult + "<br/>");
						
					}
				}
			});
		});
	});
	
	function answer(num){
		var nid = "a"+num;
		 
		var aa = document.getElementById(nid);
		if(aa.style.display=='none'){
			aa.style.display='block';
		} else {
			aa.style.display='none';
		}
	}
	
</script>


<form action="/campTalk/talkList" method="get" >
	<table border="1" width="1000">
		<tr>
		<td width="10%">${areaKor}
		<c:if test="${empty areaKor}">
			전국
		</c:if>
		</td>
		<td width="10%"><a href="#" onclick="openSelect()">지역변경 </a></td>
		<td width="50%">
				<input type="text" name="campS" id="campS" size="30" value="${campS}">
				<input type="hidden" name="listType" value="1">
				<input type="submit" value="검색">
				<label >검색수 : ${page.totalCount}</label>
		</td>
		<td style="text-align:right;width:30%">
			<input type="button" value="초기화" onclick="window.location='/campTalk/talkList'"/>
			<c:if test="${sessionScope.id == null}">
				<input type="button" value="내글" onclick="window.location='/campTalk/talkList?listType=2'"/>
				<input type="button" value="내관심" onclick="window.location='/campTalk/talkList?listType=3'"/>
				<input type="button" value="톡작성" onclick="window.location='/campTalk/talkWrite'"/>	
			</c:if>
		</td>
		</tr>
	</table>
</form>

<table border="0" width="1000">
	<tr><td width="70%" valign="top">
		<c:forEach items="${list}" var="dto">
			<table style="border: 1px solid #000; margin-top: 20px"   >
			<tr>
				<td height="100px" rowspan="2">
				 
				     <c:if test="${dto.firstimageurl == '0'}">
    					<img src="/resources/campTalk/firstImage.png" width="100px" height="100px"/>
    				</c:if>
				     <c:if test="${dto.firstimageurl != '0'}">
					 	<img src="${dto.firstimageurl}" width="100px" height="100px">
    				</c:if>
				 </td> 
				<td height="30px" width="500px">
				캠프명 : ${dto.camp} &nbsp;&nbsp;
				<input type="button" value="위치확인" onclick="map_move(${dto.mapy}, ${dto.mapx })">
				<c:if test="${dto.writer == 'testid'}">
					<input type="button" value="수정" onclick="talkUpdate(${dto.num_talk})">
					<input type="button" value="삭제" onclick="talkDelete(${dto.num_talk})">
				</c:if>
				
				</td>
				
				<td > 
				<c:if test="${dto.ano == 'id'}">
					${dto.writer}
				</c:if> 
				<c:if test="${dto.ano == 'anonymity'}">
					익명
				</c:if>
				
				<br/> <fmt:formatDate value="${dto.reg_time}" pattern="yy-MM-dd" /> </td>
			</tr>
			<tr><td height="70px">
			<c:if test="${dto.sub == 'talk'}">
				${dto.content} // ${dto.contentid }
			</c:if>
				<c:if test="${dto.sub == 'qe'}">
				[질문] ${dto.content} // ${dto.contentid }<br/>
				
				<c:set var="qnaCount" value="0"/>
				<c:forEach items="${qnaList}" var="qnaList">
					<c:if test="${dto.num_talk==qnaList.num_talk}">
						<c:set var="qnaCount" value="${qnaCount + 1}"/>					
					</c:if>
				</c:forEach>
				
				<input type="button" value="답글 ${qnaCount}" onclick="answer(${dto.num_talk})">
				
				<div id="a${dto.num_talk}" class="pkg" style="display:none">
					
					답글쓰기 : <input type="text" name="aw" id="aw${dto.num_talk}"/> 
					익명 : <input type="checkbox" value="ano" name="ano${dto.num_talk}"/>
					<input type="button" value="작성" id="awBtn${dto.num_talk}"/> <br/>
					<input type="hidden" value="${id}" id="qnaID"/>
					<input type="hidden" value="${dto.num_talk}" id="qna${dto.num_talk}"/>
					
					<c:forEach items="${qnaList}" var="qnaList">
						<c:if test="${dto.num_talk==qnaList.num_talk}">
							${qnaList.content} &nbsp;&nbsp;&nbsp;&nbsp; 작성자 :
							<c:if test="${qnaList.ano == 'id' }">
								${qnaList.writer}
							</c:if>
							<c:if test="${qnaList.ano == 'anonymity' }">
								익명
							</c:if>
							<br/>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
			 </td>
			<td>
				<c:set var="check" value="0" />
				<c:forEach items="${goodList}" var="goodL">
					<c:if test="${dto.num_talk == goodL.num_talk && goodL.writer == 'testid'}">
					   <c:set var="check" value="1" />
					</c:if>
				</c:forEach>
				<c:if test="${check==1}">
					<div id='ex1' style="background-color: red" onclick="good_click_down(${dto.num_talk})">
				    ${dto.good} <br/>
					<img src = "/resources/campTalk/good.png" style="width: 30px;background-color: red" id="good_change" >
					</div>
			 	</c:if>
			 	<c:if test="${check==0}">
					<div id='ex1'  onmouseover="good_on(this)" onmouseout="good_out(this)" onclick="good_click_up(${dto.num_talk})">
					${dto.good} <br/>
					<img src = "/resources/campTalk/good.png" style="width: 30px;" id="good_change" >
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
		        center: new kakao.maps.LatLng("${list[0].mapy}", "${list[0].mapx}"), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var markers = [];
		var positions = new Array();
		
		<c:forEach items="${list}" var="map">
			positions.push({
				title:"${map.camp}",
				latlng: new kakao.maps.LatLng("${map.mapy}","${map.mapx}")
				});
		</c:forEach>
		
		var imageSrc = "/resources/campTalk/locationPoint.png"; 
		
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
		    
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].title // 인포윈도우에 표시할 내용
		    });
		    
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		function map_move(a,b) {
			var imageSrc1 = "https://i.ibb.co/G2kJKb2/logo-campstory.png"; 
			var imageSize1 = new kakao.maps.Size(30, 30);
			var markerImage1 = new kakao.maps.MarkerImage(imageSrc1, imageSize1);
			
		    for ( var i = 0; i < markers.length; i++ ) {
		       	markers[i].setMap(null);
	   		}   
		    
		    markers = [];
		   
		  
	     	for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    
			    if( "("+a+", "+b+")" == positions[i].latlng  ){
			    	var marker = new kakao.maps.Marker({
				    	map: map,
				        position: new kakao.maps.LatLng(a, b),
				        image : markerImage1
				    });
			    } else {
			    	 var marker = new kakao.maps.Marker({
				    	map: map,
				        position: positions[i].latlng,
				        image : markerImage
				    });
			    }
			   
			    infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].title
			    });
			    
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    
			    
			    markers.push(marker);
			}  
	     	 
		    var moveLatLon = new kakao.maps.LatLng(a, b);
		    
		    map.panTo(moveLatLon);
		}   
		
		</script>
	</td>
	</tr>
	<tr><td align="center">
		<c:if test="${page.pageStart > 10}">
			<a href="/campTalk/talkList?pageNum=${page.pageStart - 10}&areaEng=${areaEng}">[이전]</a>
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${page.pageStart - 10}&areaEng=${areaEng}">[이전]</a>
		</c:if>	
		
		<c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${i}&areaEng=${areaEng}">${i}</a>
		</c:forEach>
	
		<c:if test="${page.pageEnd < page.pageCount}">
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${page.pageStart + 10}&areaEng=${areaEng}">[다음]</a>
		</c:if>	
	</td></tr>
</table>
