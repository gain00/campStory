<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<title>게시판</title>
<%@ include file = "../include/header.jsp" %>



</head>

<h1 class="pagesubject">캠핑 관련 정보</h1>

<c:if test="${count == 0}">
	<div class="boardlists">
    	<h2>작성된 게시글이 없습니다...!!</h2>
   </div>
</c:if>

<c:if test="${count > 0}">


<c:forEach var="article" items="${articleList}">
 
   
<div class="boardContentlists">
	<div class="list_thumbnail">
		<img src="${article.image}" >
	</div>
	<div class="list_info">
		<a href="/board/content?num_tip=${article.num_tip}&pageNum=${currentPage}">${article.title}</a>
		 <p><fmt:formatDate value="${article.reg_time}" pattern="yyyy-MM-dd"/></p>
		 <p> <img src ="../resources/camp/images/eye.png" width="30px" height="30px"  class="viewcount">&emsp;&emsp;${article.readcount}</p>
		 
	</div>
</div>
  
 
  </c:forEach>

</c:if>
<div class="board_paging">
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
<div class="board_search">
  <select name="searchType">
      <option value="title">제목</option>
         <option value="content">내용</option>
      <option value="title_content">제목+내용</option>
      <option value="writer">작성자</option>
  </select>
  
  <input type="text" name="keyword" />
  
  <button type="button" id="searchBtn3">검색</button>
  
  
 </div>
 <div class="board_write">
<c:if test="${sessionScope.memId == 'admin'}">
	<button id="insert_btn" onclick="insert_btn_click();">새 글 작성</button>	
</c:if>
		
</div>
<%@ include file = "../include/footer.jsp" %>
 <script>
 function insert_btn_click() {
	 location.href = "/board/insertView";
	}
 document.getElementById("searchBtn3").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  location.href = "/board/list?pagenum=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>
</body>
</html>