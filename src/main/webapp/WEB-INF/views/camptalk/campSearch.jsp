<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>

<form action="/campTalk/campSearchList" method="post">
	
	<table border="1" class="ta">
		<tr>
			<td> 
				<select name="areaEng" id="areaEng">
					<option value="">지역</option>
					<option value="Seoul" <c:if test="${area == 'Seoul'}"> selected="selected"</c:if>> 서울</option>
					<option value="Gyeonggi" <c:if test="${area == 'Gyeonggi'}"> selected="selected"</c:if>>경기도</option>
					<option value="Incheon" <c:if test="${area == 'Incheon'}"> selected="selected"</c:if>>인천</option>
					<option value="Gangwon" <c:if test="${area == 'Gangwon'}"> selected="selected"</c:if>>강원</option>
					<option value="Chungcheongnam" <c:if test="${area == 'Chungcheongnam'}"> selected="selected"</c:if>>충남</option>
					<option value="Daejeon" <c:if test="${area == 'Daejeon'}"> selected="selected"</c:if>>대전</option>
					<option value="Chungbuk" <c:if test="${area == 'Chungbuk'}"> selected="selected"</c:if>>충북</option>
					<option value="Sejong" <c:if test="${area == 'Sejong'}"> selected="selected"</c:if>>세종</option>
					<option value="Busan" <c:if test="${area == 'Busan'}"> selected="selected"</c:if>>부산</option>
					<option value="Ulsan" <c:if test="${area == 'Ulsan'}"> selected="selected"</c:if>>울산</option>
					<option value="Deagu" <c:if test="${area == 'Deagu'}"> selected="selected"</c:if>>대구</option>
					<option value="Gyeongbuk" <c:if test="${area == 'Gyeongbuk'}"> selected="selected"</c:if>>경북</option>
					<option value="Gyeongsangnam" <c:if test="${area == 'Gyeongsangnam'}"> selected="selected"</c:if>>경남</option>
					<option value="Jeonnam" <c:if test="${area == 'Jeonnam'}"> selected="selected"</c:if>>전남</option>
					<option value="Gwangju" <c:if test="${area == 'Gwangju'}"> selected="selected"</c:if>>광주</option>
					<option value="Jeonbuk" <c:if test="${area == 'Jeonbuk'}"> selected="selected"</c:if>>전북</option>
					<option value="Jeju" <c:if test="${area == 'Jeju'}"> selected="selected"</c:if>>제주</option>
				</select>
			</td>
		<td><input type="text" name="camp" id="camp" value="${camp }"/></td>
		<td><input type="submit" value="검색" id="btn_campS"/></td>
		<td><input type="button" value="닫기" onclick="window.self.close()"/></td>
		</tr>
	</table>
</form>

<table border=1>
	<tr><th>캠프명</th><th width="200px">주소</th></tr>

	<c:if test="${empty list}">
		<tr><td colspan="2">검색된 캠프가 없습니다</td></tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="dto">
		<tr>
		<td >
		<input type="hidden" name="contentid" id="contentid" value="${dto.contentid}"/>
		<a href='#' class='select' onclick="result('${dto.facltnm}','${dto.contentid}','${dto.donm}')">${dto.facltnm}</a>
		</td>
		<td><a href='#' class='select' onclick="result('${dto.facltnm}','${dto.contentid}','${dto.donm}')">${dto.addr1}</a></td>

		</tr>
		</c:forEach>
		
		<tr><td align="center" colspan="2">
			<c:if test="${page.pageStart > 10}">
				<a href="/campTalk/campSearchList?pageNum=${page.pageStart - 10}&areaEng=${areaEng}">[이전]</a>
			</c:if>	
			
			<c:forEach var="i" begin="${page.pageStart}" end="${page.pageEnd}">
				<a href="/campTalk/campSearchList?pageNum=${i}&areaEng=${areaEng}">${i}</a>
			</c:forEach>
		
						
			<c:if test="${page.pageEnd < page.pageCount}">
				<a href="/campTalk/campSearchList?pageNum=${page.pageStart + 10}&areaEng=${areaEng}">[다음]</a>
			</c:if>	
	
		</td></tr>		
	</c:if>
</table>

<script>
	function result(camp,contentid, donm){
		opener.document.cs.camp.value=camp;
		opener.document.cs.contentid.value=contentid;
		opener.document.cs.area.value=donm;
		self.close();
	}
</script>