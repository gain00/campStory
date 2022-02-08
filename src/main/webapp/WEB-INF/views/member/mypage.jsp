<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('e304ad71e1ebd10d8ca9913378b92600'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<head>
<title>마이 페이지</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<c:if test="${sessionScope.memId == null}">
	<h1> Guest님 어서오세요 ... !</h1> 
</c:if>

<c:if test="${sessionScope.memId != null}">
	<h1> ${sessionScope.memId}님 어서오세요 ... !</h1> 
</c:if>

<c:if test="${sessionScope.adminId != null}">
	<h1> 관리자 계정입니다 ... !</h1> 
</c:if>

<br />

<c:if test="${sessionScope.memId == null}">
	<a href="/member/input" >회원 가입하기</a><br /><br />

	<a href="/member/login" >로그인 하기</a><br /><br /> 
</c:if>

<c:if test="${sessionScope.memId != null}">
	<c:if test="${memberDTO.status eq '회원' || memberDTO.status eq '관리자'}">
		<a href="/member/logout" >로그아웃 하기</a><br /><br />
		
		<a href="/member/favorite" >즐겨찾기 모음</a><br /><br />
		
		<a href="/member/userInfo" >회원정보 확인</a><br /><br />
		
		<a href="/member/delete" >탈퇴하기</a>
	</c:if>
	
	<c:if test="${memberDTO.status eq '회원_kakao'}">
		<a href="/member/logout" onclick="kakaoLogout();">카카오 로그아웃</a><br /><br />
		
		<a href="/member/favorite" >즐겨찾기 모음</a><br /><br />
		
		<a href="/member/userInfo" >회원정보 확인</a><br />
		<c:if test="${memberDTO.location eq '대한민국'}">
			더 나은 서비스를 위해서 추가정보를 등록 바랍니다.<br />
		</c:if><br />
		
		<a href="/member/delete" >탈퇴하기</a>
	</c:if>
</c:if>

</body>