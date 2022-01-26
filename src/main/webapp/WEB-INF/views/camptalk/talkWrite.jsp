<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    talk - write
    
<script>
    function campSearchCheck(){
    	var search = document.getElementById("camp").value;
    	var con = document.getElementById("content").value;
    	if(search == ""){
    		alert("캠프명 검색");
    		return false;
    	}
    	if(con == ""){
    		alert("내용을 입력");
    		return false;
    	}
    	
    }
    
</script>    


<form action="/campTalk/talkWritePro" method="post" name="cs" onsubmit="return campSearchCheck()" >
	<table border="1">
		<tr><td colspan="2">
		<input type="radio" name="sub" value="talk" checked="checked">톡작성
		<input type="radio" name="sub" value="qe">질문
		</td></tr>
		<tr><td>작성자 : </td>
		<td>
		<input type="text" name="writer" id="writer" readonly="readonly" value="${id}" />
		익명 <input type="checkbox" name="ano" value="ano" >
		</td>
		<tr><td>캠핑장 : </td><td> 
		<input type="text" name="camp" id="camp" readonly="readonly" onclick="campSearch()" />
		<input type="hidden" name="contentid" id="contentid" />
		<input type="hidden" name="area" id="area" />
		<input type="button" value="검색" onclick="campSearch()"/> </td></tr>
		<tr><td>내용 : </td><td> <input type="text" name="content" id="content"/> </td></tr>
		<tr><td colspan="2">
		<input type="submit" value="작성" />	<input type="button" value="취소" onclick="history.go(-1)"/>
		</td></tr>
	</table>
</form>

<script>
	var popupX = (document.body.offsetWidth / 2) - (500/2);
	var popupY = (window.screen.height /2) - (500/2);

	function campSearch(){
		url = "/campTalk/campSearch"
		open(url,"캠핑장 검색","width=600,height=400,left="+popupX+",top="+popupY+",scrollbars=yes");
	}

</script>

    
    