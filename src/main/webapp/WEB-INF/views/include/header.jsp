<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../resources/style.css">
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





<nav class="navbar">

    <a href="/main" class="navbtn"><img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" id="cs_logo" /></a>
    <a href="/camp/list" class="navbtn"><h3>캠핑장 정보</h3></a>
    <a href="" class="navbtn"><h3>캠핑 관련 정보</h3></a>
    <a href="" class="navbtn"><h3>캠프톡</h3></a>
    <a href="" class="navbtn"><h3>고객센터</h3></a>
    <div class="navbtn">
	<c:if test="${sessionScope.memId != null}">
		<h5 class="navbtn" id="userid"> ${sessionScope.memId} 님</h5> 
	</c:if>
	<section class="logbtn">
<c:if test="${sessionScope.memId == null}">
    <a href="/member/login" class="navbtn"><input type="button" value="로그인" class="navbtn" id="loginbtn"></a>
	</c:if>
	<c:if test="${sessionScope.memId != null}">
	<c:if test="${sessionScope.status eq '회원'}">
		<a href="/member/logout" class="navbtn"><input type="button" value="로그아웃" class="navbtn" id="logoutbtn"></a>
		<a href="/member/userInfo" class="navbtn"><h4 id="userinfochk">회원정보 확인</h4></a>
		
	</c:if>
	
	<c:if test="${sessionScope.status eq '회원_kakao'}">
		<a href="/member/logout" onclick="kakaoLogout();" class="navbtn"><input type="button" value="로그아웃" class="navbtn" id="logoutbtn"></a>
		
		<a href="/member/userInfo" class="navbtn"><h4 id="userinfochk">회원정보 확인</h4></a>
		<!--<c:if test="${memberDTO.location eq '대한민국'}">
			더 나은 서비스를 위해서 추가정보를 등록 바랍니다.<br />
		</c:if><br />-->
		
	</c:if>
</c:if>
	</section>
	</div>
</nav>

<hr color="#DFD8CA" size="2" align="center" style="margin-bottom: 0px";/>

