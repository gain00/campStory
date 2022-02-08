<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
    
    talk - write
    
<script>
	
	var popupX = (document.body.offsetWidth / 2) - (500/2);
	var popupY = (window.screen.height /2) - (500/2);
	
	function campSearch(){
		url = "/campTalk/campSearch?areaEng=${areaEng}"
		open(url,"캠핑장 검색","width=600,height=400,left="+popupX+",top="+popupY+",scrollbars=yes");
	}

    function campSearchCheck(){
    	var search = document.getElementById("camp").value;
    	var con = document.getElementById("content").value;
    	
    	var radioResult = document.querySelector('input[name="sub"]:checked').value;
     	if(radioResult == "talk"){
     		if(search == ""){
        		alert("캠프명 검색");
        		return false;
        	}
    	} else if(radioResult == "qe"){
    		var areaCheck = document.getElementById("qeArea").value;
    		if (areaCheck==""){
    			alert("지역 선택");
    			return false;
    		}
    		if(search == ""){
    			document.getElementById("contentid").value="7502";
    			document.getElementById("area").value=areaCheck;
    		}
    	}
     	
    	if(con == ""){
    		alert("내용을 입력");
    		return false;
    	}
    }
    
     $(document).ready(function(){
    	$("input[name=sub]").click(function (){
			var subCheck = $(this).val();
			if(subCheck == "talk"){
				document.getElementById("qeInput").style.display="none";				
				$("#camp").attr("placeholder", "");
			}else if(subCheck == "qe"){
				document.getElementById("qeInput").style.display="";
				$("#camp").attr("placeholder", "생략가능");

			}
    	});
    	
    });
</script>    

<form action="/campTalk/talkWritePro" method="post" name="cs" onsubmit="return campSearchCheck()" >
	<table border="1">
		<tr><td colspan="2">
			<input type="radio" name="sub" id="radioTalk" value="talk" checked="checked">톡작성
			<input type="radio" name="sub" id="radioqe" value="qe">질문
		</td></tr>
		
		<tr><td>작성자 : </td>
			<td>
			
			<input type="text" name="writer" id="writer" readonly="readonly" value="${sessionScope.memId}" />
			익명 <input type="checkbox" name="ano" value="ano" >
		</td></tr>
			
		<tbody id="qeInput" style="display:none;">
	 		<tr><td>지역</td> 
			<td><select name="qeArea" id="qeArea" style="width:150px">
				<option value="">지역</option>
				<option value="서울시">서울</option>
				<option value="경기도">경기도</option>
				<option value="인천시">인천</option>
				<option value="강원도">강원</option>
				<option value="충청남도">충남</option>
				<option value="Daejeon">대전</option>
				<option value="충청북도">충북</option>
				<option value="세종시">세종</option>
				<option value="부산시">부산</option>
				<option value="울산시">울산</option>
				<option value="대구시">대구</option>
				<option value="경상북도">경북</option>
				<option value="경상남도">경남</option>
				<option value="전라남도">전남</option>
				<option value="광주시">광주</option>
				<option value="전라북도">전북</option>
				<option value="제주도">제주</option>
			</select></td></tr>
		</tbody>
		
		<tr><td>캠핑장 : </td>
			<td> 
			<input type="text" name="camp" id="camp" readonly="readonly" onclick="campSearch()" />
			<input type="hidden" name="contentid" id="contentid" />
			<input type="hidden" name="area" id="area"/>
			<input type="button" value="검색" onclick="campSearch()"/> 
		</td></tr>
			
		<tr><td>내용 : </td>
			<td> <input type="text" name="content" id="content"/> </td></tr>
			<tr><td colspan="2">
			<input type="submit" value="작성" />	
			<input type="button" value="취소" onclick="history.go(-1)"/>
		</td></tr>
	</table>
</form>
    
    