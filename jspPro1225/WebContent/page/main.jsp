<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매료 팩토리</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>
<style>
 body{
  margin: auto;
  vertical-align: middle;
  text-align: center;
 }
#page{
 width: 100%;
 height: 100%;
}
#header .menuone{
 float: inherit;
}
#header .logo{
    font-size: 4em;
	text-shadow: 3px 3px 2px black;
	font-family: "궁서";
	font-weight: bolder;
	color: black;
	text-decoration: none;
}
#Menu{
	font-size: 2em;
	vertical-align: middle;
	text-align: center;
	float: left;
	width: 20%;
}
#Menu a{
	vertical-align: middle;
	text-align: center;
	text-decoration: none;
	color: black;
	font-size: 1.1em;
}
#Menu a:HOVER {
	text-decoration: underline;
	opacity: 0.7;
}
#context .img{
 width:60%;
 height:100%;
 float: left;
}
#footer {
	text-align: center;
	clear: both;
	background-color: gray;
}
#footer li {
	list-style-type: none;
	color: white;
}
#footer ul {
	vertical-align: top;
	display: inline-block;
}
.style1 {
	font-size: 2em;
	font-weight: bolder;
}
.ba1, .ba2, .ba3 {
	font-weight: bolder;
}
.style2 {
	font-size: 1.2em;
	font-weight: bolder;
}
#ling:VISITED{
 color: white;
 text-decoration: none;
}
#ling{
 text-decoration: none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/home_servlet/logout.do";
	});
});
</script>
</head>
<body>
<div id="page">

 <div id="header">
  <a href="#" class="menuone">${sessionScope.userid}님</a>
  <a href="#" class="menuone">장바구니</a>
  <a href="#" class="menuone">출석체크</a>
  <a href="#" class="menuone" id="btnLogout">로그아웃</a>
  <div>
  <a class="logo" href="#">매료팩토리</a>
  </div>
 </div>
 
 <div id="Menu">
  <b>카테고리</b><br>
  <a href="#">치약 / 칫솔</a><br>
  <a href="#">바디워시</a><br>
  <a href="#">바디로션</a><br>
  <a href="#">선케어</a><br>
 </div>
 
 <div id="context">
  <img src="images/song.gif" class="img">
 </div>
 
 <div id="footer">

		<ul class="ba1">
			<li class="style1">BANK</li>
			<li class="style2">계좌</li>
			<br>
			<li>농협 317-6677-6677-11</li>
			<li>국민 96677-667751</li>
			<li>우체국 400010-02-890732</li>
			<li>우리 1005-593-667788</li>
			<li>예금주 : (주)매료팩토리</li>
		</ul>
		<ul class="ba2">
			<li class="style1">Q/A</li>
			<li class="style2">고객센터</li>
			<br>
			<li>1688-1360</li>
			<li>WEEK 10:00 ~ 17:00</li>
			<li>LUNCH 12:00 ~ 13:00</li>
			<li>- 주말,공휴일은 휴무입니다.</li>
			<li>- 통화량 폭주로 전화연결이 안 될 경우,</li>
			<li>게시판에 문의를 남겨주시면</li>
			<li>빠른처리 해드리겠습니다.</li>
		</ul>
		<ul class="ba3">
			<li class="style1">RETURN</li>
			<li class="style2"><a id ="ling" href="#">교환 / 반품 정책 확인 ▶</a></li>
			<br>
			<li>전북 전주시 덕진구 백제대로 714</li>
			<li>동전주 우체국 물류센터</li>
			<li>매료팩토리 앞</li>
		</ul>

	</div>

</div>
</body>
</html>