<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<%@ include file = "../include/header.jsp" %>

<title>신규 캠핑장 등록</title>


<h1 class="pagesubject">신규 캠핑장 등록</h1>

<div class="camp_input">
<div class="map_wrap">
    <div id="map" style="width:300px;height:300px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    캠핑장명 : <input type="text" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
                  
<div class="camp_input_div">
	<form action="camp/inputPro">
		<table class="camp_input_table">
			<tr>
			<th>캠핑장 이름</th>
			<td><input type="text" name="facltnm" placeholder="위 검색내용 참고"/></td>
			</tr>
			<tr>
			<th>한줄 소개</th>
			<td><input type="text" name="lineintro" /></td>
			</tr>
			<tr>
			<th>캠핑장 소개</th>
			<td><input type="text" name="intro" /></td>
			</tr>
			<tr>
			<th>전체 면적</th>
			<td><input type="text" name="allar" placeholder="면적의 숫자만 기입"/> m²</td>
			</tr>
			<tr>
			<th>휴장 시작일</th>
			<td><input type="text" name="hvofbgnde" placeholder="YYYY-MM-DD / 없으면 0"/></td>
			</tr>
			<tr>
			<th>휴장 종료일</th>
			<td><input type="text" name="hvofenddle" placeholder="YYYY-MM-DD / 없으면 0"/></td>
			</tr>
			<tr>
			<th>캠핑장 특징</th>
			<td><input type="text" name="featurenm" /></td>
			</tr>
			<tr>
			<th>업종</th>
			<td>
				<input type="checkbox" name="induty" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="induty" value="일반야영장" id="induty_check">일반야영장 
				<input type="checkbox" name="induty" value="자동차야영장" id="induty_check">자동차야영장 
				<input type="checkbox" name="induty" value="글램핑" id="induty_check">글램핑 
				<input type="checkbox" name="induty" value="카라반" id="induty_check">카라반 
				 
			</td>
			</tr>
			<tr>
			<th>입지구분</th>
			<td>
				<input type="checkbox" name="lctcl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="lctcl" value="숲" id="lctcl_check">숲
                <input type="checkbox" name="lctcl" value="산" id="lctcl_check">산
                <input type="checkbox" name="lctcl" value="강" id="lctcl_check">강
                <input type="checkbox" name="lctcl" value="호수" id="lctcl_check">호수
                <input type="checkbox" name="lctcl" value="계곡" id="lctcl_check">계곡
                <input type="checkbox" name="lctcl" value="해변" id="lctcl_check">해변
                <input type="checkbox" name="lctcl" value="섬" id="lctcl_check">섬
                <input type="checkbox" name="lctcl" value="도심" id="lctcl_check">도심
                
			</td>
			</tr>
			<tr>
			<th>도</th>
			<td>
			<input type="text" name ="donm" list="donm"/>

			<datalist id="donm">
			  <option value="강원도">
			  <option value="경기도">
			  <option value="경상북도">
			  <option value="경상남도">
			  <option value="광주시">
			  <option value="대구시">
			  <option value="대전시">
			  <option value="부산시">
			  <option value="서울시">
			  <option value="세종시">
			  <option value="울산시">
			  <option value="인천시">
			  <option value="전라남도">
			  <option value="전라북도">
			  <option value="제주도">
			  <option value="충청남도">
			  <option value="충청북도">
			  
			</datalist>
				
			</td>
			</tr>
			<tr>
			<th>시군구</th>
			<td>
			<input type="text" name ="sigungunm" list="sigungulist"/>
			<datalist id="sigungulist">
				<c:forEach var="sigungulist" items="${sigungulist }">
				 <option value="${sigungulist.sigungunm}">
				
				</c:forEach>
			</datalist>	
			</td>
			</tr>
			<tr>
			<th>우편번호</th>
			<td>
				<input type="text" name="zipcode" placeholder="숫자만 작성"/>
			</td>
			</tr>
			<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr1" placeholder="위 검색내용 참고" />
			</td>
			</tr>
			<tr>
			<th>상세주소</th>
			<td>
				<input type="text" name="addr2" placeholder="위 검색내용 참고" />
			</td>
			</tr>
			<tr>
			<th>X좌표</th>
			<td>
				<input type="text" name="mapx" placeholder="위 검색내용 참고" />
			</td>
			</tr>
			<tr>
			<th>Y좌표</th>
			<td>
				<input type="text" name="mapy" placeholder="위 검색내용 참고" />
			</td>
			</tr>
			<tr>
			<th>찾아오는길</th>
			<td>
				<input type="text" name="direction" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="tel" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>홈페이지주소</th>
			<td>
				<input type="text" name="homepage" placeholder="http://주소 , 없으면 0" />
			</td>
			</tr>
			<tr>
			<th>예약주소</th>
			<td>
				<input type="text" name="resveurl" placeholder="http://주소  , 없으면 0" />
			</td>
			</tr>
			<tr>
			<th>예약 구분</th>
			<td>
				<input type="checkbox" name="resvecl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="resvecl" value="전화" id="resvecl_check">전화
	            <input type="checkbox" name="resvecl" value="온라인실시간예약" id="resvecl_check">온라인실시간예약
	            <input type="checkbox" name="resvecl" value="현장" id="resvecl_check">현장 
	            
			</td>
			</tr>
			<tr>
			<th>부대시설</th>
			<td>
				<input type="checkbox" name="sbrscl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="sbrscl" value="전기" id="sbrscl_check">전기
				<input type="checkbox" name="sbrscl" value="무선인터넷" id="sbrscl_check">무선인터넷
				<input type="checkbox" name="sbrscl" value="장작판매" id="sbrscl_check">장작판매
				<input type="checkbox" name="sbrscl" value="온수" id="sbrscl_check">온수
				<input type="checkbox" name="sbrscl" value="트램폴린" id="sbrscl_check">트램폴린
				<input type="checkbox" name="sbrscl" value="물놀이장" id="sbrscl_check">물놀이장
				<input type="checkbox" name="sbrscl" value="놀이터" id="sbrscl_check">놀이터
				<input type="checkbox" name="sbrscl" value="산책로" id="sbrscl_check">산책로
				<input type="checkbox" name="sbrscl" value="운동장" id="sbrscl_check">운동장
				<input type="checkbox" name="sbrscl" value="마트" id="sbrscl_check">마트
				<input type="checkbox" name="sbrscl" value="편의점" id="sbrscl_check">편의점
				
				
			</td>
			</tr>
			<tr>
			<th>부대시설 기타</th>
			<td>
				<input type="text" name="sbrsetc" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>주변이용가능시설</th>
			<td>
				<input type="checkbox" name="posblfcltycl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="posblfcltycl" value="강/물놀이" id="posblfcltycl_check">강/물놀이 
				<input type="checkbox" name="posblfcltycl" value="계곡 물놀이" id="posblfcltycl_check">계곡 물놀이
				<input type="checkbox" name="posblfcltycl" value="낚시" id="posblfcltycl_check">낚시 
				<input type="checkbox" name="posblfcltycl" value="농어촌체험시설" id="posblfcltycl_check">농어촌체험시설
				<input type="checkbox" name="posblfcltycl" value="산책로" id="posblfcltycl_check">산책로
				<input type="checkbox" name="posblfcltycl" value="수상레저" id="posblfcltycl_check">수상레저
				<input type="checkbox" name="posblfcltycl" value="수영장" id="posblfcltycl_check">수영장 
				<input type="checkbox" name="posblfcltycl" value="어린이놀이시설" id="posblfcltycl_check">어린이놀이시설
				<input type="checkbox" name="posblfcltycl" value="운동장" id="posblfcltycl_check">운동장
				<input type="checkbox" name="posblfcltycl" value="청소년체험시설" id="posblfcltycl_check">청소년체험시설
				<input type="checkbox" name="posblfcltycl" value="해수욕" id="posblfcltycl_check">해수욕
				
			</td>
			</tr>
			<tr>
			<th>주변이용가능시설 기타</th>
			<td>
				<input type="text" name="posblfcltyetc" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>자체문화행사 여부</th>
			<td>
				<select name="cltureventat">
					<option value="N">미사용
					<option value="Y">사용
				</select>
			</td>
			</tr>
			<tr>
			<th>자체문화행사명</th>
			<td>
				<input type="text" name="clturevent" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>체험프로그램 여부</th>
			<td>
				<select name="exprnprogrmat">
					<option value="N">미사용
					<option value="Y">사용
				</select>
			</td>
			</tr>
			<tr>
			<th>체험프로그램명</th>
			<td>
				<input type="text" name="exprnprogrm" placeholder="없으면 0" />
			</td>
			</tr>
			<tr>
			<th>테마환경</th>
			<td>
				<input type="checkbox" name="themaenvrncl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="themaenvrncl" value="봄꽃" id="themaenvrncl_check">봄 꽃여행
                <input type="checkbox" name="themaenvrncl" value="물놀이" id="themaenvrncl_check">여름 물놀이
                <input type="checkbox" name="themaenvrncl" value="단풍" id="themaenvrncl_check">가을 단풍명소
                <input type="checkbox" name="themaenvrncl" value="눈꽃" id="themaenvrncl_check">겨울 눈꽃명소 <br/>
                <input type="checkbox" name="themaenvrncl" value="낚시" id="themaenvrncl_check">낚시
                <input type="checkbox" name="themaenvrncl" value="걷기" id="themaenvrncl_check">걷기길
                <input type="checkbox" name="themaenvrncl" value="일출" id="themaenvrncl_check">일출명소
                <input type="checkbox" name="themaenvrncl" value="일몰" id="themaenvrncl_check">일몰명소
                <input type="checkbox" name="themaenvrncl" value="수상" id="themaenvrncl_check">수상레저
                <input type="checkbox" name="themaenvrncl" value="액티비티" id="themaenvrncl_check">액티비티
                <input type="checkbox" name="themaenvrncl" value="스키" id="themaenvrncl_check">스키 
                
			</td>
			</tr>
			<tr>
			<th>애완동물출입</th>
			<td>
				<select name="animalcmgcl">
					<option value="가능">가능
					<option value="가능(소형견)">가능(소형견)
					<option value="불가능">불가능
				</select>
			</td>
			</tr>
			<tr>
			<th>여행시기</th>
			<td>
				<input type="checkbox" name="toureracl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="toureracl" value="봄" id="toureracl_check">봄
				<input type="checkbox" name="toureracl" value="여름" id="toureracl_check">여름
				<input type="checkbox" name="toureracl" value="가을" id="toureracl_check">가을
				<input type="checkbox" name="toureracl" value="겨울" id="toureracl_check">겨울
				
			</td>
			</tr>
			<tr>
			<th>대표이미지</th>
			<td>
				<input type="text" name="firstimageurl" placeholder="http://이미지주소" />
			</td>
			</tr>
			<tr>
			<th>상주관리인원</th>
			<td>
				<input type="text" name="managenmpr" placeholder="숫자만 기재" /> 명
			</td>
			</tr>
			<tr>
			<th>주요시설 일반야영장</th>
			<td>
				<input type="text" name="gnrlsiteco" placeholder="해당 야영장의 수  / 숫자만 기재" /> 곳
			</td>
			</tr>
			<tr>
			<th>주요시설 자동차야영장</th>
			<td>
				<input type="text" name="autositeco" placeholder="해당 야영장의 수  / 숫자만 기재" /> 곳
			</td>
			</tr>
			<tr>
			<th>주요시설 글램핑</th>
			<td>
				<input type="text" name="glampsiteco" placeholder="해당 야영장의 수  / 숫자만 기재" /> 곳
			</td>
			</tr>
			<tr>
			<th>주요시설 카라반</th>
			<td>
				<input type="text" name="caravsiteco" placeholder="해당 야영장의 수  / 숫자만 기재" /> 곳
			</td>
			</tr><tr>
			<th>주요시설 개인 카라반</th>
			<td>
				<input type="text" name="indvdlcaravSiteco" placeholder="해당 야영장의 수  / 숫자만 기재" /> 곳
			</td>
			</tr>
			<tr>
			<th>사이트간 거리</th>
			<td>
				<input type="text" name="sitedstnc " placeholder=" 숫자만 기재" /> m
			</td>
			</tr><tr>
			<th>사이트 크기1 가로</th>
			<td>
				<input type="text" name="sitemg1width" placeholder=" 숫자만 기재" /> m
			</td>
			</tr><tr>
			<th>사이트 크기2 가로</th>
			<td>
				<input type="text" name="sitemg2width" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기3 가로</th>
			<td>
				<input type="text" name="sitemg3width" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기1 세로</th>
			<td>
				<input type="text" name="sitemg1vrticl" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기2 세로</th>
			<td>
				<input type="text" name="sitemg2vrticl" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기3 세로</th>
			<td>
				<input type="text" name="sitemg3vrticl" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기1 수량</th>
			<td>
				<input type="text" name="sitemg1co" placeholder="  숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기2 수량</th>
			<td>
				<input type="text" name="sitemg2co" placeholder="  숫자만 기재" />
			</td>
			</tr><tr>
			<th>사이트 크기3 수량</th>
			<td>
				<input type="text" name="sitemg3co" placeholder="  숫자만 기재" />
			</td>
			</tr><tr>
			<th>잔디 사이트</th>
			<td>
				<input type="text" name="sitebottomcl1" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>파쇄석 사이트</th>
			<td>
				<input type="text" name="sitebottomcl2" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>데크 사이트</th>
			<td>
				<input type="text" name="sitebottomcl3" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>자갈 사이트</th>
			<td>
				<input type="text" name="sitebottomcl4" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>맨흙 사이트</th>
			<td>
				<input type="text" name="sitebottomcl5" placeholder="숫자만 기재" />
			</td>
			</tr><tr>
			<th>툴팁</th>
			<td>
				<input type="text" name="tooltip" placeholder=" 캠핑장을 즐길만한 팁 /  없으면 0 " />
			</td>
			</tr><tr>
			<th>글램핑 - 내부시설</th>
			<td>
				<input type="checkbox" name="glampinnerfclty" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="glampinnerfclty" value="TV"  id="glampinnerfclty_check">TV
				<input type="checkbox" name="glampinnerfclty" value="난방기구"  id="glampinnerfclty_check">난방기구
				<input type="checkbox" name="glampinnerfclty" value="내부화장실"  id="glampinnerfclty_check">내부화장실
				<input type="checkbox" name="glampinnerfclty" value="내부샤워실"  id="glampinnerfclty_check">내부샤워실
				<input type="checkbox" name="glampinnerfclty" value="냉장고"  id="glampinnerfclty_check">냉장고
				<input type="checkbox" name="glampinnerfclty" value="에어컨"  id="glampinnerfclty_check">에어컨
				<input type="checkbox" name="glampinnerfclty" value="유무선인터넷"  id="glampinnerfclty_check">유무선인터넷
				<input type="checkbox" name="glampinnerfclty" value="취사도구"  id="glampinnerfclty_check">취사도구
				<input type="checkbox" name="glampinnerfclty" value="침대"  id="glampinnerfclty_check">침대
				
			</td>
			</tr><tr>
			<th>카라반 - 내부시설</th>
			<td>
				<input type="checkbox" name="caravinnerfclty" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="caravinnerfclty" value="TV"  id="caravinnerfclty_check">TV
				<input type="checkbox" name="caravinnerfclty" value="난방기구" id="caravinnerfclty_check">난방기구
				<input type="checkbox" name="caravinnerfclty" value="내부화장실" id="caravinnerfclty_check">내부화장실
				<input type="checkbox" name="caravinnerfclty" value="내부샤워실" id="caravinnerfclty_check">내부샤워실
				<input type="checkbox" name="caravinnerfclty" value="냉장고" id="caravinnerfclty_check">냉장고
				<input type="checkbox" name="caravinnerfclty" value="에어컨" id="caravinnerfclty_check">에어컨
				<input type="checkbox" name="caravinnerfclty" value="유무선인터넷" id="caravinnerfclty_check">유무선인터넷
				<input type="checkbox" name="caravinnerfclty" value="취사도구" id="caravinnerfclty_check">취사도구
				<input type="checkbox" name="caravinnerfclty" value="침대" id="caravinnerfclty_check">침대
				
			</td>
			</tr><tr>
			<th>인허가일자</th>
			<td>
				<input type="date" name="prmisnde"/>
			</td>
			</tr>
			<tr>
			<th>운영기간</th>
			<td>
				<input type="checkbox" name="operpdcl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="operpdcl" value="봄"  id="operpdcl_check">봄
				<input type="checkbox" name="operpdcl" value="여름" id="operpdcl_check">여름
				<input type="checkbox" name="operpdcl" value="가을" id="operpdcl_check">가을
				<input type="checkbox" name="operpdcl" value="겨울" id="operpdcl_check">겨울
				
			</td>
			</tr><tr>
			<th>운영일</th>
			<td>
				<select name="operdecl">
					<option value="평일+주말">평일+주말
					<option value="평일">평일
					<option value="주말">주말
				</select>
				
			</td>
			</tr><tr>
			<th>개인 트레일러 동반 여부</th>
			<td>
				<select name="trleracmpnyat">
					<option value="N">미사용
					<option value="Y">사용
				</select>
			</td>
			</tr><tr>
			<th>개인 카라반 동반 여부</th>
			<td>
				<select name="caravacmpnyat">
					<option value="N">미사용
					<option value="Y">사용
				</select>
			</td>
			</tr><tr>
			<th>화장실 개수</th>
			<td>
				<input type="text" name="toiletco" placeholder="숫자만 기재" /> 개
			</td>
			</tr><tr>
			<th>샤워실 개수</th>
			<td>
				<input type="text" name="swrmco" placeholder="숫자만 기재" /> 개
			</td>
			</tr><tr>
			<th>개수대 개수</th>
			<td>
				<input type="text" name="wtrplco" placeholder=" 숫자만 기재" />
			</td>
			</tr><tr>
			<th>화로대</th>
			<td>
				<select name="braziercl">
					<option value="개별">개별
					<option value="공동취사장">공동취사장
					<option value="불가">불가
				</select>
				
			</td>
			</tr><tr>
			<th>소화기 개수</th>
			<td>
				<input type="text" name="extshrco" placeholder="숫자만 기재" /> 개
			</td>
			</tr><tr>
			<th>방화수 개수</th>
			<td>
				<input type="text" name="frprvtwrppco " placeholder="숫자만 기재" /> 개
			</td>
			</tr><tr>
			<th>방화사 개수</th>
			<td>
				<input type="text" name="frprvtsandco" placeholder="숫자만 기재" /> 개
			</td>
			</tr><tr>
			<th>화재감지기 개수</th>
			<td>
				<input type="text" name="firesensorco" placeholder="숫자만 기재" /> 개
			</td>
			</tr>
			<tr>
			<th>캠핑장비대여</th>
			<td>
				<input type="checkbox" name="eqpmnlendcl" value="0" checked="checked">해당사항없음
				<input type="checkbox" name="eqpmnlendcl" value="난방기구" id="eqpmnlendcl_check">난방기구
				<input type="checkbox" name="eqpmnlendcl" value="릴선" id="eqpmnlendcl_check">릴선
				<input type="checkbox" name="eqpmnlendcl" value="식기" id="eqpmnlendcl_check">식기
				<input type="checkbox" name="eqpmnlendcl" value="텐트" id="eqpmnlendcl_check">텐트
				<input type="checkbox" name="eqpmnlendcl" value="침낭" id="eqpmnlendcl_check">침낭
				<input type="checkbox" name="eqpmnlendcl" value="화로대" id="eqpmnlendcl_check">화로대
				
			</td>
			</tr>
			<tr>
			<th>영업배상책임보험 가입여부</th>
			<td>
				<select name="insrncat">
					<option value="N">미사용
					<option value="Y">사용
				</select>
			</td>
			</tr>
			<tr>
			<th>관광사업자번호</th>
			<td>
				<input type="text" name="trsagntno"  />
			</td>
			</tr>
			<tr>
			<th>사업자번호</th>
			<td>
				<input type="text" name="bizrno"  />
			</td>
			</tr>
			<tr>
			<th>사업주체.구분</th>
			<td>
				<select name="facltdivnm">
				  <option value="국립공원">국립공원
				  <option value="국민여가">국민여가
				  <option value="민간">민간
				  <option value="자연휴양림">자연휴양림
				  <option value="지자체">지자체
				</select>
			</td>
			</tr>
			<tr>
			<th>운영주체.관리주체</th>
			<td>
				
				<select name="mangedivnm">
					<option value="직영">직영
					<option value="위탁">위탁
				</select>
			</td>
			</tr>
			<tr>
			<th>운영기관.관리기관</th>
			<td>
				<input type="text" name="mgcdiv" placeholder="관리 기관 명 / 없으면  0" />
			</td>
			</tr>
			<tr>
			<th>운영상태.관리상태</th>
			<td>
				<select name="managesttus">
					<option value="운영">운영
					<option value="휴장">휴장
				</select>
			</td>
			</tr>
			
		
		
		
		</table>
		<input type="submit" value="캠핑장 등록" />
	</form>


</div>
</div>
<%@ include file = "../include/footer.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83db66c074a5f9d9786237eec858c915&libraries=services"></script>
        
	
	
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('정확한 정보를 위해 캠핑장 명을 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '  <h4>캠핑장명  : ' + places.place_name + '</h4>'
                +'   <h5>x좌표  : ' + places.x + '</h5>' +'   <h5>y좌표  : ' + places.y + '</h5>' 
                ;
	              

    if (places.road_address_name) {
        itemStr += '    <span>도로명 주소  :  ' + places.road_address_name + '</span><br/>' +
                    '   <span class="jibun gray">지번  주소  :  ' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>지번  주소  :  ' +  places.address_name  + '</span>'; 
    }
                 
               
	
                
    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

        