<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('e304ad71e1ebd10d8ca9913378b92600'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
              console.log(response)

        	  var kakao_id = response.id;
              var kakao_nickname = response.properties.nickname;
        	  var kakao_email = "no_check_email";
        	  if(response.kakao_account.has_email){
        		  var kakao_email = response.kakao_account.email;
        	  }
        	  
        	  window.location.href=
        		  '/member/loginPro_kakao?kakao_id='+kakao_id+
        				  '&kakao_email='+kakao_email+'&kakao_nickname='+kakao_nickname;
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  } 
</script>

<head>
<title>로그인</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>

<div class="loginform">
<form action="/member/loginPro" method="post" >

	<input type="text" name="id" placeholder="ID를 입력하세요" class="idbox"/> 
	<input type="password" name="pw" placeholder="비밀번호를 입력하세요" class="pwbox"/> 
		<input type="submit" value="로그인" class="loginbtn" />

</form>



<a href="javascript:void(0);" onclick="kakaoLogin();">
<img src="/resources/member/images/kakao_login.png"/></a><br /><br />

<a href="/member/input" id="meminput">회원가입</a>
</div>
</body>
<%@ include file = "../include/footer.jsp" %>