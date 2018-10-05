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
<script type="text/javascript">
$(function(){
	$("#btnBaguny").click(function(){
		btnBaguny();
	});
	$("#btnChkd").click(function(){
		btnChkd();
	});
});
function btnBaguny(){
	location.href="${path}/home_servlet/baguny.do";
}
function btnChkd(){
	alert("로그인후 이용가능합니다.");
}
</script>
</head>
<body>
<div id="page">

  <!-- header 태그 -->
 <%@ include file="../include/headers.jsp" %>
 
 <!-- menu 태그 -->
 <%@ include file="../include/menu.jsp" %>
 
 <div id="context" style="height: 575px">
  <form method="post" action="${path}/home_servlet/gumae.do" name="form1">
  <table class="table table-hover" style="width: 60%;">
   <tr>
    <td>제품명</td>
    <td>가격</td>
   </tr>
   <c:forEach var="i" items="${badiList}">
    <tr>
     <td>${i.name}</td>
     <td>${i.price}원</td>
    </tr>
   </c:forEach>
   <tr>
   <c:if test="${sessionScope.userid != null }">
   <td colspan="3"><input type="button" value="제품구매 하러가기" id="btnBaguny" class="btn btn-default"></td>
   </c:if>
   <c:if test="${sessionScope.userid == null }">
   <td colspan="3"><input type="button" value="제품구매" id="btnChkd" class="btn btn-default"></td>
   </c:if>
   </tr>
  </table>
  </form>
 </div>
 
  <!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>

</div>
</body>
</html>