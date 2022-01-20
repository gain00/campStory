<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					url : "/cs/qnaUpdatePro",
					data : {category : $("#category").val(), title : $("#title").val(), num_question : $("#num_question").val(), 
								content : $("#content").val(), secret : sec_num
							},
					success : function(data){
						a = parseInt(data);
						if(a==1){
							$("#result").html("<font color='green'>게시물 수정 완료</font>");
						}else{
							$("#result").html("<font color='red'>게시물 수정 에러</font>");
						}
					}
				});
			}
		});
	});
</script>

<table border="1" width="550" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30">
	    <td align="center" width="150" >
			<select id="category" >
				<option value="시스템" ${csDTO.category eq '시스템'? 'selected' : ''} >시스템 문의</option>
				<option value="계정" ${csDTO.category eq '계정'? 'selected' : ''} >계정 문의</option>
			</select>
		</td>
	    <td  width="400" >
	    	&nbsp;제목 : <input type="text" id="title" size="40" value="${csDTO.title}"/>
		</td>
		<input type="hidden" id="num_question" value="${csDTO.num_question}" />
	</tr>
	<tr height="50">
		<td align="center"  width="150" >글내용</td>
	    <td width="400" >
	    	&nbsp;&nbsp;&nbsp;<textarea id="content" rows="5" cols="50">${csDTO.content}</textarea>
	    </td>
	</tr>
	<tr height="30">
	    <td width="550" align="right" colspan="3" >
	    	<label><input type="checkbox" value="1" id="secret" ${csDTO.secret == 1? 'checked' : ''} />비밀글</label>&nbsp;
			<input type="button" value="수정하기" id="btn" /> &nbsp; <label id="result"></label>
	    </td>
	</tr>
</table>

<script>
function reload(){
    window.opener.location.reload();
    window.close();
}
</script>

<input type="button" value="창닫기" onclick="reload()" />