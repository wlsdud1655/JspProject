<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매료 팩토리</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		if(confirm("회원정보를 수정하시겠습니까?")){
		document.form1.action="${path}/home_servlet/memberUpdate.do";
		document.form1.submit();
		}
	});
	$("#btnDelete").click(function(){
		if(confirm("회원탈퇴를 하시겠습니까?")){
			document.form1.action="${path}/home_servlet/memberDelete.do";
			document.form1.submit();
		}
	});
});
</script>
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
 
 <div id="context" style="height: 750px">
 <form name="form1" method="post">
  <table class="table table-hover" style="width: 60%;">
   <tr>
    <td colspan="2"><b>회원정보</b></td>
   </tr>
   <tr>
    <td>아이디</td>
    <td>${memberWrite.userid}</td>
   </tr>
   <tr>
    <td>비밀번호</td>
    <td><input type="password" name="passwd" id="passwd" value="${memberWrite.passwd}" class="form-control"></td>
   </tr>
   <tr>
    <td>이름</td>
    <td>${memberWrite.name}</td>
   </tr>
   <tr>
    <td>주민번호</td>
    <td>${memberWrite.jumin}</td>
   </tr>
   <tr>
    <td>이메일</td>
    <td><input name="email" id="email" value="${memberWrite.email}" class="form-control"></td>
   </tr>
   <tr>
    <td>연락처</td>
    <td><input name="hp" id="hp" value="${memberWrite.hp}" class="form-control"></td>
   </tr>
   <tr>
    <td>주소</td>
    <td><input name="juso" id="juso" value="${memberWrite.juso}" class="form-control"></td>
   </tr>
   <tr>
    <td colspan="2">
     <button class="btn btn-default" type="button" id="btnUpdate">회원정보 수정</button>
     <button class="btn btn-default" type="button" id="btnDelete">회원탈퇴</button>
    </td>
   </tr>
  </table>
  </form>
 </div>
 <!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>

</div>
</body>
</html>