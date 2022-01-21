<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1> userInfo.jsp 입니다. </h1>


<c:if test="${memberDTO.status eq '회원' || memberDTO.status eq '관리자'}">
	id : ${memberDTO.id} <br />
	전화번호 : ${memberDTO.phone} <br />
	이메일 : ${memberDTO.email} <br />
	생일 : <fmt:formatDate value="${memberDTO.birth}" type="date" /> <br />
	지역 : ${memberDTO.location} <br />
	가입일 : <fmt:formatDate value="${memberDTO.reg_date}" type="date" /> <br />
	<br />
</c:if>

<c:if test="${memberDTO.status eq '회원_kakao'}">
	회원명 : ${sessionScope.memId} <br />
	전화번호 : ${memberDTO.phone} <br />
	이메일 : ${memberDTO.email} <br />
	생일 : <fmt:formatDate value="${memberDTO.birth}" type="date" /> <br />
	지역 : ${memberDTO.location} <br />
	가입일 : <fmt:formatDate value="${memberDTO.reg_date}" type="date" /> <br />
	<br />
</c:if>


<c:if test="${memberDTO.status eq '회원' || memberDTO.status eq '관리자'}">
	<form action="/member/update" method="post" >

		<input type="hidden" name="id" value="${sessionScope.memId}" />
		${sessionScope.memId}님 회원정보를 수정을 원하시면 비밀번호를 입력바랍니다.<br /><br />
		pw : <input type="password" name="pw" /> <br /><br />
			 <input type="submit" value="수정하기" />
			
	</form>
</c:if>

<c:if test="${memberDTO.status eq '회원_kakao'}">

	<a href="/member/update_kakao" >회원정보 수정</a>
	
</c:if>

<br /><br />
<a href="/main" >메인화면 돌아가기</a>