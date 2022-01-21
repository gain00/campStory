<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>loginPro.jsp 페이지 입니다 ... ! </h1>

<c:if test="${result == 0}">
	<script>
		alert("id/pw를 확인하세요.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 1}">
	<script>
		alert("로그인 되었습니다.");
		window.location="/main";
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("탈퇴한 ID입니다. \n \n탈퇴 ID 복원은 관리자 문의 바랍니다.");
		history.go(-1);
	</script>
</c:if>