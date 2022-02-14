<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>게시판</title>
</head>

<script src="/resources/Board/jquery/jquery-3.6.0.min.js"></script>   

<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			});
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?pageNum="+ ${pageNum};
			});
			
			// 추가
			$(".insertCommentBtn").on("click", function(){
				  var formObj = $("form[name='commentForm']");
				  formObj.attr("action", "/board/commentInsert");
				  formObj.submit();
				});
			
			//댓글 수정 View
			$(".commentUpdateBtn").on("click", function(){
				
				window.open("/board/commentUpdateView?num_tip=${article.num_tip}"+ "&cno="+$(this).attr("data-cno"), '댓글 수정', 'width=350, height=280');
			});
					
			//댓글 삭제 View
			$(".commentDeleteBtn").on("click", function(){
				
				window.open("/board/commentDeleteView?num_tip=${article.num_tip}"+ "&cno="+$(this).attr("data-cno"), '댓글 삭제', 'width=350, height=280');
			});
		});
		
</script>





<body>  
<%@ include file = "../include/header.jsp" %>


<form>

<div id = "rightview" class="right_panel" >

	<div class ="moviebox" >
	<iframe width="560" height="315" src="${tip2.youtube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
	</div>

	<div class ="contentview">
		<p id="content_title"> ${article.title} </p>
		<p>${article.writer}</p>
		<p><img src ="../resources/camp/images/eye.png" width="30px" height="30px"  class="viewcount">&emsp;&emsp;${article.readcount}</p> 
	</div>
	
	<div class ="content_content">
	<p>${tip2.content}</p>
	</div>

</div>

   
</form>  

<form name="readForm" role="form" method="post">
	<input type="hidden" id="num_tip" name="num_tip" value="${article.num_tip}" />
</form>    

 <div class="btn_box">
	<c:if test="${sessionScope.memId == 'admin'}">
		<button type="submit" class="update_btn">수정</button>
		<button type="submit" class="delete_btn">삭제</button>
	</c:if>		
		<button type="submit" class="list_btn">목록</button>	
</div>

<div class="content_comment">

<form name="commentForm" method="post">
  <input type="hidden" id="num_tip" name="num_tip" value= "${article.num_tip}" />
  <input type="hidden" id="writer" name="writer" value= "${sessionScope.memId}" />
    
   <label for="content">댓글 내용 : </label><input type="text" id="content" name="content" placeholder="댓글을 입력해주세요"/>
  <button type="button" class="insertCommentBtn">작성</button>
  

  
</form>

<div id ="comment">
 
    <c:forEach items="${commentList}" var="commentList">
      <div class="comment_card">
      	<div class="comment_card_left">
        <p>
        작성자 : <label>${commentList.writer}</label><br />
        
        작성 날짜 : <fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd"/>
        </p>

        <h5>${commentList.content}</h5>
        </div>
        
        <div class="comment_card_right">
        
        <c:if test="${commentList.writer == sessionScope.memId || sessionScope.memId =='admin'}">
		
		  <button type="button" class="commentUpdateBtn" data-cno="${commentList.cno}">수정</button>
		  <button type="button" class="commentDeleteBtn" data-cno="${commentList.cno}">삭제</button>
		 
		</c:if>
        
      </div>  
      
      </div>
    </c:forEach>   

 
</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>      
