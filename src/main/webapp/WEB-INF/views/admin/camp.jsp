<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/adminheader.jsp" %>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 캠핑장</title>
</head>
<body>
<div class="admincampdiv">

	<div class="newcamp">
	<h3>신규 등록 대기 캠핑장</h3>
		<table class="newCamp_table">
			<tr>
			<th class="th_head">글번호</th>
			<th class="th_head">캠핑장명</th>
			<th class="th_head">삭제</th>
			
			</tr>
			<c:forEach var="newCamplist" items="${newCamplist}">
				
			<tr>
				
				<th>${newCamplist.contentid }</th>
				<th><a href="camp/newcamp?contentid=${newCamplist.contentid }">${newCamplist.facltnm }</a></th>
				<th>
				<form action="newcampDelete">
				<input type="hidden" name="contentid" value="${newCamplist.contentid }">
				<input type="submit" value="삭제"/>
				</form>
				</th>
				
			</tr>
				
			</c:forEach>
			</table>
	
	</div>

	<div class="updatecamp">
	<h3>정보 수정 대기 캠핑장</h3>
		<table class="updateCamp_table">
			<tr>
			<th class="th_head">글번호</th>
			<th class="th_head">캠핑장명</th>
			<th class="th_head">삭제</th>
			
			</tr>
			<c:forEach var="updateCamplist" items="${updateCamplist}">
				
			<tr>
				
				<th>${updateCamplist.contentid }</th>
				<th><a href="camp/updatecamp?contentid=${updateCamplist.contentid }">${updateCamplist.facltnm }</a></th>
				<th>
				<form action="delete_updateCamp">
				<input type="hidden" name="contentid" value="${updateCamplist.contentid }">
				<input type="submit" value="삭제"/>
				</form>
				</th>
				
			</tr>
				
			</c:forEach>
			</table>
	
	</div>


	<div class="delcamp">
	<h3>캠핑장 정보 삭제</h3>
		<form action="camp" method="get">
		<input type="text" id="searchbar" name="keyword" list="facltnmData"/>
		<datalist id="facltnmData">
				<c:forEach var="facltnmData" items="${facltnmData }">
				 <option value="${facltnmData.facltnm}">
				
				</c:forEach>
			</datalist>	
		<input type="submit" value="검색" />
	</form>
	<c:if test="${empty keyword }">
	 	캠핑장 이름을 입력해주세요.
	</c:if>
	
	<c:if test="${!empty keyword }">
	<table class="del_Camp_table">
			<tr>
			<th class="th_head">글번호</th>
			<th class="th_head">캠핑장명</th>
			<th class="th_head">삭제</th>
			
			</tr>
			<c:forEach var="facltnmlist" items="${facltnmlist}">
				
			<tr>
				
				<th>${facltnmlist.contentid }</th>
				<th><a href="../camp/info?contentid=${facltnmlist.contentid }">${facltnmlist.facltnm }</a></th>
				<th>
				<form action="delete_Camp">
				<input type="hidden" name="contentid" value="${facltnmlist.contentid }">
				<input type="submit" value="삭제"/>
				</form>
				</th>
				
			</tr>
				
			</c:forEach>
			</table>
		</c:if>
	</div>
</div>	

</body>
