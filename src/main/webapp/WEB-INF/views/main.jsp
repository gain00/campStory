<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>CampStory 메인페이지</title>
    

</head>
<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
	$("#searchbtn").click(function(){

        if($("#searchbar").val() == '' ||$("#searchbar").val() == null  ||$("#searchbar").val() == 'undefied' ||$("#searchbar").val() == 'NaN' ||$("#searchbar").val() == ' '){
            alert("검색어를 입력하십시오.");
            return false;
        
        }else{    
        	window.location="/camp/klist?keyword="+$("#searchbar").val();
        	
        }
    });
	});
	
	 </script>
<body>
<%@ include file = "include/header.jsp" %>
    <div class="main_intro">
    	<br/>
       <div class="introbox" id="intbox">캠핑을 위한 모든 이야기<br/>Camp Story
       
       
       </div>
       <br/>
       <div class ="search_keyword" id="mainsearch">
	<form action="camp/klist" method="get">
		<input type="text" id="searchbar" name="keyword" placeholder="지역명 / 캠핑장 명을 검색 해 주세요"/>
		<input type="image" src="../resources/camp/images/search.png" id = "searchbtn" value="submit" name="submit" />
	</form>
	<div id="kwordList">
		<c:forEach var="keywordlist" items="${keywordlist }" begin="0" end="4" step="1">
		<a href = "/camp/klist?keyword=${keywordlist.keyword}" class="mainkeyword"># ${keywordlist.keyword}</a>
		</c:forEach>
	
	</div>
	</div>
       <div id="mainlogo">
       <img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="300px" height="250px" />
       </div>

    </div>
    
    <div class="camp_rank">
    	<div class="goodcamp">
    		<div class="rank_text">
    		<p class ="rank_p">좋아요가 많은 캠핑장</p>
    		<p class ="rankmore"><a href="/camp/list?sorter=good">더보기 ></a> </p>
    		</div>
    		<c:forEach items="${goodlist}" var="campDTO">
				<div class="main_listinfo">
					<c:if test="${campDTO.firstimageurl == '0'}">
				        <img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="100px" height="100px"/>
				     </c:if>
				            
				     <c:if test="${campDTO.firstimageurl != '0' }">
				        <img src= "${campDTO.firstimageurl }" width="100px" height="100px" /><br/>
				     </c:if>
				     
				 <div class="main_infocard">
					<a href="/camp/readcount?contentid=${campDTO.contentid }&pageNum=${pageNum}" class="main_camp_name">
				       ${campDTO.facltnm }</a>
				            
				            </div>
				            </div>
						</c:forEach>
		        
    	</div>
    	<div class="rcountcamp">
    		<div class="rank_text">
    		<p class ="rank_p">조회수가 높은 캠핑장</p>
    		<p class ="rankmore"> <a href="/camp/list?sorter=readcount">더보기 ></a></p>
    		</div>
    		<c:forEach items="${rcountlist}" var="campDTO">
				<div class="main_listinfo">
					<c:if test="${campDTO.firstimageurl == '0'}">
				        <img src="https://i.ibb.co/G2kJKb2/logo-campstory.png" width="100px" height="100px"/>
				     </c:if>
				            
				     <c:if test="${campDTO.firstimageurl != '0' }">
				        <img src= "${campDTO.firstimageurl }" width="100px" height="100px" /><br/>
				     </c:if>
				     
				 <div class="main_infocard">
					<a href="/camp/readcount?contentid=${campDTO.contentid }&pageNum=${pageNum}" class="main_camp_name">
				       ${campDTO.facltnm }</a>
				            
				            </div>
				            </div>
						</c:forEach>
		        </div>
    	</div>
    	
    
	

</body>
</html>