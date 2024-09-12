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
	<h1 class="pagesubject">댓글 수정</h1>
		<div id="comment_root">
			
				<form name="updateForm" role="form" method="post" action="/board/commentUpdate">
					<input type="hidden" name="num_tip" value="${commentUpdate.num_tip}" readonly="readonly"/>
					<input type="hidden" id="cno" name="cno" value="${commentUpdate.cno}" />
					
					<table class="comment_update_tbl">
						<tbody>
							<tr>
								<th>댓글 내용</th>
							</tr>
							<tr>	
								<td>
									<input type="text" id="content" name="content" value="${commentUpdate.content}"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="comment_udt_btnzone">
								<button type="submit" class="update_btn">저장</button>
								<button type="button" class="cancel_btn">취소</button>
								</td>
							</tr>
								
							
						</tbody>			
					</table>
					
				</form>
			
			<hr />
		</div>
	</body>
</html>