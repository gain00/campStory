<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<head>
<title>CampStory - 캠핑장 목록</title>

</head>

<body>

<div>
	<table>
		<tr>
			<td>
				<select name="camp_search">
					<option value="8">8개</option>
					<option value="12">12개</option>
					<option value="16">16개</option>
					<option value="20">20개</option>
					<option value="28">28개</option>
					<option value="36">36개</option>
				</select>
			</td>
			<td></td>
			<td></td>
		</tr>
	
	</table>	
</div>

  <c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      등록된 캠핑장이 없습니다.
    </td>
  </tr>
</table>
</c:if>
    
    
<b>캠핑장 리스트 (전체 캠핑장:${count })</b>
<hr color="#DFD8CA" size="2"  align="center" />
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    
<c:forEach items="${list}" var="campDTO">
<div align="center">
	<br/>
   <a href="/camp/info?contentid=${campDTO.contentid }&pageNum=${pageNum}">
  <h3>${campDTO.facltnm }</h3></a> <br/> 
    ${campDTO.sigungunm }<br/>
    ${campDTO.induty } <br/>
	<c:if test="${campDTO.lineintro == '0'}">
		
	</c:if> 
	<c:if test="${campDTO.lineintro != '0' }">
		${campDTO.lineintro }<br/>
	</c:if> 
    <br/>
    <c:if test="${campDTO.firstimageurl == '0'}">
    	<img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="300px" height="250px"/>
    </c:if>
    
    <c:if test="${campDTO.firstimageurl != '0' }">
    	<img src= "${campDTO.firstimageurl }" width="300px" height="250px" /><br/>
    </c:if>
    
    <br/>
   
</div>
   	<c:if test="${campDTO.sbrscl !='0' }">
   	<div class="sbrscl" display="flex" align="center">
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
   <c:if test="${campDTO.sbrscl =='0' }"></c:if>	  
    <hr color="#DFD8CA" size="2"  align="center" />
    <br/>
</c:forEach>
	
</table>
<c:if test="${count > 0}">
<div align="center">	
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
  
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/camp/list?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/camp/list?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/camp/list?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</div>
</center>
</body>

