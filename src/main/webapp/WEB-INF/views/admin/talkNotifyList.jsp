<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/adminheader.jsp" %>
talk-notify - list&nbsp;&nbsp;&nbsp;
<form action="/admin/talkNotifyList" method="post">
	<input type="radio" name="check" value="" onclick="radio(this.value)"> 전체
	<input type="radio" name="check" value="check" onclick="radio(this.value)"> 대기
	<input type="radio" name="check" value="hold" onclick="radio(this.value)"> 보류
	<br/>

	<label>신고 수 : </label>
	<input type="number" id="count" name="count" size="10" value="${count}" style="width:50px"/>
	<input type="submit" value="검색"/>

</form>

<table border="1">
	<tr>
		<th>지역</th>
		<th>캠프명</th>
		<th>종류</th>
		<th>내용</th>
		<th>작성자</th>
		<th>익명여부</th>
		<th>신고수</th>
		<th>삭제여부</th>
		<th>변경</th>
	</tr>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.area }</td>
			<td>${dto.camp }</td>
			<td>${dto.sub }</td>
			<td>${dto.content }</td>
			<td>${dto.writer }</td>
			<td>
				<c:if test="${dto.ano == 'id'}">공개</c:if> 
				<c:if test="${dto.ano == 'ano'}">익명</c:if>
			</td>
			<td>${dto.cnt}</td>
			<td>
				<c:if test="${dto.notifycheck == 'check'}">대기</c:if> 
				<c:if test="${dto.notifycheck == 'hold'}">보류</c:if>
			</td>
			<td>
				<c:if test="${dto.notifycheck != 'hold'}">
				<input type="button" value="보류" onclick="hold(${dto.num_talk})" /></c:if> 
				<input type="button" value="삭제" onclick="del(${dto.num_talk})" />
			</td>
		</tr>
	</c:forEach>

</table>


<script>
	function del(num){
	    $.ajax({
			 type: "post",
			 url: "/admin/notifyDel",
			 data: { num_talk: num },
			 success: function(data){
				 if(data=="del"){
					 document.location.reload();
					 alert("삭제완료");
				 } 
			 }
	 	});
	}
	/* talkDelete */
	
	function hold(num){
	    $.ajax({
			 type: "post",
			 url: "/admin/notifyHold",
			 data: { num_talk: num },
			 success: function(data){
				 if(data=="hold"){
					 document.location.reload();
					 alert("보류로 변경");
				 } 
			 }
	  });
	}
</script>
