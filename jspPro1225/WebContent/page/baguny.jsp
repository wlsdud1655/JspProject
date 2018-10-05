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
<%
int num=0;
%>
<script type="text/javascript">
$(function(){

	$("#btnGumea").click(function(){
		
		var toto=document.getElementById("total");
		if(toto.value == 0 || toto.value == null || toto.value == ""){
			alert("구매하실 물품을 체크해주세요.");
		}else{
			if(confirm("구매하시겠습니까?")){
				alert("구매가 완료되었습니다.");
				location.href="${path}/page/index.jsp";
			}
		}
		
	});
	$(".click").click(function(){
		var ex = Number(document.getElementById("total").defaultValue);
		for(var i=1; i<=33; i++) {
			var object = document.getElementById("check"+i);
			if(object.checked) {
				ex += Number(object.value);
			}
		}
		document.getElementById("total").value = ex;
	});
	$("#btnNull").click(function(){
		alert("로그인후 이용가능합니다.");
		/* location.href="${path}/page/loginPage.jsp"; */
	});
});

</script>
</head>
<body>

<div id="page">

 <!-- header 태그 -->
 <%@ include file="../include/headers.jsp" %>
 
 <!-- menu 태그 -->
 <%@ include file="../include/menu.jsp" %>
 
 <div id="context">
 
 <form method="post" action="${path}/home_servlet/gumae.do" name="form1">
  <table class="table table-hover" style="width: 60%;">
   <tr>
    <td>제품명</td>
    <td>가격</td>
    <td></td>
   </tr>
   <c:forEach var="i" items="${bagunyList}">
    <tr>
     <td>${i.name}</td>
     <td>${i.price}원</td>
     <td><input type="checkbox" id="check<%=++num%>" name="check<%=num%>" value="${i.price}" class="click"></td>
    </tr>
   </c:forEach>
   <tr>
    <td>총금액</td>
    <td colspan="2"><input type="text" name="total" id="total" value="0"  readonly>
    </td>
   </tr>
   <tr>
   <c:if test="${sessionScope.userid != null}">
   <td colspan="3"><input type="button" value="구매하기" id="btnGumea" class="btn btn-default"></td>
   </c:if>
   <c:if test="${sessionScope.userid == null}">
   <td colspan="3"><input type="button" value="구매하기" id="btnNull" class="btn btn-default"></td>
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