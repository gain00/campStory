<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<% String map = "/resources/campTalk/map/"; %>
<section id="contents" class="clearfix">
	<div class="webtong_map">
		<img src="/resources/campTalk/map/map00.png" alt="한반도지도" id="map_change" usemap="#webtong_Map" />
	</div>
	<map name="webtong_Map">
		<area shape="poly" coords="80,94,102,84,106,103,85,109"
		href="javascript:void(0);" onmouseover="mapimg('map01.png');" onmouseout="mapimg('map00.png');" onfocus="areaS('Seoul');"/>
		<area shape="poly" coords="107,38,141,68,134,94,154,100,146,132,116,152,79,152,71,114,80,100,87,111,108,106,104,80,81,91,64,92,65,79"
		href="javascript:void(0);" alt="경기도" onmouseover="return mapimg('map02.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Gyeonggi');"/>
		<area shape="poly" coords="48,76,62,80,62,94,79,95,70,110,57,102"
		href="javascript:void(0)" alt="인천" onmouseover="return mapimg('map03.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Incheon');"/>
		<area shape="poly" coords="109,35,143,66,136,92,157,98,149,132,214,144,267,137,196,8"
		href="javascript:void(0)" alt="강원도" onmouseover="return mapimg('map04.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Gangwon');"/>
		<area shape="poly" coords="147,134,211,147,194,167,152,181,168,219,158,233,139,232,132,195,113,177,123,166,115,156"
		href="javascript:void(0)" alt="충청북도" onmouseover="return mapimg('map05.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Chungbuk');"/>
		<area shape="poly" coords="113,155,74,154,50,147,33,166,51,181,65,232,94,220,97,229,115,227,125,237,136,232,131,217,112,217,100,175,109,173,113,176,119,167"
		href="javascript:void(0)" alt="충청남도" onmouseover="return mapimg('map06.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Chungcheongnam');"/>
		<area shape="poly" coords="111,203,120,189,112,176,102,176"
		href="javascript:void(0)" alt="세종시" onmouseover="return mapimg('map07.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Sejong');"/>
		<area shape="poly" coords="123,190,111,206,113,216,132,216,131,197"
		href="javascript:void(0)" alt="대전" onmouseover="return mapimg('map08.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Daejeon');"/>
		<area shape="poly" coords="267,141,213,148,197,167,156,182,172,220,157,238,181,267,191,268,196,250,189,245,216,232,225,241,220,262,206,265,216,273,241,272,245,262,271,266"
		href="javascript:void(0)" alt="경상북도" onmouseover="return mapimg('map09.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Gyeongbuk');"/>
		<area shape="poly" coords="215,235,194,246,198,252,193,270,205,266,217,260,221,244"
		href="javascript:void(0)" alt="대구" onmouseover="return mapimg('map10.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Deagu');"/>
		<area shape="poly" coords="156,244,177,268,193,273,208,269,215,276,240,277,257,291,218,319,150,334,134,296,140,257"
		href="javascript:void(0)" alt="경상남도" onmouseover="return mapimg('map11.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Gyeongsangnam');"/>
		<area shape="poly" coords="248,264,271,270,263,294,241,276"
		href="javascript:void(0)" alt="울산" onmouseover="return mapimg('map12.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Ulsan');"/>
		<area shape="poly" coords="256,293,221,320,239,322,257,310,261,298"
		href="javascript:void(0)" alt="부산" onmouseover="return mapimg('map13.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Busan');"/>
		<area shape="poly" coords="63,235,93,225,96,232,114,230,124,240,137,235,155,235,155,244,139,257,132,294,95,293,81,280,54,293,48,282"
		href="javascript:void(0)" alt="전라북도" onmouseover="return mapimg('map14.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Jeonbuk');"/>
		<area shape="poly" coords="46,284,23,374,51,382,146,334,131,298,92,297,85,310,66,307,68,294,90,291,79,283,54,296"
		href="javascript:void(0)" alt="전라남도" onmouseover="return mapimg('map15.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Jeonnam');"/>
		<area shape="poly" coords="70,296,68,307,83,308,91,295"
		href="javascript:void(0)" alt="광주" onmouseover="return mapimg('map16.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Gwangju');"/>
		<area shape="poly" coords="38,419,65,404,82,412,61,427,41,420"
		href="javascript:void(0)" alt="제주도" onmouseover="return mapimg('map17.png');" onmouseout="return mapimg('map00.png');" onfocus="areaS('Jeju');"/>

	</map>
</section>

<input type="button" value="닫기" onclick="javascript:window.close()">
<script>
	function mapimg(img) {
		$('#map_change').attr('src','<%=map%>' + img);
	}
	
	function areaS(area) {
		var campS = "${campS}";
		$("map[name=webtong_Map] area").on("click focus", function() {
			opener.location.replace("/campTalk/talkList?listType="+${listType}+"&campS="+campS+"&areaEng="+area);
			self.close();
		});
	}
</script>











