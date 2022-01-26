<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    talk - write
    
<form action="/campTalk/talkUpdatePro" method="post" name="cs">
	<table border="0">
		<tr><td>캠핑장 : </td><td>
		
		<label>${dto.camp }</label> 
		
		<input type="hidden" name="num_talk" value="${dto.num_talk}" /> &nbsp;&nbsp;&nbsp;
		<c:if test="${dto.ano == 'id'}">
			익명 <input type="checkbox" name="ano" value="ano" >
		</c:if>
		<c:if test="${dto.ano == 'anonymity'}">
			익명 <input type="checkbox" name="ano" value="ano" checked="checked">
		</c:if>
		
		<tr><td>내용 : </td><td> <input type="text" name="content" value="${dto.content}"/> </td></tr>
		<tr><td colspan="2">
		<input type="submit" value="수정" />	<input type="button" value="취소" onclick="history.go(-1)"/>
		</td></tr>
	</table>
</form>
