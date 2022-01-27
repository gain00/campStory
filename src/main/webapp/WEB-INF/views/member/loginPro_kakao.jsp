<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>로그인 프로_카카오</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<c:if test="${result == 0}">
	<script>
		alert("카카오 id로 신규 등록 되었습니다.");
		window.location="/member/update_kakao";
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

</body>