<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>회원 탈퇴</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<c:if test="${sessionScope.status eq '회원'}">
	<h1> ${sessionScope.memId}님 정말 탈퇴하시겠습니까? </h1> 
	<br />
	
	<form action="/member/deletePro?kakao=0" method="post" >
	
		<input type="hidden" name="id" value="${sessionScope.memId}" />
		${sessionScope.memId}님 탈퇴하시려면 비밀번호를 입력바랍니다.<br /><br />
		pw : <input type="password" name="pw" /> <br /><br />
			<input type="submit" value="탈퇴하기" />
	
	</form>
</c:if>

<c:if test="${sessionScope.status eq '회원_kakao'}">
	<h1> ${sessionScope.memId}님 정말 탈퇴하시겠습니까? </h1> 
	<br />
	
	<form action="/member/deletePro?kakao=1" method="post" >
		탈퇴 처리 될 경우, 현재 로그인 한 카카오 아이디로 가입이 불가능 합니다.
		<input type="hidden" name="id" value="${sessionScope.kakaoId}" />
		<input type="submit" value="탈퇴하기" />
	
	</form>
</c:if>


<br /><br />
<a href="/main" >메인화면 돌아가기</a>

</body>