<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/home_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/home_servlet/delete.do";
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
#context{
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

<div id="context" style="height: 575px;">
<h2>수정/삭제</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table class="table table-bordered">
  <tr>
    <td>작성자</td>
    <td><input name="userid" id="userid" 
       value="${dto.userid}" class="form-control" readonly></td>
  </tr>
  <tr>
    <td>제목</td>
    <td><input name="subject" id="subject" size="60"
       value="${dto.subject}" class="form-control"></td>
  </tr>
  <tr>
    <td>본문</td>
    <td><textarea rows="5" cols="60" 
    name="content" id="content"  class="form-control">${dto.content}</textarea></td>
  </tr>
  <tr>
    <td>첨부파일</td>
    <td>
      <c:if test="${dto.filesize > 0}">
        ${dto.filename} (${dto.filesize / 1024} KB )
        <input type="checkbox" name="fileDel">첨부파일 삭제
        <br>
      </c:if>
    <input type="file" name="file1"></td>
  </tr>
  <!-- <tr>
    <td>비밀번호</td>
    <td><input type="password" name="passwd" id="passwd" class="form-control"></td>
  </tr> -->
  <tr>
    <td colspan="2" align="center">
    <!-- 수정,삭제를 위한 글번호 -->
      <input type="hidden" name="num" value="${dto.num}">
      <input type="button" value="수정" id="btnUpdate" class="btn btn-secondary">
      <input type="button" value="삭제" id="btnDelete" class="btn btn-secondary">
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