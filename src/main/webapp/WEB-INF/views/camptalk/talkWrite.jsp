<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    talk - write
    
    
<form action="/campTalk/talkWritePro" method="post" name="cs">
	<table border="1">

		<tr><td>캠핑장 : </td><td> 
		<input type="text" name="camp" id="camp" readonly="readonly" onclick="campSearch()" />
		<input type="hidden" name="area" id="area"/> 
		<input type="button" value="검색" onclick="campSearch()"/> </td></tr>
		<tr><td>내용 : </td><td> <input type="text" name="content" /> </td></tr>
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
		open(url,"캠핑장 검색","width=600,height=400,left="+popupX+",top="+popupY);
	}

</script>

    
    