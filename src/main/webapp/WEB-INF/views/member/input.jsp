<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			$.ajax({
				type: "post", 
				url : "/member/idCheck",
				data : {id : $("#id").val()},
				success : function(data){
					a = parseInt(data);
					if(a==1){
						$("#result").html("<font color='red'>중복</font>");
					}else{
						$("#result").html("<font color='green'>사용가능</font>");
					}
				}
			});
		});
	});
</script>

<head>
<title>회원가입</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>
<div class="meminputform">
<form action="/member/inputPro" method="post" >

	<table class="meminputtbl" >
		<tr>
		<th class="meminputth">ID</th>
		<td><input type="text"		name="id" 	class ="meminputtxt"	id="id"	/> <input type="button" value="중복확인" id="btn" /> &nbsp; <label id="result"></label></td>
		</tr>
		<tr>
		<th class="meminputth">비밀번호</th>
		<td><input type="password" name="pw" 	class ="meminputtxt"	/></td>
		</tr>
		<tr>
		<th class="meminputth">전화번호</th>
		<td><input type="text" 	name="phone" 	placeholder="000-0000-0000"	class ="meminputtxt"/></td>
		</tr>
		<tr>
		<th class="meminputth">이메일</th>
		<td><input type="text" 	name="email" 	class ="meminputtxt"/></td>
		</tr>
		<tr>
		<th class="meminputth">생년월일</th>
		<td><input type="date" 	name="birth"	class ="meminputtxt"/></td>
		</tr>
		<tr>
		<th class="meminputth">지역</th>
		<td>※하단 버튼에서 선택 바랍니다. <br />
	<label><input type="radio" name="location" value="대한민국" checked />대한민국(기본값)</label> &nbsp;
	<label><input type="radio" name="location" value="경기도" />경기도(서울,인천 포함)</label> &nbsp;<br />
	<label><input type="radio" name="location" value="강원도" />강원도</label>&nbsp;
	<label><input type="radio" name="location" value="충청남도" />충청남도(대전,세종 포함)</label>&nbsp;<br /> 
	<label><input type="radio" name="location" value="충청북도" />충청북도</label> &nbsp;
	<label><input type="radio" name="location" value="경상남도" />경상남도(부산,울산 포함)</label><br />
	<label><input type="radio" name="location" value="경상북도" />경상북도(대구 포함)</label> &nbsp;
	<label><input type="radio" name="location" value="전라남도" />전라남도(광주 포함)</label> &nbsp;<br />
	<label><input type="radio" name="location" value="전라북도" />전라북도</label> &nbsp;
	<label><input type="radio" name="location" value="제주도" />제주도</label> &nbsp;<br />
	<label><input type="radio" name="location" value="해외지역" />해외지역</label></td>
		</tr>
	
	</table>

	<input type="submit" 	value="가입하기" 	class ="meminputbtn"/>
</form>
</div>
</body>