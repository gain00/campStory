<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#btn").click(function(){
			if($("#title").val() =="" || $("#content").val() =="" ){
				alert("내용을 입력하십시오.");
				return false;
			}else{
				$.ajax({
					type: "post", 
					url : "/cs/noticeWritePro",
					data : {title : $("#title").val(), content : $("#content").val() },
					success : function(data){
						a = parseInt(data);
						if(a==1){
							$("#result").html("<font color='green'>공지 업데이트 완료</font>");
							setTimeout(function(){
								document.location.reload();
							}, 3000);
						}else{
							$("#result").html("<font color='red'>공지 업데이트 에러</font>");
						}
					}
				});
			}
		});
		
	});

	function open_detail(){
		if (document.getElementById('write_table').style.display == "")
		{
			document.getElementById('write_table').style.display = 'none';
		}else{
			document.getElementById('write_table').style.display = '';
		}
	}
	
	function open_delete(num){
		if(confirm("글을 삭제 하시겠습니까?")){
			window.location="/cs/noticeDeletePro?num="+num;
		}else{
			return;
		}
	}
</script>

<head>
<title>CampStory-공지사항</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>


<input type="hidden" id="pageSize" value="${pageSize}" />
<h1 class="pagesubject">공지사항</h1>
<c:if test="${sessionScope.adminId != null}">
	<div class="CSwrite">
	
		<a href="JavaScript:;" onclick="JavaScript: open_detail();">[공지글쓰기]</a>
		
		<table  id="write_table" style="display: none;" class="Noticewrite_table" > 
			<tr height="30">
				<td align="center"   class="writetblcolor">글제목</td>
			    <td  width="400" >
			    	&nbsp;<input type="text" id="title" size="40" />
				</td>
			</tr>
			<tr height="50">
				<td align="center"   class="writetblcolor">글내용</td>
			    <td width="400" >
			    	&nbsp;<textarea id="content" rows="5" cols="50"></textarea>
			    </td>
			</tr>
			<tr height="30">
			    <td width="550" align="center" colspan="2" >
					<input type="button" value="공지글 쓰기" id="btn" /> &nbsp; <label id="result"></label>
			    </td>
			</tr>
		</table>
	
	</div>
</c:if>

<br />

<div class="CS_select">
	<b>글목록(전체 글:${count })</b><br />
</div>

<c:if test="${count == 0}">
	<table width="700" border="1" cellpadding="0" cellspacing="0" align="center" >
		<tr>
		    <td align="center">
		    	글이 없습니다.
		    </td>
		</tr>
	</table>
</c:if>

<c:if test="${count != 0}">
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" class="Noticetbl" > 
	    <tr height="30"> 
	      <td align="center"  width="50"  class="writetblcolor">번 호</td>
	      <td align="center"  width="450" class="writetblcolor">제   목</td> 
	      <td align="center"  width="200" class="writetblcolor">작성시간</td> 
	    </tr>
		<c:forEach items="${list}" var="csDTO" varStatus="status" >
			<tr height="30" class="writetbltr">
			    <td align="center"  width="50" rowspan="2">${number - status.index}</td>
			    <td  width="450" > ${csDTO.title}</td>
			    <td align="center"  width="200">
					<fmt:formatDate value="${csDTO.reg_time}" pattern="yy-MM-dd HH:mm" />
				</td>
			</tr>
			<tr height="50">
				
			    <td colspan="2" width="650" >
			    	${csDTO.content}
			    	<c:if test="${sessionScope.adminId != null}">
			    		&nbsp;&nbsp;&nbsp;&nbsp;
			    		<a href="JavaScript:;" onclick="JavaScript: open_delete(${csDTO.num_notice});">
			    		<img src = "/resources/cs/delete.png" style="width: 20px;" ></a>
			    	</c:if>
			    </td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<br /><br /><br />

<c:if test="${count > 0}">
	<center>
	<c:if test="${startPage > pageBlock}">
		<a href="/cs/notice?pageNum=${startPage - pageBlock }">[이전]</a>&nbsp;
	</c:if>
	<c:forEach begin="${startPage }" end="${endPage }" step="1" var="x" >
		<a href="/cs/notice?pageNum=${x }">[${x }]</a>&nbsp;
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/cs/notice?pageNum=${startPage + pageBlock }">[다음]</a>
	</c:if>
	</center>
</c:if>
<br /><br />

<%@ include file = "../include/footer.jsp" %>
