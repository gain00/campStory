<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<div class="good">
	<c:if test="${sessionScope.memId == null}">
		<script type="text/javascript">
			alert('로그인 후에 이용가능합니다');
			window.close();
		</script>
	</c:if>
	<c:if test="${sessionScope.memId != null}">
		<c:if test="${goodCount == 0 }">
		<script type="text/javascript">
			alert('좋아요 를 눌렀습니다.');
			window.close();
		</script>
		</c:if>
		<c:if test="${goodCount == 1 }">
		<script type="text/javascript">
			alert('좋아요 를 취소했습니다.');
			window.close();
		</script>
		</c:if>
	</c:if>  

</div>


</body>
</html>