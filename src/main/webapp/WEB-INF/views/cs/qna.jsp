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
				var sec_num = 0;
				if($("#secret").prop('checked')){sec_num = 1;}
				
				$.ajax({
					type: "post", 
					url : "/cs/qnaWritePro",
					data : {category : $("#category").val(), title : $("#title").val(), 
								content : $("#content").val(), writer : $("#writer").val(), secret : sec_num
							},
					success : function(data){
						a = parseInt(data);
						if(a==1){
							$("#result").html("<font color='green'>게시물 업데이트 완료</font>");
							setTimeout(function(){
								document.location.reload();
							}, 3000);
						}else{
							$("#result").html("<font color='red'>게시물 업데이트 에러</font>");
						}
					}
				});
			}
		});
		
		$("#btn_search").click(function(){
			
			console.log("====="+$("#cate").val());
			console.log("====="+$("#colum").val());
			console.log("====="+$("#search").val());
			
			if($("#search").val() ==""){
				alert("내용을 입력하십시오.");
				return false;
			}else{
				window.location="/cs/qna?pageNum=1&cate="+$("#cate").val()+"&col=1&colum="+$("#colum").val()+"&search="+$("#search").val();
			}
		});
		
		$(".aa").click(function(){
			aa = this.id;
			xx =  $("#re_comment_"+aa).val();
			yy =  $("#num_question_"+aa).val();
			zz =  "result_admin_"+aa;
			console.log("====="+xx);
			console.log("====="+yy);
			
			if(xx ==""){
				alert("내용을 입력하십시오.");
				return false;
			}else{
				$.ajax({
					type: "post", 
					url : "/cs/qnaAdminPro",
					data : {re_comment : xx, num_question : yy},
					success : function(data){
						b = parseInt(data);
						if(b==1){
							$("#"+zz).html("<font color='green'>답변 업데이트 완료</font>");
							setTimeout(function(){
								document.location.reload();
							}, 3000);
						}else{
							$("#"+zz).html("<font color='red'>답변 업데이트 에러</font>");
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
	
	function open_update(num){
		if(confirm("글을 수정 하시겠습니까?")){
			url = "/cs/qnaUpdate?num="+num;
	        open(url, "qnaUpdate",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=600, height=300");
		}else{
			return;
		}
	}
	
	function open_delete(num){
		if(confirm("글을 삭제 하시겠습니까?")){
			window.location="/cs/qnaDeletePro?num="+num;
		}else{
			return;
		}
	}
</script>

<head>
<title>Q&A 게시판</title>

</head>


<body>
<%@ include file = "../include/header.jsp" %>


<input type="hidden" id="pageSize" value="${pageSize}" />

<c:if test="${sessionScope.memId != null}">
<div class="CSwrite">
	
		<a href="JavaScript:;" onclick="JavaScript: open_detail();">[글쓰기]</a>
		
		<table id="write_table" style="display: none;" class="CSwrite_table" > 
			<tr height="30">
			    <td width="150" class="writetblcolor">
					<select id="category" >
						<option value="시스템" selected >시스템 문의</option>
						<option value="계정">계정 문의</option>
					</select>
				</td>
			    <td  width="400" class="writetblcolor">
			    	&nbsp;제목 : <input type="text" id="title" size="40" />
				</td>
				<input type="hidden" id="writer" value="${sessionScope.memId}" />
			</tr>
			<tr height="50">
				<td width="150" class="writetblcolor">글내용</td>
			    <td width="400" >
			    	<textarea id="content" rows="5" cols="50"></textarea>
			    </td>
			</tr>
			<tr height="30">
			    <td width="550" align="right" colspan="2" >
			    	<label><input type="checkbox" value="1" id="secret" />비밀글</label>&nbsp;
					<input type="button" value="문의하기" id="btn" /> &nbsp; <label id="result"></label>
			    </td>
			</tr>
		</table>
		
	
	</div>
</c:if>

<br />

<div class="CS_select">
	<b>글목록(전체 글:${count })</b>
	<select name="cate" onchange="location.href='/cs/qna?cate='+this.value" >
		<option value="전체" ${cate eq '전체'? 'selected' : ''} >전 체</option>
		<option value="시스템" ${cate eq '시스템'? 'selected' : ''} >시스템 문의</option>
		<option value="계정" ${cate eq '계정'? 'selected' : ''} >계정 문의</option>
	</select>

</div>
<div>
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
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" > 
	    <tr height="30"> 
	      <td align="center"  width="50"  class="writetblcolor">번 호</td>
		  <td align="center"  width="100" class="writetblcolor">카테고리</td>
	      <td align="center"  width="250" class="writetblcolor">제   목</td> 
	      <td align="center"  width="100" class="writetblcolor">작성자</td>
	      <td align="center"  width="200" class="writetblcolor">작성시간</td> 
	    </tr>
		<c:forEach items="${list}" var="csDTO" varStatus="status" >
			<c:if test="${csDTO.secret == 0 || (csDTO.secret == 1 && sessionScope.memId == csDTO.writer) || sessionScope.adminId != null}">
				<tr height="30" class="writetbltr" >
				    <td align="center"  width="50" rowspan="2">${number - status.index}</td>
				    <td align="center" width="100" >${csDTO.category}</td>
				    <td align="center" width="250" > ${csDTO.title}</td>
				    <td align="center"  width="100">${csDTO.writer}</td>
				    <td align="center"  width="200">
						<fmt:formatDate value="${csDTO.reg_time}" pattern="yy-MM-dd HH:mm" />
					</td>
				</tr>
				<tr height="50">
					
					<td align="center"  width="100" class="writetblcolor">글내용</td>
				    <td colspan="3" width="550" >
				    	${csDTO.content}
				    	<c:if test="${sessionScope.memId == csDTO.writer || sessionScope.adminId != null}">
				    		&nbsp;&nbsp;&nbsp;&nbsp;
				    		<a href="JavaScript:;" onclick="JavaScript: open_update(${csDTO.num_question});">
				    		<img src = "/resources/cs/update.png" style="width: 20px;" ></a>
				    		&nbsp;
				    		<a href="JavaScript:;" onclick="JavaScript: open_delete(${csDTO.num_question});">
				    		<img src = "/resources/cs/delete.png" style="width: 20px;" ></a>
				    	</c:if>
				    </td>
				</tr>
				<c:if test="${csDTO.re_comment ne null && sessionScope.adminId == null}">
					<tr height="30">
						
						<td align="center"  width="100" class="csanswer"><img src = "/resources/cs/cs_answer.png" style="width: 25px; height:25px" >답  변</td>
					    <td colspan="4" width="550" class="csanswer">${csDTO.re_comment}</td>
					</tr>
				</c:if>
			</c:if>
			<c:if test="${csDTO.secret == 1 && sessionScope.memId != csDTO.writer && sessionScope.adminId == null}">
				<tr height="30" class="writetbltr">
				    <td align="center"  width="50" rowspan="2">${number - status.index}</td>
				    <td align="center" width="100" >${csDTO.category}</td>
				    <td  width="250" > 비밀글 입니다. </td>
				    <td align="center"  width="100"> - </td>
				    <td align="center"  width="200">
						<fmt:formatDate value="${csDTO.reg_time}" pattern="yy-MM-dd HH:mm" />
					</td>
				</tr>
				<tr height="50">
					
					<td align="center"  width="100" class="writetblcolor">글내용</td>
				    <td colspan="3" width="550" > 비밀글 입니다. </td>
				</tr>
				<c:if test="${csDTO.re_comment ne null && sessionScope.adminId == null}">
					<tr height="30">
						<td align="center"  width="50" ></td>
						<td align="center"  width="100" >답  변</td>
					    <td colspan="3" width="550" >${csDTO.re_comment}</td>
					</tr>
				</c:if>
			</c:if>
			<c:if test="${sessionScope.adminId != null}">
				<tr height="30">
					<td align="center"  width="50" ></td>
					<td align="center"  width="100" >답변쓰기</td>
				    <td colspan="3" width="550" >
				    	<input type="hidden" id="num_question_a${status.index}" value="${csDTO.num_question}" />
				    	<input type="text" id="re_comment_a${status.index}" size="40" value="${csDTO.re_comment}" />
				    	<input type="button" value="답변하기" id="a${status.index}" class="aa" /><label id="result_admin_a${status.index}"></label>
				    </td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<br/>
</c:if>

<br />

<c:if test="${count > 0}">
	<c:if test="${col eq '0'}">
		<center>
		<c:if test="${startPage > pageBlock}">
			<a href="/cs/qna?pageNum=${startPage - pageBlock }&cate=${cate }">[이전]</a>&nbsp;
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="x" >
			<a href="/cs/qna?pageNum=${x }&cate=${cate }">[${x }]</a>&nbsp;
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="/cs/qna?pageNum=${startPage + pageBlock }&cate=${cate }">[다음]</a>
		</c:if>
		</center>
	</c:if>
	<c:if test="${col eq '1'}">
		<center>
		<c:if test="${startPage > pageBlock}">
			<a href="/cs/qna?pageNum=${startPage - pageBlock }&cate=${cate }&col=1&colum=${colum }&search=${search }">[이전]</a>&nbsp;
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="x" >
			<a href="/cs/qna?pageNum=${x }&cate=${cate }&col=1&colum=${colum }&search=${search }">[${x }]</a>&nbsp;
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="/cs/qna?pageNum=${startPage + pageBlock }&cate=${cate }&col=1&colum=${colum }&search=${search }">[다음]</a>
		</c:if>
		</center>
	</c:if>
</c:if>
</div>

<c:if test="${sessionScope.memId != null}">
	<div class="myCs">
		<a href="/cs/qna?pageNum=1&cate=${cate }&col=1&colum=writer&search=${sessionScope.memId}">[나의 작성글 확인]</a>
		
	</div>
</c:if>

<div class="cs_search">
	<select id="colum">
		<option value="title">제목</option>
		<option value="content">글내용</option>
	</select>
	<input type="text" id="search" />
	<input type="hidden" id="cate" value="${cate}" />
	<input type="button" id="btn_search" value="검색하기" />
	

</div>
</body>
