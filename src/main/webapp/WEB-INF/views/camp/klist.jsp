<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
   

<body>
<%@ include file = "../include/header.jsp" %>
<div class ="search_keyword">
	<form action="klist" method="get">
		<input type="text" id="searchbar" name="keyword" placeholder="지역명 / 캠핑장 명을 검색 해 주세요"/>
		<input type="image" src="../resources/camp/images/search.png" id = "searchbtn" value="submit" name="submit" />
	</form>
	<div id="kwordList">
		<c:forEach var="keywordlist" items="${keywordlist }"  begin="0" end="4" step="1">
		<a href = "/camp/klist?keyword=${keywordlist.keyword}" class="mainkeyword"># ${keywordlist.keyword}</a>
		</c:forEach>
	
	</div>
	
</div>
<br/>
<div class="search-disply">
	<a href="javascript:doDisplay();">상세검색</a>
</div>

<div class="search_detail" id="checkboard" style =" display: none; ">
	<table>
    <form action="slist" method="get">
        <tr>
            <th id="dt_th">지역</th>
            <td id="dt_td">
                <input type="checkbox" name="donm" value="and donm like '%서울%'">서울
                <input type="checkbox" name="donm" value="and donm like '%경기도%'">경기도
                <input type="checkbox" name="donm" value="and donm like '%인천%'">인천
                <input type="checkbox" name="donm" value="and donm like '%강원도%'">강원도
                <input type="checkbox" name="donm" value="and donm like '%충청북도%'">충청북도
                <input type="checkbox" name="donm" value="and donm like '%충청남도%'">충청남도
                <input type="checkbox" name="donm" value="and donm like '%대전%'">대전
                <input type="checkbox" name="donm" value="and donm like '%세종%'">세종 <br/>
                <input type="checkbox" name="donm" value="and donm like '%전라북도%'">전라북도
                <input type="checkbox" name="donm" value="and donm like '%전라남도%'">전라남도
                <input type="checkbox" name="donm" value="and donm like '%광주%'">광주
                <input type="checkbox" name="donm" value="and donm like '%경상북도%'">경상북도
                <input type="checkbox" name="donm" value="and donm like '%경상남도%'">경상남도
                <input type="checkbox" name="donm" value="and donm like '%부산%'">부산
                <input type="checkbox" name="donm" value="and donm like '%울산%'">울산
                <input type="checkbox" name="donm" value="and donm like '%제주도%'">제주도
                <br/>
            </td>
            <td rowspan="3">
                <input type="image" src="../resources/camp/images/search.png" id = "searchbtn2" value="submit" name="submit" />
            </td>
        </tr>
        <tr>
            <th id="dt_th">캠핑테마</th>
            <td id="dt_td">
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like' %봄꽃%'">봄 꽃여행
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%물놀이%'">여름 물놀이
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%단풍%'">가을 단풍명소
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%눈꽃%'">겨울 눈꽃명소
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%낚시%'">낚시
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%걷기%'">걷기길 <br/>
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%일출%'">일출명소
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%일몰%'">일몰명소
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%수상%'">수상레저
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%액티비티%'">액티비티
                <input type="checkbox" name="themaenvrncl" value="and themaenvrncl like '%스키%'">스키    &emsp;
                <br/>
            </td>
            <td></td>
        </tr><br/>
        <tr>
            <th id="dt_th">주변환경</th>
            <td  id="dt_td">
                <input type="checkbox" name="lctcl" value="and lctcl like '%숲%'">숲
                <input type="checkbox" name="lctcl" value="and lctcl like '%산%'">산
                <input type="checkbox" name="lctcl" value="and lctcl like '%강%'">강
                <input type="checkbox" name="lctcl" value="and lctcl like '%호수%'">호수
                <input type="checkbox" name="lctcl" value="and lctcl like '%계곡%'">계곡
                <input type="checkbox" name="lctcl" value="and lctcl like '%해변%'">해변
                <input type="checkbox" name="lctcl" value="and lctcl like '%섬%'">섬
                <input type="checkbox" name="lctcl" value="and lctcl like '%도심%'">도심
                <br/>
            </td>
            <td></td>

        </tr><br/>

    </form>
</table>
</div>

  <c:if test="${searchcount == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      등록된 캠핑장이 없습니다.
    </td>
  </tr>
</table>
</c:if>
    
 <br/>
<hr color="#DFD8CA" size="2"  align="center" />
<br/>    
<b>캠핑장 리스트 (전체 캠핑장:${searchcount })</b>
<hr color="#DFD8CA" size="2"  align="center" />
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    
<c:forEach items="${searchlist}" var="campDTO">
<div class="listinfo">
<a href="/camp/readcount?contentid=${campDTO.contentid }&pageNum=${pageNum}" class="camp_name">
                ${campDTO.facltnm }</a>  
    <div class="infocard">
        <div class="infocard1">
            

            <c:if test="${campDTO.firstimageurl == '0'}">
                <img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="300px" height="250px"/>
            </c:if>
            
            <c:if test="${campDTO.firstimageurl != '0' }">
                <img src= "${campDTO.firstimageurl }" width="300px" height="250px" /><br/>
            </c:if>

        </div>
        <div class="infocard2">
        ${campDTO.sigungunm }<br/><br/>
        ${campDTO.induty } <br/><br/>
	<c:if test="${campDTO.lineintro == '0'}">
		
	</c:if> 
	<c:if test="${campDTO.lineintro != '0' }">
		${campDTO.lineintro }<br/><br/>
	</c:if> 
	<br/>
	<img src ="../resources/camp/images/eye.png" width="30px" height="30px"  class="viewcount"> ${campDTO.readcount} &emsp;&emsp;
	<img src ="../resources/camp/images/heart.png" width="30px" height="30px" class="goodcount"> ${campDTO.good}
    <br/>

        </div>
    </div>
    
    <c:if test="${campDTO.sbrscl !='0' }">
    <div class="sbrscl">
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
    </c:if>
</div>
   <c:if test="${campDTO.sbrscl =='0' }"></c:if>	  
    <hr color="#DFD8CA" size="2"  align="center" />
    <br/>
</c:forEach>
	
</table>
<c:if test="${ searchcount > 0}">
<div align="center">	
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
  
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/camp/klist?pageNum=${startPage - 10 }&keyword=${keyword}">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/camp/klist?pageNum=${i}&donm=${donm}&keyword=${keyword}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/camp/klist?pageNum=${startPage + 10}&keyword=${keyword}">[다음]</a>
   </c:if>
</c:if>
</div>
</center>
</body>

<script type="text/javascript">
	var bDisplay = true;
	
	function doDisplay(){
		var con = document.getElementById("checkboard");
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}
	</script>
