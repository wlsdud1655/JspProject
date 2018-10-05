<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
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
</style>
<div id="Menu">
  <b>카테고리</b><br>
  <a href="${path}/home_servlet/Mouth.do">구강제품</a><br>
  <a href="${path}/home_servlet/Myeondo.do">제모제품</a><br>
  <a href="${path}/home_servlet/Sean.do">세안제품</a><br>
  <a href="${path}/home_servlet/Badi.do">바디워시</a><br>
  <a href="${path}/home_servlet/Syampu.do">샴푸</a><br>
  <a href="${path}/home_servlet/Yuyeonje.do">섬유유연제</a><br>
 </div>