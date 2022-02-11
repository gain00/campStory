<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/style.css">
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
    <a href="/campTalk/talkList" class="navbtn"><h3>캠프톡</h3></a>
    <a href="/cs/qna" class="navbtn"><h3>QNA</h3></a>
    <a href="/cs/notice" class="navbtn"><h3>공지사항</h3></a>
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
		


		<div class="membermenu">
        <input type="checkbox" class="" id="collapsible">
        <label for="collapsible"><span>회원메뉴</span></label>
        <ul id="menuitems" class="menuitems">
            <li><a href="/member/favorite">즐겨찾기</a></li>
            <li><a href="/member/userInfo">회원정보</a></li>
            <li><a href="/member/delete">회원정보탈퇴</a></li>
           	<li><a href="/member/logout">로그아웃</a></li>
            
        </ul>        
    </div>
		
		
	</c:if>
	
	<c:if test="${sessionScope.status eq '회원_kakao'}">
		<div class="membermenu">
        <input type="checkbox" class="" id="collapsible">
        <label for="collapsible"><span>회원메뉴</span></label>
        <ul id="menuitems" class="menuitems">
            <li><a href="/member/favorite">즐겨찾기</a></li>
            <li><a href="/member/userInfo">회원정보</a></li>
            <li><a href="/member/delete">회원정보탈퇴</a></li>
           	<li><a href="/member/logout" onclick="kakaoLogout();">로그아웃</a></li>
            
        </ul>        
    </div>
	
		
	</c:if>
	
	<c:if test="${sessionScope.status eq '관리자'}">
		<a href="/member/logout" class="navbtn"><input type="button" value="로그아웃" class="navbtn" id="logoutbtn"></a>
		<a href="/admin/main" class="navbtn"><h4 id="mypage">관리자 메인가기</h4></a>
		
	</c:if>
</c:if>
	</section>
	</div>
</nav>

<hr color="#DFD8CA" size="2" align="center" style="margin-bottom: 0px";/>

<c:if test="${sessionScope.memId != null}">
	<%@ include file = "sideChat.jsp" %>
</c:if>
