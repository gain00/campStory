<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/adminheader.jsp" %>



<div class="admin_stats">
<h2>CampStory 통계</h2>
<h3 class="admin_stats_hl">키워드 검색 통계</h3>
	<div class="keyword_stats">
	
		<div class="keyword_stats_all">
			<table class="stat_table">
			<tr>
			<th class="th_head">순위</th>
			<th class="th_head">키워드</th>
			<th class="th_head">검색 횟수</th>
			</tr>
			<c:forEach var="keywordlist" items="${keywordlist}" begin="0" end="9" step="1">
				<c:set var="i" value="${i+1 }"/>
			<tr>
				<th>${i }</th>
				<th>${keywordlist.keyword }</th>
				<th>${keywordlist.s_count }</th>
			</tr>
			
			</c:forEach>
			</table>
		</div>
		<div class="keyword_stats_daily">
		<form action="main">
			<input type="date" name="keyworddate"/>
			<input type="submit" value="선택">
		</form>
		<table class="stat_table">
			<tr>
			<th class="th_head">순위</th>
			<th class="th_head">키워드</th>
			<th class="th_head">검색 횟수</th>
			<th class="th_head"> 검색 일자</th>
			</tr>
			<c:if test="${kdcount != 0 }">
			<c:forEach var="keyworddatelist" items="${keyworddatelist}" begin="0" end="9" step="1">
				<c:set var="j" value="${j+1 }"/>
			<tr>
				<th>${j }</th>
				<th>${keyworddatelist.keyword }</th>
				<th>${keyworddatelist.s_count }</th>
				<th>${keyworddate }</th>
			</tr>
			
			</c:forEach>
			</c:if>
			<c:if test="${kdcount == 0 }">
				<tr>
					<th>키워드 기록이 없습니다.</th>
				</tr>
			</c:if>
			</table>
		
		</div>
	</div>
	<h3 class="admin_stats_hl">캠핑장 조회수 통계</h3>
	<div class="readcount_stats">
	
		<div class="readcount_stats_all">
			<table class="stat_table">
			<tr>
			<th class="th_head">순위</th>
			<th class="th_head">캠핑장명</th>
			<th class="th_head">조회수</th>
			</tr>
			<c:forEach var="readcountlist" items="${readcountlist}" begin="0" end="9" step="1">
				<c:set var="r" value="${r+1 }"/>
			<tr>
				<th>${r }</th>
				<th>${readcountlist.facltnm }</th>
				<th>${readcountlist.readcount }</th>
			</tr>
			
			</c:forEach>
			</table>
		</div>
		<div class="readcount_stats_daily">
		<form action="main">
			<input type="date" name="readdate"/>
			<input type="submit" value="선택">
		</form>
		<table class="stat_table">
			<tr>
			<th class="th_head">순위</th>
			<th class="th_head">키워드</th>
			<th class="th_head">조회수</th>
			<th class="th_head">조회 일자</th>
			</tr>
			<c:if test="${rdcount != 0 }">
			<c:forEach var="readdatelist" items="${readdatelist}" begin="0" end="9" step="1">
				<c:set var="d" value="${d+1 }"/>
			<tr>
				<th>${d }</th>
				<th>${readdatelist.facltnm }</th>
				<th>${readdatelist.readcount }</th>
				<th>${readdate }</th>
			</tr>
			
			</c:forEach>
			</c:if>
			<c:if test="${rdcount == 0 }">
				<tr>
					<th>키워드 기록이 없습니다.</th>
				</tr>
			</c:if>
			</table>
		
		</div>
	</div>
	<h3 class="admin_stats_hl">캠핑장 좋아요 통계</h3>
	<div class="good_stats">
	
			<table class="stat_table">
			<tr>
			<th class="th_head">순위</th>
			<th class="th_head">캠핑장명</th>
			<th class="th_head">좋아요 횟수 </th>
			</tr>
			<c:forEach var="goodlist" items="${goodlist}" begin="0" end="9" step="1">
				<c:set var="g" value="${g+1 }"/>
			<tr>
				<th>${g }</th>
				<th>${goodlist.facltnm}</th>
				<th>${goodlist.good }</th>
			</tr>
			
			</c:forEach>
			</table>
		</div>
</div>

