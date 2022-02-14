<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="/resources/Board/jquery/jquery-3.6.0.min.js"></script>   
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
	
	</script>
	
	<body>
	<%@ include file = "../include/header.jsp" %>
<h1 class="pagesubject">캠핑 정보 글 작성</h1>	
		<div id="root">
	
			<hr />
			
			<section id="container" class="board_insert_section">
				<form role="form" method="post" action="/board/insert">
					<table class="board_content_table">
						<tbody>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" id="title" name="title" value="${update.title}"/>
								</td>
							</tr>	
							<tr>
								<th>내용</th>
								<td>
									<textarea id="board_insert_txt" name="content" ><c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									<input type="text" id="writer" name="writer"  value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<th>작성날짜</th>
								<td id="update_date">
								<label ><fmt:formatDate value="${update.reg_time}" pattern="yyyy-MM-dd"/></label>
								</td>
							</tr>	
							<tr>
							
								<td colspan="2">						
									<button type="submit" class="update_btn">저장</button>
									<button type="submit" class="cancel_btn">취소</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
	<%@ include file = "../include/footer.jsp" %>
