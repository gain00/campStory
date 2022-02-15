<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/style.css">
<c:if test="${sessionScope.status ne '관리자'}">
	<script>
	alert("관리자만 입장 할 수 있는 페이지 입니다. 메인으로 돌아갑니다.");
	window.location="/main";
	</script>
</c:if>
<nav class="ad_navbar">

    <a href="main" class="ad_navbtn"><h3 class="h3_adnav">관리자 메인</h3></a>
    <a href="camp" class="ad_navbtn"><h3 class="h3_adnav">캠핑장 관리</h3></a>
    <a href="/admin/talkNotifyList" class="ad_navbtn"><h3 class="h3_adnav">캠프톡 관리</h3></a>
    <a href="member" class="ad_navbtn"><h3 class="h3_adnav">멤버 관리</h3></a>
    
</nav>

<hr color="#DFD8CA" size="2" align="center" style="margin-bottom: 0px; margin-top: 0px";/>    
 

