<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>회원 탈퇴</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<c:if test="${sessionScope.status eq '회원'}">
<div class="memdeldiv">
	<h2> ${sessionScope.memId}님 정말 탈퇴하시겠습니까? </h2> 
	<br />
	
	<form action="/member/deletePro?kakao=0" method="post" >
	
		<input type="hidden" name="id" value="${sessionScope.memId}" />
		<p>${sessionScope.memId}님 탈퇴하시려면 비밀번호를 입력바랍니다.</p>
		 <input type="password" name="pw" placeholder="비밀번호를 입력해주세요"/> <br /><br />
			<input type="submit" value="탈퇴하기" />
	
	</form>
	<br/>
<a href="/main" >메인화면 돌아가기</a>
</div>	
</c:if>

<c:if test="${sessionScope.status eq '회원_kakao'}">
<div class="memdeldiv">
	<h2> ${sessionScope.memId}님 정말 탈퇴하시겠습니까? </h2> 
	<br />
	
	<form action="/member/deletePro?kakao=1" method="post" >
	<p>	탈퇴 처리 될 경우,</p> 
	<p>현재 로그인 한 카카오 아이디로 가입이 불가능 합니다.</p>
		<input type="hidden" name="id" value="${sessionScope.kakaoId}" />
		<input type="submit" value="탈퇴하기" />
	
	</form>
	<br/>
<a href="/main" >메인화면 돌아가기</a>
</div>	
</c:if>




</body>
<%@ include file = "../include/footer.jsp" %>