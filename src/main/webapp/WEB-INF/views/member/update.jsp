<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result != 1}">
	<script>
		alert("비밀번호를 확인하세요.");
		history.go(-1);
	</script>
</c:if>

<head>
<title>회원정보 수정</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>


<div class="meminputform">
<form action="/member/updatePro" method="post" >

	<table class="meminputtbl" >
		<tr>
		<th class="meminputth">ID</th>
		<td>${memberDTO.id} </td>
		</tr>
		<tr>
		<th class="meminputth">비밀번호</th>
		<td><input type="password" name="pw"		value="${memberDTO.pw}"	/></td>
		</tr>
		<tr>
		<th class="meminputth">전화번호</th>
		<td><input type="text" 	name="phone" 	value="${memberDTO.phone}"	/></td>
		</tr>
		<tr>
		<th class="meminputth">이메일</th>
		<td><input type="text" 	name="email" 	value="${memberDTO.email}"	/></td>
		</tr>
		<tr>
		<th class="meminputth">생년월일</th>
		<td><input type="date" 	name="birth" 
				value="<fmt:formatDate value="${memberDTO.birth}" pattern="yyyy-MM-dd" />" /></td>
		</tr>
		<tr>
		<th class="meminputth">지역</th>
		<td>※하단 버튼에서 선택 바랍니다. <br />
	<label><input type="radio" name="location" value="대한민국" ${memberDTO.location eq '대한민국'? 'checked' : ''} />대한민국(기본값)</label> &nbsp;
	<label><input type="radio" name="location" value="경기도" ${memberDTO.location eq '경기도'? 'checked' : ''} />경기도(서울,인천 포함)</label><br />
	<label><input type="radio" name="location" value="강원도" ${memberDTO.location eq '강원도'? 'checked' : ''} />강원도</label> &nbsp;
	<label><input type="radio" name="location" value="충청남도" ${memberDTO.location eq '충청남도'? 'checked' : ''} />충청남도(대전,세종 포함)</label><br />
	<label><input type="radio" name="location" value="충청북도" ${memberDTO.location eq '충청북도'? 'checked' : ''} />충청북도</label> &nbsp;
	<label><input type="radio" name="location" value="경상남도" ${memberDTO.location eq '경상남도'? 'checked' : ''} />경상남도(부산,울산 포함)</label><br />
	<label><input type="radio" name="location" value="경상북도" ${memberDTO.location eq '경상북도'? 'checked' : ''} />경상북도(대구 포함)</label> &nbsp;
	<label><input type="radio" name="location" value="전라남도" ${memberDTO.location eq '전라남도'? 'checked' : ''} />전라남도(광주 포함)</label><br />
	<label><input type="radio" name="location" value="전라북도" ${memberDTO.location eq '전라북도'? 'checked' : ''} />전라북도</label>&nbsp;<br />
	<label><input type="radio" name="location" value="제주도" ${memberDTO.location eq '제주도'? 'checked' : ''} />제주도</label> <br />
	<label><input type="radio" name="location" value="해외지역" ${memberDTO.location eq '해외지역'? 'checked' : ''} />해외지역</label>&nbsp;
	
		</tr>
	
	</table>
	<input type="hidden" name="id" value="${memberDTO.id}" />
	<input type="submit" value="회원정보 수정" />
</form>
</div>




</body>