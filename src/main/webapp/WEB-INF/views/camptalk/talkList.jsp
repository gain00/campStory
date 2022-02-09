<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>CampStory - 캠프톡 목록</title>


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
		if(${sessionScope.memId != null}){
			window.location="/campTalk/goodUp?num_talk="+num_talk;
			history.go(0);
		} else {
			alert("로그인 후 사용");
		}
	}
	
	function good_click_down(num_talk){
		if(${sessionScope.memId != null}){
			window.location="/campTalk/goodDown?num_talk="+num_talk;
			history.go(0);
		} else {
			alert("로그인 후 사용");
		}
		
		
	}
	
	function talkUpdate(num_talk){
		
		window.open('/campTalk/talkUpdate?num_talk='+num_talk, 'camptalk 수정', 'width=283, height=133')
		
	}
	
	function talkDelete(num_talk){
		if(confirm("삭제?")){
			window.location="/campTalk/talkDelete?num_talk="+num_talk;
		}
	}
	
	function qnaDel(num_talkqna){
		if(confirm("삭제??")){
			window.location="/campTalk/qnaDel?num_talkqna="+num_talkqna;
		}
	}

	
	
  	$(document).ready(function(){
		$(document).on('click','input[name=adBtn]',function(){
		var divNum = $(this).closest('div').attr('id').substr(10);
 		var adBtnId = $(this).attr('id');
		var delNum = adBtnId.substr(5);
		
 		$.ajax({
			type: "post",
			url: "/campTalk/qnaDel",
			data: { num_talkqna: delNum },
			success: function(data){
				if(data==1){
					$("#answerList"+divNum).load(location.href + " #answerList"+divNum);
				 }
			 }
		  });
 		 });
	  });
	

	$(document).ready(function(){
		$(document).on('click','input[name=awBtn]',function(){
		var btnId = $(this).attr('id');
		var inputNum = btnId.substr(5);
		var contentCheck = $("#aw"+inputNum).val();
		
		if(contentCheck == ""){
			alert("답글 내용 입력");
			return false;
		}
		
		$.ajax({
			type: "post",
			url: "/campTalk/qnaInput",
			data: { num_talk: $("#qna"+inputNum).val(), content: $("#aw"+inputNum).val(), ano:$('input[name="ano'+inputNum+'"]:checked').val(), writer:$("#qnaID").val() },
			success: function(data){
				if(data==1){
					/* $("#answerForm"+inputNum).show(); */
					$("#answerList"+inputNum).load(location.href + " #answerList"+inputNum);
				 }
			 }
		  }); 
 		 });
	  });
	
	function notify(num, sid){
	    $.ajax({
			 type: "post",
			 url: "/campTalk/notify",
			 data: { num_talk: num, sid: sid },
			 success: function(data){
				 if(data=="notify"){
					 alert("신고 완료");
				 } else if(data=="already"){
					 alert("신고한 게시글 입니다");
				 } else{
					 alert("fail");
				 }
			 }
		  });
	}
	
	function answer(num){
		var nid = "answerForm"+num;
		 
		var aa = document.getElementById(nid);
		if(aa.style.display=='none'){
			aa.style.display='block';
		} else {
			aa.style.display='none';
		}
	}
	
</script>

<%@ include file = "../include/header.jsp" %>

<div class="camptalkctler">
<form action="/campTalk/talkList" method="get" >
	<table class="camptalkctltbl">
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
				<input type="submit" value="검색">&nbsp;
				<label >캠프톡 수 : ${page.totalCount}</label>
		</td>
		<td style="text-align:right;width:30%">
			<input type="button" value="검색초기화" onclick="window.location='/campTalk/talkList'"/>
			<c:if test="${sessionScope.memId != null}">
				<input type="button" value="내글" onclick="window.location='/campTalk/talkList?listType=2'"/>
				<input type="button" value="내관심" onclick="window.location='/campTalk/talkList?listType=3'"/>
				<input type="button" value="톡작성" onclick="window.open('/campTalk/talkWrite?areaEng=${areaEng}', 'camptalk작성', 'width=340, height=260')"/>	
			</c:if>
		</td>
		</tr>
	</table>
</form>
</div>
<table border="0" width="1200" align="center" >
	<tr><td width="70%" valign="top">
		<c:forEach items="${list}" var="dto">
		<div class="camptalklistdiv">
			<table class="camptalklisttbl">
			<tr>
				<td height="100px" rowspan="2">
				     <c:if test="${dto.firstimageurl == '0' }">
    					<img src="/resources/campTalk/firstImage.png" width="100px" height="100px"/>
    				</c:if>
				     <c:if test="${dto.firstimageurl != '0'}">
					 	<img src="${dto.firstimageurl}" width="100px" height="100px">
    				</c:if>
				 </td> 
				 
				<td height="30px" width="500px">
					<c:if test="${dto.contentid != 7502 }">
						[${dto.area}]&nbsp;&nbsp;&nbsp;&nbsp;캠프명 : 
						<a href="/camp/info?contentid=${dto.contentid}">${dto.camp}</a> &nbsp;&nbsp;
						
						<input type="image" src = "/resources/campTalk/location.png" width="25px;" height="25px;" id="locationbtn" onclick="map_move(${dto.mapy}, ${dto.mapx })">
					</c:if>
					<c:if test="${dto.contentid == 7502 }">
						[${dto.area}]
					</c:if>
					<c:if test="${dto.writer eq sessionScope.memId || sessionScope.memId == 'admin'}">
						<input type="button" value="수정" onclick="talkUpdate(${dto.num_talk})">
						
						<input type="button" value="삭제" onclick="talkDelete(${dto.num_talk})">
					</c:if>
				
					<c:if test="${!empty sessionScope.memId}">
						<img src="/resources/campTalk/notify.png" width="20px" height="20px" onclick="notify('${dto.num_talk}','${sessionScope.memId}');"/>
					</c:if>
				</td>
				
				<td> 
					<c:if test="${dto.ano == 'id'}">
						<strong>${dto.writer}</strong>
					</c:if> 
					<c:if test="${dto.ano == 'anonymity'}">
						<strong>익명</strong>
					</c:if>
				
					<br/> <fmt:formatDate value="${dto.reg_time}" pattern="yy-MM-dd" />
				</td>
			</tr>
			
			<tr>
				<td height="70px">
					<c:if test="${dto.sub == 'talk'}">
						${dto.content}
					</c:if>
					<c:if test="${dto.sub == 'qe'}">
						[질문]&nbsp;&nbsp; ${dto.content} <br/>
						<fmt:parseNumber value="${dto.num_talk}" var="num" type="number"/>
						<input type="image" src = "/resources/campTalk/comment.png" width="25px;" height="25px;" id="commentbtn" onclick="answer(${dto.num_talk})">( ${map[num].size()} )
						<div class="talkanswerform">
						<div id="answerForm${dto.num_talk}" class="pkg" style="display:none" >
							<div id="answerInput">
							
								답글쓰기 : <input type="text" name="aw" id="aw${dto.num_talk}"/> 
								익명 : <input type="checkbox" value="ano" name="ano${dto.num_talk}"/>
								<input type="button" value="작성" id="awBtn${dto.num_talk}" name="awBtn"/> <br/>
								<input type="hidden" value="${sessionScope.memId}" id="qnaID"/>
								<input type="hidden" value="${dto.num_talk}" id="qna${dto.num_talk}"/>
							</div>
							<div id="answerList${dto.num_talk}">
							
							 	<c:forEach items="${map[num]}" var="qnaList">
									 
										<c:if test="${qnaList.ano == 'id' }">
											<strong>${qnaList.writer}</strong>
										</c:if>
										<c:if test="${qnaList.ano == 'anonymity' }">
											<strong>익명</strong>
										</c:if>
										&nbsp;&nbsp;&nbsp;${qnaList.content}
										<c:if test="${qnaList.writer == sessionScope.memId || sessionScope.memId =='admin'}">
											<input type="button" value="삭제${qnaList.num_talkqna}" id="adBtn${qnaList.num_talkqna}" name="adBtn"/>
											<%-- <input type="button" value="삭제" id="adBtn${dto.num_talk}" onclick="qnaDel(${qnaList.num_talkqna})"> --%>
										</c:if>
									<br/>
								</c:forEach>
							</div>
						</div>
					</div>
					</c:if>
				</td>
				<td>
					<c:set var="check" value="0" />
					<c:forEach items="${goodList}" var="goodL">
						<c:if test="${dto.num_talk == goodL.num_talk && goodL.writer == sessionScope.memId}">
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
				</td>
			</tr>
		</table>
		</div>
	</c:forEach>
	</td>
	<td>
		<div id="map" style="width:100%;height:350px;"></div>

		
	</td>
	</tr>
	<tr><td align="center" class="camptalkpaging">
		<c:if test="${page.pageStart > 10}">
			<a href="/campTalk/talkList?pageNum=${page.pageStart - 10}&areaEng=${areaEng}">[이전]</a>
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${page.pageStart - 10}">[이전]</a>
		</c:if>	
		
		<c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${i}">${i}</a>
		</c:forEach>
	
		<c:if test="${page.pageEnd < page.pageCount}">
			<a href="/campTalk/talkList?listType=${listType}&campS=${campS}&areaEng=${areaEng}&pageNum=${page.pageStart + 10}">[다음]</a>
		</c:if>	
	</td></tr>
</table>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b5778788b34c5b2d22e5d6adab50e0"></script>
<script>
	<c:if test="${!empty list}">
		var positions = new Array();
		var axisX = 0;
		var axisY = 0;
		var sumCount = 0;
		<c:forEach items="${list}" var="map">
			<c:if test="${map.contentid != 7502}">
				positions.push({
					title:"${map.camp}",
					latlng: new kakao.maps.LatLng("${map.mapy}","${map.mapx}")
				});
				
				axisX += ${map.mapx};
				axisY += ${map.mapy};
				sumCount += 1;
			</c:if>
		</c:forEach>
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(axisY/sumCount, axisX/sumCount), // 지도의 중심좌표
		        level: 13 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var markers = [];
	
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
			//var imageSrc1 = "/resources/campTalk/qqq.png"; 
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
	</c:if>
</script>
