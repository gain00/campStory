<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>캠핑관련 정보 새글 작성</title>
	</head>
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
									<input type="text" id="title" name="title" />
								</td>
							</tr>	
							<tr>
								<th>내용</th>
								<td>
									<textarea id="board_insert_txt" name="content" ></textarea>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									<input type="text" id="writer" name="writer" />
								</td>
								</tr>
							<tr>
								<td colspan="2">						
									<button type="submit">작성</button>
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
</html>