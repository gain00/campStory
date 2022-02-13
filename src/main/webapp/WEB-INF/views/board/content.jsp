<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>게시판</title>

<link href="/resources/Board/style.css" rel="stylesheet" type="text/css">
<script src="/resources/Board/jquery/jquery-3.6.0.min.js"></script>   
</head>
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
				
				location.href = "/board/list?pageNum="+${pageNum};
			});
			
			// 추가
			$(".insertCommentBtn").on("click", function(){
				  var formObj = $("form[name='commentForm']");
				  formObj.attr("action", "/board/commentInsert");
				  formObj.submit();
				});
			
			//댓글 수정 View
			$(".commentUpdateBtn").on("click", function(){
				location.href = "/board/commentUpdateView?num_tip=${article.num_tip}"
								
								+ "&cno="+$(this).attr("data-cno");
			});
					
			//댓글 삭제 View
			$(".commentDeleteBtn").on("click", function(){
				location.href = "/board/commentDeleteView?num_tip=${article.num_tip}"
					
					+ "&cno="+$(this).attr("data-cno");
			});
		})
		
</script>





<body>  
<center>
<br>

<form>

<div id = "rightview" class="rigth_panel" style="width: 776px; heigth:10964px;">
<div class ="moviebox" >
<iframe width="560" height="315" src="${tip2.youtube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>

<div class ="contentview">
<div class ="title">
  ${article.title}
</div>
<div class ="">

${article.writer},${article.readcount}
</div>
<div class ="content">

${tip2.content}
</div>


</div>
</div>
   
</form>  

<form name="readForm" role="form" method="post">
	<input type="hidden" id="num_tip" name="num_tip" value="${article.num_tip}" />
</form>    

  <div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
</div>


<form name="commentForm" method="post">
  <input type="hidden" id="num_tip" name="num_tip" value= "${article.num_tip}" />
  <div>
    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
    <br/>
    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
  </div>
  <div>
 	 <button type="button" class="insertCommentBtn">작성</button>
  </div>

  
</form>

<div id ="comment">
 <ol class="commentList">
    <c:forEach items="${commentList}" var="commentList">
      <li>
        <p>
        작성자 : ${commentList.writer}<br />
        
        작성 날짜 : <fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd"/>
        </p>

        <p>${commentList.content}</p>
        <div>
		  <button type="button" class="commentUpdateBtn" data-cno="${commentList.cno}">수정</button>
		  <button type="button" class="commentDeleteBtn" data-cno="${commentList.cno}">삭제</button>
		 </div>
      </li>
    </c:forEach>   
  </ol>
 
</div>
</body>
</html>      
