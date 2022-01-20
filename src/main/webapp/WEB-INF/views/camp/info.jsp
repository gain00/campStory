<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<title>CampStory- 캠핑장 정보 </title>

</head>

<style>
	#camp_name{
	width : 800px;
	margin : auto;
	}

	.camp_info{
	width : 900px;
	display:flex;
	margin : auto;
	}
	.camp_info1 {
	margin : auto;
	}
	.info_intro, .sbrscl {
	width : 1100px;
	margin : auto;
	
	}
	
	.weather {
	margin : auto;
	width : 1500px;
	}
	
	.weather_day {
	
	display : flex;
	
	}
	.weather1,.weather2,.weather3,.weather4,.weather5,.weather6,.weather7  {
	margin : auto;
	align : center;
	}
	#map ,  .info_detail ,.review{
	width : 900px;
	margin : auto;
	}
	

</style>

<body>  
<%@ include file = "../include/header.jsp" %>

	<h2 id="camp_name"> ${campDTO.facltnm}</h2>
	<hr color="#DFD8CA" size="2"  align="center" />
    <br/>
   <div class ="camp_info"  >
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
   	<li>홈페이지 : <a href="${fn:substring(campDTO.homepage,0,3) eq 'http'? campDTO.homepage : 'http://' += campDTO.homepage}" target="_blank">홈페이지 바로가기</a></li>
   	
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
    <div class="weather">
    	<h2> ${campDTO.sigungunm } 날씨 정보</h2>
	    <div class="weather_day"  >
	    
	    	<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
	    	
	    		<script>
	    		let cname = '${campDTO.facltnm}';
	    		   $.ajax({
	    			   
	    			    async: true, //동기 or 비동기
	    			    url: "https://dapi.kakao.com/v2/search/blog",  
	    			    data: {
	    			        query: cname +'캠핑'
	    			        
	    			    },
	    			    beforeSend: function (xhr) {
	    			        xhr.setRequestHeader('Authorization',
	    			            'KakaoAK 40516903f3ab835c2b8b12e0e572cde7')
	    			    },
	    			    type: "GET",
	    			    timeout: 3000,
	    			    dataType: "json",
	    			    success: function (result) {
	    			    	
	    			    		for (var i = 0; i<11; i++){
	    			    		var rv_title = result.documents[i].title;
	    			    		var rv_contents = result.documents[i].contents;
	    			    		var rv_url = result.documents[i].url;
	    			    		var blogname = result.documents[i].blogname;
	    			    		var thumbnail = result.documents[i].thumbnail;
	    			    		var datetime = result.documents[i].datetime;
	    			    		
	    			    	
	    			    		var tableHtml = 
	    			    						'<table>'+
	    			    	   					'<tr>' +
	    			            				'<th colspan="3"><a href="' +rv_url + '">'+ rv_title +'</a></th>' +
					    				        '</tr>'+
					    				        '<tr>'+
					    				            '<td rowspan="2"><img src="' +thumbnail+ '"width="150px"+height="150px"></td>'
					    				           + '<td colspan="2">'+ rv_contents +'</td>'+
					    				        '</tr>' +
					    				        '<tr>' +
					    				        	
					    				            '<td>'+'블로그 명 :  '+blogname+ '</td><td>작성일자 :      ' +datetime+'</td>' +
					    				            
					    				        '</tr>'+'</table>'+'<br/><br/>';
					    		$('.review').append(tableHtml);		        
	    			    		
	    			    	}
	    			    	
	    			       
	    			       
	    			    },
	    			    error: function (error) {
	    			        alert("실패")

	    			    }
	    			})
     		

        
        </script>
	    	
	    		<script>
	    		
		    	var mapX = ${campDTO.mapx};
			 	var mapY = ${campDTO.mapy};	
			 	
			 	
    		
    			
    	    	
			 	
			 	
	    		$.getJSON('https://api.openweathermap.org/data/2.5/onecall?lat='+ mapY +'&lon='+ mapX +'&exclude=minutely,hourly&lang=kr&units=metric&appid=9d1e9314176b9d0c29d493c1bba09273', 
	    		function(result){
	    			
	    				$('.ctemp0').append(result.daily[0].temp.day + ' 도');
		    			$('.lowtemp0').append(result.daily[0].temp.min + ' 도');
		    			$('.hightemp0').append(result.daily[0].temp.max + ' 도');
		    			$('.description0').append(result.daily[0].weather[0].description);
		    			var wiconUrl0 = '<img src="http://openweathermap.org/img/wn/' + result.daily[0].weather[0].icon +'.png" >';
		    			$('.icon0').append(wiconUrl0);
		    			
		    			$('.ctemp1').append(result.daily[1].temp.day + ' 도');
		    			$('.lowtemp1').append(result.daily[1].temp.min + ' 도');
		    			$('.hightemp1').append(result.daily[1].temp.max + ' 도');
		    			$('.description1').append(result.daily[1].weather[0].description);
		    			var wiconUrl1 = '<img src="http://openweathermap.org/img/wn/' + result.daily[1].weather[0].icon +'.png" >';
		    			$('.icon1').append(wiconUrl1);
		    			
		    			$('.ctemp2').append(result.daily[2].temp.day + ' 도');
		    			$('.lowtemp2').append(result.daily[2].temp.min + ' 도');
		    			$('.hightemp2').append(result.daily[2].temp.max + ' 도');
		    			$('.description2').append(result.daily[2].weather[0].description);
		    			var wiconUrl2 = '<img src="http://openweathermap.org/img/wn/' + result.daily[2].weather[0].icon +'.png" >';
		    			$('.icon2').append(wiconUrl2);
	    				
		    			$('.ctemp3').append(result.daily[3].temp.day + ' 도');
		    			$('.lowtemp3').append(result.daily[3].temp.min + ' 도');
		    			$('.hightemp3').append(result.daily[3].temp.max + ' 도');
		    			$('.description3').append(result.daily[3].weather[0].description);
		    			var wiconUrl3 = '<img src="http://openweathermap.org/img/wn/' + result.daily[3].weather[0].icon +'.png" >';
		    			$('.icon3').append(wiconUrl3);
		    			
		    			$('.ctemp4').append(result.daily[4].temp.day + ' 도');
		    			$('.lowtemp4').append(result.daily[4].temp.min + ' 도');
		    			$('.hightemp4').append(result.daily[4].temp.max + ' 도');
		    			$('.description4').append(result.daily[4].weather[0].description);
		    			var wiconUrl4 = '<img src="http://openweathermap.org/img/wn/' + result.daily[4].weather[0].icon +'.png" >';
		    			$('.icon4').append(wiconUrl4);
		    			
		    			$('.ctemp5').append(result.daily[5].temp.day + ' 도');
		    			$('.lowtemp5').append(result.daily[5].temp.min + ' 도');
		    			$('.hightemp5').append(result.daily[5].temp.max + ' 도');
		    			$('.description5').append(result.daily[5].weather[0].description);
		    			var wiconUrl5 = '<img src="http://openweathermap.org/img/wn/' + result.daily[5].weather[0].icon +'.png" >';
		    			$('.icon5').append(wiconUrl5);
		    			
		    			$('.ctemp6').append(result.daily[6].temp.day + ' 도');
		    			$('.lowtemp6').append(result.daily[6].temp.min + ' 도');
		    			$('.hightemp6').append(result.daily[6].temp.max + ' 도');
		    			$('.description6').append(result.daily[6].weather[0].description);
		    			var wiconUrl6 = '<img src="http://openweathermap.org/img/wn/' + result.daily[6].weather[0].icon +'.png" >';
		    			$('.icon6').append(wiconUrl6);
		    			
	    		});
	    		
	    		
	    		
	    	</script>
	    	
	    	
	    	
	    	<div class ="weather0" >
	    	<h3 class="day0">${day0} </h3>
	    	<span class="icon0"> </span>
	    	<h3 class="description0"> </h3>
	    	<li class="ctemp0"> 평균온도 : </li> 
	    	<li class="lowtemp0"> 최저온도 : </li> 
	    	<li class="hightemp0"> 최고온도 : </li>
	    	
	    	</div>
	    	
	    	<div class ="weather1" >
	    	<h3 class="day1">${day1 } </h3>
	    	<span class="icon1"> </span>
	    	<h3 class="description1"> </h3>
	    	<li class="ctemp1"> 평균온도 : </li> 
	    	<li class="lowtemp1"> 최저온도 : </li> 
	    	<li class="hightemp1"> 최고온도 : </li>
	    	
	    	</div>
	    	
	    	<div class ="weather2" >
	    	<h3 class="day2">${day2 } </h3>
	    	<span class="icon2"> </span>
	    	<h3 class="description2"> </h3>
	    	<li class="ctemp2"> 평균온도 : </li> 
	    	<li class="lowtemp2"> 최저온도 : </li> 
	    	<li class="hightemp2"> 최고온도 : </li>
	    	
	    	
	    	</div>
	    	<div class ="weather3" >
	    	<h3 class="day3">${day3 } </h3>
	    	<span class="icon3"> </span>
	    	<h3 class="description3"> </h3>
	    	<li class="ctemp3"> 평균온도 : </li> 
	    	<li class="lowtemp3"> 최저온도 : </li> 
	    	<li class="hightemp3"> 최고온도 : </li>
	    	
	    	</div>
	    	<div class ="weather4" >
	    	<h3 class="day4">${day4 } </h3>
	    	<span class="icon4"> </span>
	    	<h3 class="description4"> </h3>
	    	<li class="ctemp4"> 평균온도 : </li> 
	    	<li class="lowtemp4"> 최저온도 : </li> 
	    	<li class="hightemp4"> 최고온도 : </li>
	    	 
	    	</div>
	    	<div class ="weather5" >
	    	<h3 class="day5">${day5 } </h3>
	    	<span class="icon5"> </span>
	    	<h3 class="description5"> </h3>
	    	<li class="ctemp5"> 평균온도 : </li> 
	    	<li class="lowtemp5"> 최저온도 : </li> 
	    	<li class="hightemp5"> 최고온도 : </li>
	    	 
	    	</div>
	    	<div class ="weather6" >
	    	<h3 class="day6">${day6 } </h3>
	    	<span class="icon6"> </span>
	    	<h3 class="description6"> </h3>
	    	<li class="ctemp6"> 평균온도 : </li> 
	    	<li class="lowtemp6"> 최저온도 : </li> 
	    	<li class="hightemp6"> 최고온도 : </li>
	    	 
	    	</div>
	    	
	    	
    	</div>
    </div>	
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
		    content : '<div style="padding:2px;  ">${campDTO.facltnm}</div>' // 인포윈도우에 표시할 내용
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
     	<hr color="#DFD8CA" size="2"  align="center" />
    <br/>
    
        <div class = "review">
        <h2>${campDTO.facltnm} 블로그 리뷰</h2>
        </div>
</body>
</html>      

