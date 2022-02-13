<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
		$(".aa").click(function(){
			aa = this.id;
			xx =  $("#status_"+aa).val();
			yy =  $("#id_"+aa).val();
			zz =  "result_"+aa;
			console.log("====="+xx);
			console.log("====="+yy);
			
			$.ajax({
				type: "post", 
				url : "/admin/memberStatusPro",
				data : {status : xx, id : yy},
				success : function(data){
					b = parseInt(data);
					if(b==1){
						$("#"+zz).html("<font color='green'>Status 변경 완료</font>");
						setTimeout(function(){
							document.location.reload();
						}, 3000);
					}else{
						$("#"+zz).html("<font color='red'>Status 변경 에러</font>");
					}
				}
			});
		});
		
		$(".bb").click(function(){
			bb = this.id;
			xx =  $("#ban_date_"+bb).val();
			ww =  $("#warn_"+bb).val();
			yy =  $("#id_"+bb).val();
			rr =  $("#reason_"+bb).val();
			zz =  "result_"+bb;
			console.log("====="+xx);
			console.log("====="+yy);
			console.log("====="+ww);
			console.log("====="+rr);
			
			$.ajax({
				type: "post", 
				url : "/admin/memberBanPro",
				data : {ban_date : xx, warn : ww, id : yy, reason : rr},
				success : function(data){
					b = parseInt(data);
					if(b==1){
						$("#"+zz).html("<font color='green'>정지 설정 완료</font>");
						setTimeout(function(){
							document.location.reload();
						}, 3000);
					}else{
						$("#"+zz).html("<font color='red'>정지 설정 에러</font>");
					}
				}
			});
		});
		
		$(".cc").click(function(){
			cc = this.id;
			xx =  $("#ban_date_b"+cc).val();
			yy =  $("#id_b"+cc).val();
			ww =  $("#warn_b"+cc).val();
			rr =  $("#reason_b"+cc).val();
			zz =  "result_c"+cc;
			console.log("====="+xx);
			console.log("====="+yy);
			console.log("====="+ww);
			console.log("====="+rr);
			
			$.ajax({
				type: "post", 
				url : "/admin/memberChangeBandate",
				data : {ban_date : xx, warn : ww, id : yy, reason : rr},
				success : function(data){
					c = parseInt(data);
					if(c==1){
						$("#"+zz).html("<font color='green'>수정 완료</font>");
						setTimeout(function(){
							document.location.reload();
						}, 3000);
					}else{
						$("#"+zz).html("<font color='red'>수정 에러</font>");
					}
				}
			});
		});
		
	});
</script>


<head>
<title>관리자 회원 관리</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>
<%@ include file = "../include/adminheader.jsp" %>

<h1 class="pagesubject">관리자 멤버 관리</h1>
<div class="admin_member_div">
<div class="admin_member_count">
	<b>회원 목록(전체 회원 수:${count })</b><br />
</div>

<c:if test="${count == 0}">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center" >
		<tr>
		    <td align="center">
		    	회원이 없습니다.
		    </td>
		</tr>
	</table>
</c:if>

<c:if test="${count != 0}">
	<table class="admin_member_tbl" > 
	    <tr height="30"> 
	      <th>번 호</th>
	      <th>아이디</th> 
	      <th>상 태</th> 
	      <th>상태 변경</th>
	      <th>정지 횟수</th> 
	      <th>정지일</th> 
	      <th>정지일 정하기</th>
	      <th>수정 하기</th>
	      <th>정지 하기</th>
	    </tr>
		<c:forEach items="${list}" var="memberDTO" varStatus="status" >
			<tr height="30">
			    <td>${number - status.index}</td>
			    <td> ${memberDTO.id}</td>
			    <td> 
		    		<c:if test="${!fn:contains(memberDTO.status, 'kakao')}">
				    	<select id="status_a${status.index}" >
							<option value="관리자" 	${memberDTO.status eq '관리자'? 	'selected' : ''} >관리자</option>
							<option value="회원" 		${memberDTO.status eq '회원'? 	'selected' : ''} >회원</option>
							<option value="탈퇴" 		${memberDTO.status eq '탈퇴'? 	'selected' : ''} >탈퇴</option>
						</select>
					</c:if>
					
					<c:if test="${fn:contains(memberDTO.status, 'kakao')}">
						<select id="status_a${status.index}" >
							<option value="회원_kakao" 	${memberDTO.status eq '회원_kakao'? 	'selected' : ''} >회원_kakao</option>
							<option value="탈퇴_kakao" 	${memberDTO.status eq '탈퇴_kakao'? 	'selected' : ''} >탈퇴_kakao</option>
						</select>
					</c:if>
			    </td>
			    <td  width="150" >
					<input type="hidden" id="id_a${status.index}" value="${memberDTO.id}" />&nbsp;
			    	<input type="button" value="상태 변경" id="a${status.index}" class="aa" /><label id="result_a${status.index}"></label>
				</td>
			    <td align="center" width="150" > 
			    	<select id="warn_b${status.index}" >
						<option value="0" 	${memberDTO.warn == 0? 	'selected' : ''} >0</option>
						<option value="1" 	${memberDTO.warn == 1? 	'selected' : ''} >1</option>
						<option value="2" 	${memberDTO.warn == 2? 	'selected' : ''} >2</option>
					</select>
			    </td>
			    <td>
					<c:if test="${memberDTO.warn == 0}">
						정지 이력 없음
					</c:if>
					<c:if test="${memberDTO.warn != 0}">
						<fmt:formatDate value="${memberDTO.ban_date}" pattern="yy-MM-dd" />
					</c:if>
				</td>
				<td align="center"  width="200" >
					<input type="date" id="ban_date_b${status.index}" />
				</td>
				<td>
					&nbsp;
			    	<input type="button" value="수정 하기" id="${status.index}" class="cc" />
			    	<label id="result_c${status.index}"></label>
	      		</td>
	      		<td>
	      			<input type="hidden" id="id_b${status.index}" value="${memberDTO.id}" />&nbsp;
	      			<c:if test="${memberDTO.reason eq null}">
						<input type="text" id="reason_b${status.index}" class="bb" size="15" value="정지 사유"/>
					</c:if>
					<c:if test="${memberDTO.reason ne null}">
						<input type="text" id="reason_b${status.index}" class="bb" size="15" value="${memberDTO.reason}"/>
					</c:if>
			    	<input type="button" value="정지 하기" id="b${status.index}" class="bb" />
			    	<label id="result_b${status.index}"></label>
	      		</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<br />

<c:if test="${count > 0}">
	<center>
	<c:if test="${startPage > pageBlock}">
		<a href="/admin/member?pageNum=${startPage - pageBlock }">[이전]</a>&nbsp;
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" step="1" var="x" >
		<a href="/admin/member?pageNum=${x }">[${x }]</a>&nbsp;
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/admin/member?pageNum=${startPage + pageBlock }">[다음]</a>
	</c:if>
	</center>
</c:if>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>