<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="/resources/style.css">
		<script src="/resources/Board/jquery/jquery-3.6.0.min.js"></script>   
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				self.close();
					
			})
			
		})
		
	</script>
	<body>
	<h1 class="pagesubject">댓글 삭제</h1>
		<div id="comment_root">
			
			
				<form name="updateForm" role="form" method="post" action="/board/commentDelete">
					<input type="hidden" name="num_tip" value="${commentDelete.num_tip}" readonly="readonly"/>
					<input type="hidden" id="cno" name="cno" value="${commentDelete.cno}" />
						
					<div>
						<p>댓글을 삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예</button>
						<button type="button" class="cancel_btn">아니오</button>
					</div>
				</form>
			
			<hr />
		</div>
	</body>
</html>