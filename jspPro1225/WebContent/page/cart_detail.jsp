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
  <h2>상품정보</h2>
<table>
 <tr>
  <td><img src="${path}/images/${dto.picture_url}" 
  width="300px" height="300px"></td>
  <td align="center">
    <table>
      <tr>
        <td>상품명</td>
        <td>${dto.product_name}</td>
      </tr>
      <tr>
        <td>가격</td>
        <td>${dto.price}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>${dto.description}</td>
      </tr>
      <tr>
        <td colspan="2">
          <form name="form1" method="post" 
            action="${path}/shop/cart/insert.do">
            <input type="hidden" name="product_id" 
            value="${dto.product_id}">
            <select name="amount">
             <c:forEach begin="1" end="10" var="i">
               <option value="${i}">${i}</option>
             </c:forEach>
            </select>
            <input type="submit" value="장바구니에 담기">  
          </form>
        </td>
      </tr>
    </table>
  </td>
 </tr>
</table>
 </div>
 <!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>

</div>
</body>
</html>