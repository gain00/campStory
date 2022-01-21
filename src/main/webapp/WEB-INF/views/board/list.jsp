<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<title>게시판</title>
<link href="/resources/campstoryBoard1/style.css" rel="stylesheet" type="text/css">
</head>



<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    	작성된 게시글이 없습니다...!!
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="${value_c}"> 
      <td align="center"  width="500" colspan="2" >캠핑팁</td>
      
    </tr>

   <c:forEach var="article" items="${articleList}">
   
   <tr height="200">
    	<td align="center"  width="50" colspan="2" >
	  	<img src="${article.image}" >
		</td>
		
   </tr>
   <tr height="200">
 		<td align="center"  width="100" colspan="2"> 
    	<a href="/campstoryBoard1/content?num_tip=${article.num_tip}&pageNum=${currentPage}">
          ${article.title}</a> 
    	</td> 
   </tr>
   
   <tr height="200">
    	<td align="center"  width="100" colspan="2"> 
     	  ${article.content}
		</td>
   </tr>
    
   
   
    <tr height="200">
    	<td align="center"  width="50" >
	 	 ${article.reg_time}
	  	<c:set var="number" value="${number - 1}"/>
		</td>
		<td>
		</td>
   </tr>
    
 
  </c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/campstoryBoard1/list?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/campstoryBoard1/list?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/campstoryBoard1/list?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>

 
</body>
</html>