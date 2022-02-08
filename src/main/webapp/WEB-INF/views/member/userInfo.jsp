<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>회원 정보 확인</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>
<div class="meminfodiv">
<c:if test="${memberDTO.status eq '회원' || memberDTO.status eq '관리자'}">
	
	
	
	<table class="meminfotbl" >
		<tr>
		<th class="meminfoth">ID</th>
		<td>${memberDTO.id}</td>
		</tr>
		<tr>
		<th class="meminfoth">전화번호</th>
		<td>${memberDTO.phone}</td>
		</tr>
		<tr>
		<th class="meminfoth">이메일</th>
		<td>${memberDTO.email}</td>
		</tr>
		<tr>
		<th class="meminfoth">생년월일</th>
		<td><fmt:formatDate value="${memberDTO.birth}" type="date" /></td>
		</tr>
		<tr>
		<th class="meminfoth">지역</th>
		<td>${memberDTO.location}</td>
		</tr>
		<tr>
		<th class="meminfoth">가입일</th>
		<td><fmt:formatDate value="${memberDTO.reg_date}" type="date" /></td>
		</tr>
	
	</table>
	
</c:if>

<c:if test="${memberDTO.status eq '회원_kakao'}">
<table class="meminfotbl" >
		<tr>
		<th class="meminfoth">회원명</th>
		<td>${sessionScope.memId}</td>
		</tr>
		<tr>
		<th class="meminfoth">전화번호</th>
		<td>${memberDTO.phone}</td>
		</tr>
		<tr>
		<th class="meminfoth">이메일</th>
		<td>${memberDTO.email}</td>
		</tr>
		<tr>
		<th class="meminfoth">생년월일</th>
		<td><fmt:formatDate value="${memberDTO.birth}" type="date" /></td>
		</tr>
		<tr>
		<th class="meminfoth">지역</th>
		<td>${memberDTO.location}</td>
		</tr>
		<tr>
		<th class="meminfoth">가입일</th>
		<td><fmt:formatDate value="${memberDTO.reg_date}" type="date" /></td>
		</tr>
	
	</table>


</c:if>

<br/>
<c:if test="${memberDTO.status eq '회원' || memberDTO.status eq '관리자'}">
	<form action="/member/update" method="post" >

		<input type="hidden" name="id" value="${sessionScope.memId}" />
		${sessionScope.memId}님 회원정보를 수정을 원하시면 비밀번호를 입력바랍니다.<br /><br />
		pw : <input type="password" name="pw" /> <br /><br />
			 <input type="submit" value="수정하기" />
			
	</form>
</c:if>

<c:if test="${memberDTO.status eq '회원_kakao'}">
	<br/>
	<a href="/member/update_kakao" >회원정보 수정</a>
	
</c:if>
</div>
</body>