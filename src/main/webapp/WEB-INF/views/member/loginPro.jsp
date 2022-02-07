<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<title>로그인 프로</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

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

<c:if test="${result == 3}">
	<script>
		var bDate = '<fmt:formatDate value="${bandate}" pattern="yyyy-MM-dd" />';
		alert("정지된 ID입니다. \n \n로그인은 "+bDate+"에 가능합니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 4}">
	<script>
		alert("정지된 ID입니다. \n \n정지 횟수가 3회 도달하여 탈퇴처리 되었습니다.");
		history.go(-1);
	</script>
</c:if>

</body>