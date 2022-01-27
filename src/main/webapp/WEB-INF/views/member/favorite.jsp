<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<script>
	function open_like(){
		if (document.getElementById('like_table').style.display == "")
		{
			document.getElementById('like_table').style.display = 'none';
		}else{
			document.getElementById('like_table').style.display = '';
		}
	}
	function open_fav(){
		if (document.getElementById('fav_table').style.display == "")
		{
			document.getElementById('fav_table').style.display = 'none';
		}else{
			document.getElementById('fav_table').style.display = '';
		}
	}
</script>

<head>
<title>즐겨찾기</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<center>
<a href="JavaScript:;" onclick="JavaScript: open_like();">[좋아요 리스트]</a> 
</center>

<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" id="like_table" style="display: none;" > 
<tr>
<td>

<c:forEach items="${list_like}" var="campDTO">
<div align="center">
	<br/>
   <a href="/camp/readcount?contentid=${campDTO.contentid }&pageNum=${pageNum}">
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

</td>
</tr>
</table>

<br />

<center>
<a href="JavaScript:;" onclick="JavaScript: open_fav();">[즐겨찾기 리스트]</a> 
</center>


<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" id="fav_table" style="display: none;" > 
<tr>
<td>

<c:forEach items="${list_fav}" var="campDTO">
<div align="center">
	<br/>
   <a href="/camp/readcount?contentid=${campDTO.contentid }&pageNum=${pageNum}">
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
</td>
</tr>	
</table>

</body>