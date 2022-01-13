<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>CampStory- 캠핑장 정보 </title>

</head>

<body>  
	<h2> ${campDTO.facltnm}</h2>
	<hr color="#DFD8CA" size="2"  align="center" />
    <br/>
   <div class ="camp_info" style= display:flex; >
  <!--   facltnm, lineintro, intro, allar, hvofbgnde, hvofenddle, featurenm, induty, lctcl, donm,
                  sigungunm, zipcode, addr1, addr2, mapx, mapy, direction, tel, homepage, resveurl, resvecl, sbrscl,
                  sbrsetc, posblfcltycl, posblfcltyetc, cltureventat, clturevent, exprnprogrmat, exprnprogrm,
                  themaenvrncl, animalcmgcl, toureracl, firstimageurl, createdtime, modifiedtime,
                  managenmpr, gnrlsiteco, autositeco, glampsiteco, caravsiteco, indvdlcaravSiteco, sitedstnc,
                  sitemg1width, sitemg2width, sitemg3width, sitemg1vrticl, sitemg2vrticl, sitemg3vrticl, sitemg1co,
                  sitemg2co, sitemg3co, sitebottomcl1, sitebottomcl2, sitebottomcl3, sitebottomcl4, sitebottomcl5,
                  tooltip, glampinnerfclty, caravinnerfclty, prmisnde, operpdcl, operdecl, trleracmpnyat, caravacmpnyat, toiletco, swrmco, wtrplco,
                  braziercl, extshrco, frprvtwrppco, frprvtsandco, firesensorco, eqpmnlendcl, insrncat, trsagntno,
                  bizrno, facltdivnm, mangedivnm, mgcdiv, managesttus
                  
   	-->
   	<div class ="campimage" >
	<c:if test="${campDTO.firstimageurl == '0'}">
    	<img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="300px" height="250px"/>
    </c:if>
    
    <c:if test="${campDTO.firstimageurl != '0' }">
    	<img src= "${campDTO.firstimageurl }" width="300px" height="250px" /><br/>
    </c:if>
    
    <br/>   	
    </div>

	<div class ="camp_info1">
   	<li>주소 : ${campDTO.addr1 }
   	<c:if test="${campDTO.addr2 == '0'}">
   		
   	</c:if>
   	<c:if test="${campDTO.addr2 != '0'}">
   		${campDTO.addr2 }
   	</c:if>
   	</li>
   	<li>
   	<c:if test="${campDTO.tel != '0'}">
   	 전화번호 : ${campDTO.tel }
   	</c:if>
   	<c:if test="${campDTO.tel == '0'}">
   	 전화번호 : 없음	
   	</c:if>
   	</li>
   	<li>홈페이지 : <a href="${campDTO.homepage }">${campDTO.homepage }</a></li>
   	
   	<li> 
   	<c:if test="${campDTO.hvofbgnde != '0'}">
   		 휴장기간 시작일 :${campDTO.hvofbgnde }
   	</c:if>
   	<c:if test="${campDTO.hvofbgnde == '0'}">
   		휴장 계획 없음
   	</c:if>
   	
   	<c:if test="${campDTO.hvofenddle != '0'}">
   		휴장기간 종료일 : ${campDTO.hvofenddle } 
   	</c:if>
   	<c:if test="${campDTO.hvofenddle == '0'}">
   		
   	</c:if>
   	</li>
   	
   	<li>캠핑장 환경 : ${campDTO.lctcl }</li>
   	<li>캠핑장 유형 : ${campDTO.induty }</li>
   	<li>운영기간 : ${campDTO.operpdcl }</li>
   	<li>운영일 : ${campDTO.operdecl }</li>
   	<li>예약방법 : ${campDTO.resvecl }</li>
   	
   	
   	<c:if test="${campDTO.resveurl != '0'}">
   <li>	예약페이지 : <a href="${campDTO.resveurl }">예약 페이지로 가기</a></li>
   	</c:if>
   	<c:if test="${campDTO.resveurl == '0'}">
   	</c:if>
   	<br/><br/>
   	<div class ="button" display="flex">
   		
   		<span><input type="image" src="../resources/camp/images/good_off.png" width="30px" height="30px" onclick="">좋아요 </span>
   		<span><input type="image" src="../resources/camp/images/favorite_off.png" width="30px" height="30px" onclick="">즐겨찾기 </span>
   		
   	</div>
   	
   	</div>
   	</div>
   	<hr color="#DFD8CA" size="2"  align="center" />
    <br/>
    
   	
   	<c:if test="${campDTO.sbrscl !='0' }">
   	<div class="sbrscl" display="flex">
   	<c:if test = "${fn:contains(campDTO.sbrscl, '전기')}">
	<span><img src="../resources/camp/images/elec.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '무선인터넷')}">
	<span><img src="../resources/camp/images/wifi.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '장작판매')}">
	<span><img src="../resources/camp/images/wood.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '온수')}">
	<span><img src="../resources/camp/images/hotwater.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '트램폴린')}">
	<span><img src="../resources/camp/images/tram.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '물놀이장')}">
	<span><img src="../resources/camp/images/pool.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '운동시설')}">
	<span><img src="../resources/camp/images/exercise.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '놀이터')}">
	<span><img src="../resources/camp/images/slide.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '산책로')}">
	<span><img src="../resources/camp/images/walk.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '운동장')}">
	<span><img src="../resources/camp/images/field.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '마트')}">
	<span><img src="../resources/camp/images/mart.png" width="100px" height="100px"/></span>
	</c:if>
	<c:if test = "${fn:contains(campDTO.sbrscl, '편의점')}">
	<span><img src="../resources/camp/images/conv.png" width="100px" height="100px"/></span>
	</c:if>
   	
   </div>
   <c:if test="${campDTO.sbrsetc == '0'}">
   		
   	</c:if>
   	 <c:if test="${campDTO.sbrsetc != '0'}">
   	<br/><li>기타 부대시설 : ${campDTO.sbrsetc}</li>
   	</c:if>
   </c:if>
   
   <c:if test="${campDTO.sbrscl =='0' }"></c:if>
   
   <hr color="#DFD8CA" size="2"  align="center" />
    <br/>
   <div id="map" style="width:750px;height:350px;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83db66c074a5f9d9786237eec858c915"></script>
	<script>
	 	var mapX = ${campDTO.mapx};
	 	var mapY = ${campDTO.mapy};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(mapY, mapX), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.HYBRID // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 마커 이미지의 주소
		var markerImageUrl = 'https://i.ibb.co/G2kJKb2/logo-campstory.png', 
		    markerImageSize = new kakao.maps.Size(40, 42), // 마커 이미지의 크기
		    markerImageOptions = { 
		        offset : new kakao.maps.Point(13, 36)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };

		// 마커 이미지를 생성한다
		var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(mapY, mapX), // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div style="padding:7px; ">${campDTO.facltnm}</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

	</script>
	<hr color="#DFD8CA" size="2"  align="center" />
    <br/>
    <div class="info_intro" width= "300px">
    	<h3>캠핑장 소개</h3>
    	<c:set var="dtointro" value="${campDTO.intro }"></c:set>
    	<c:set var="introArr" value="${fn:split(dtointro,'.')}"></c:set>
		<c:forEach var="intro" items="${introArr}">
    		<h4>${intro}</h4>
		</c:forEach>


    </div>	
    <br/>
    <hr color="#DFD8CA" size="2"  align="center" />
    <br/>
     <div class="info_detail">
     	<li>주변 이용가능 시설 : ${campDTO.posblfcltycl }</li>
     	<li>주변 이용 가능시설 기타 : ${campDTO.posblfcltyetc }</li>
     	<li>자체문화 행사명 : ${campDTO.clturevent }</li>
     	<li>체험프로그램명 : ${campDTO.exprnprogrm }</li>
     	<li>테마환경 : ${campDTO.themaenvrncl }</li>
     	<li>애완동물 출입 : ${campDTO.animalcmgcl }</li>
     	<br/><br/>
     	
     	
         			
      
      	<li>야영장 사이트 수량</li> 
      	<ul>		
	     	<li>일반 야영장 :  ${campDTO.gnrlsiteco } 석</li>
	     	<li>자동차 야영장 :  ${campDTO.autositeco } 석</li>
	     	<li>글램핑 야영장 : ${campDTO.glampsiteco } 석 </li>
	     	<li>카라반 야영장 : ${campDTO.caravsiteco } 석 </li>
	     	<li>개인 카라반 야영장 : ${campDTO.indvdlcaravSiteco } 석 </li>
     	</ul>
     	
        <li>사이트 상세정보</li> 			
         	<ul>
         		<li>사이트간 거리 : ${campDTO.sitedstnc } m </li>
         		<br/><br/>
         		
         		<li>사이트 1</li>
         		<ul>
	         	<li>사이트1 수량 : ${campDTO.sitemg1co } 석</li>
		     	<li>사이트1 크기 가로 : ${campDTO.sitemg1width } m</li>
		     	<li>사이트1 크기 세로 : ${campDTO.sitemg1vrticl } m</li>
		     	</ul>
		     	<br/>
	     		
	     		<li>사이트 2</li>
	     		<ul>
		     	<li>사이트2 수량 : ${campDTO.sitemg1co } 석</li>
		     	<li>사이트2 크기 가로 : ${campDTO.sitemg2width } m</li>
		     	<li>사이트2 크기 세로 : ${campDTO.sitemg2vrticl } m</li>
		     	</ul>
	     		<br/>
	     		
	     		<li>사이트 3</li>
	     		<ul>
		     	<li>사이트3 수량 : ${campDTO.sitemg1co } 석</li>
		     	<li>사이트3 크기 가로 : ${campDTO.sitemg3width } m</li>
		     	<li>사이트3 크기 세로 : ${campDTO.sitemg3vrticl } m</li>
		     	</ul>
	     		<br/>
	     	
	     	<li>잔디 사이트: ${campDTO.sitebottomcl1 }</li>
	     	<li>파쇄석 사이트: ${campDTO.sitebottomcl2 }</li>
	     	<li>데크 사이트: ${campDTO.sitebottomcl3 }</li>
	     	<li>자갈 사이트: ${campDTO.sitebottomcl4 }</li>
	     	<li>맨흙 사이트: ${campDTO.sitebottomcl5 }</li>
	     	<br/>
	     	<c:if test="${campDTO.glampsiteco != 0}">
	     		<li>글램핑 내부시설: ${campDTO.glampinnerfclty }</li><br/>
	     	</c:if>
	     	<c:if test="${campDTO.caravsiteco != 0}">
	     		<li>카라반 내부시설: ${campDTO.caravinnerfclty }</li><br/>
	     	</c:if>
	     	<c:if test="${campDTO.tooltip != 0}">
	     		<li> ${campDTO.tooltip }</li><br/>
	     	</c:if>
         
         	<li>화장실 개수 : ${campDTO.toiletco } 곳</li>
         	<li>샤워실 개수 : ${campDTO.swrmco } 곳</li>
         	<li>개수대 개수 : ${campDTO.wtrplco } 곳</li>
         	<li>화로대 : ${campDTO.braziercl }</li>
         	<li>소화기 개수 :  ${campDTO.extshrco }개</li>
         	<li>방화수/방화사 개수 : ${campDTO.frprvtwrppco}  개 / ${campDTO.frprvtsandco} 개</li>
         	<li>화재감지기 개수 : ${campDTO.firesensorco  } 개</li>
         	<li>캠핑장 장비대여 : ${campDTO.eqpmnlendcl} </li>
         	
         </ul>	
         
        
         
         			
      		
     	
     	
     	
     
     </div>
</body>
</html>      

