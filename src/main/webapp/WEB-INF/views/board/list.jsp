<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<title>게시판</title>
<link href="/resources/board/style.css" rel="stylesheet" type="text/css">


</head>



<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0"  
cellspacing="0">
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
    	<a href="/board/content?num_tip=${article.num_tip}&pageNum=${currentPage}">
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
	 	<fmt:formatDate value="${article.reg_time}" pattern="yyyy-MM-dd"/>
	  	<c:set var="number" value="${number - 1}"/>
		</td>
		<td>
		 ${article.readcount}
		</td>
   </tr>
    
 
  </c:forEach>
</table>
</c:if>
<div>
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
        <a href="/board/list?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/board/list?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/board/list?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</div>
<div>
  <select name="searchType">
      <option value="title">제목</option>
         <option value="content">내용</option>
      <option value="title_content">제목+내용</option>
      <option value="writer">작성자</option>
  </select>
  
  <input type="text" name="keyword" />
  
  <button type="button" id="searchBtn">검색</button>
  
  
 </div>
 <div>
<c:if test="${sessionScope.memId == 'admin'}">
	<button id="insert_btn" onclick="insert_btn_click();">작성</button>	
</c:if>
		
</div>
 <script>
 function insert_btn_click() {
	 location.href = "/board/insertView";
	}
 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  location.href = "/board/list?pagenum=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>
</body>
</html>