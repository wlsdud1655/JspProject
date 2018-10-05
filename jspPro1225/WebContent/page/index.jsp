<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매료 팩토리</title>
<%@ include file="../include/header.jsp" %>
<style>
 body{
  margin: auto;
  vertical-align: middle;
  text-align: center;
 }
#page{	
 margin: auto;
 vertical-align: middle;
 text-align: center;
 width: 100%;
 height: 100%;
}
#context .img{
 width:60%;
 height:100%;
 float: left;
}
</style>
</head>
<body>
<div id="page">

 <!-- header 태그 -->
 <%@ include file="../include/headers.jsp" %>
 
 <!-- menu 태그 -->
 <%@ include file="../include/menu.jsp" %>
 
 <div id="context" style="height: 575px">
  <img src="images/song.gif" class="img">
 </div>
 <!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>

</div>
</body>
</html>