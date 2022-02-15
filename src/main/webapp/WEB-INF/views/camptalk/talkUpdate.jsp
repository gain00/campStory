<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/style.css">
   
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
    


<form action="talkUpdatePro" method="post" name="cs">
	<table class="talktable">
		<tr><th>캠핑장</th><td>
		
		<label>${dto.camp }</label> 
		
		<input type="hidden" name="num_talk" value="${dto.num_talk}" /> &nbsp;&nbsp;&nbsp;
		<c:if test="${dto.ano == 'id'}">
			익명 <input type="checkbox" name="ano" value="ano" >
		</c:if>
		<c:if test="${dto.ano == 'anonymity'}">
			익명 <input type="checkbox" name="ano" value="ano" checked="checked">
		</c:if>
		
		<tr><th>내용</th><td> <input type="text" name="content" value="${dto.content}"/> </td></tr>
		<tr><td colspan="2" class="talkwritebtn">
		<input type="submit" value="수정" onsubmit="window.close();"/>	<input type="button" value="취소" onclick="window.close();"/>
		</td></tr>
	</table>
</form>
