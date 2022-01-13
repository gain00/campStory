<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
campTalk - campSearch

<table border="1" class="ta">
	<tr>
		<td> 
			<select name="area" id="area">
				<option value="all">지역</option>
				<option value="Seoul">서울</option>
				<option value="Gyeonggi">경기도</option>
				<option value="Incheon">인천</option>
				<option value="Gangwon">강원</option>
				<option value="Chungcheongnam">충남</option>
				<option value="Daejeon">대전</option>
				<option value="Chungbuk">충북</option>
				<option value="Sejong">세종</option>
				<option value="Busan">부산</option>
				<option value="Ulsan">울산</option>
				<option value="Deagu">대구</option>
				<option value="Gyeongbuk">경북</option>
				<option value="Gyeongsangnam">경남</option>
				<option value="Jeonnam">전남</option>
				<option value="Gwangju">광주</option>
				<option value="Jeonbuk">전북</option>
				<option value="Jeju">제주</option>
			</select>
		</td>
	<td><input type="text" id="camp"/></td>
	<td><input type="button" value="검색" id="btn_campS"/></td>
	</tr>
</table>

<script>
	$(document).ready(function(){
		$("#btn_campS").click(function(){
			$.ajax({
				type: "post",
				url: "/campTalk/campSearchList",
				data: {camp:$("#camp").val(), area:$("#area").val() },
				success: function(data){
					$(".ta").find("tr:gt(0)").remove();
					var aa = new Array();
					for(var i = 0; i < data.length; i++){
						
						aa[i] = data[i];
						$('.ta').append("<tr><td colspan='3'><a href='#' class='qwer'>"+data[i]+"</a></td></tr>");
					}
					$(".qwer").click(function(){
						var $td = $(this).closest('tr').children('td');
						var part_name = $td.eq(0).text();
						opener.document.cs.camp.value=part_name;
						opener.document.cs.area.value=$("#area").val();
						self.close();
					});
				}
			});
		});
	});
</script>