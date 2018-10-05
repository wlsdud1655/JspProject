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
	$("#btnSave").click(function(){
		var passwd=$("#passwd").val();
		if(passwd == null || passwd == ""){
			alert("비밀번호를 입력하세요");
			$("#passwd").focus();
			return;
		}
		document.form1.submit();
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
<h2>답변쓰기</h2>
<form name="form1" method="post" 
action="${path}/home_servlet/insertReply.do">
<table class="table table-bordered">
  <tr>
    <td>작성자</td>
    <td><input name="userid" id="userid" class="form-control" value="${sessionScope.userid}" readonly></td>
  </tr>
  <tr>
    <td>제목</td>
    <td><input name="subject" id="subject" 
     value="Re: ${dto.subject}" size="60" class="form-control"></td>
  </tr>
  <tr>
    <td>본문</td>
    <td><textarea rows="5" cols="60" 
    name="content" id="content" class="form-control">${dto.content}</textarea></td>    
  </tr>
  <tr>
    <td>첨부파일</td>
    <td><input type="file" name="file1"></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td>
    <input type="password" name="passwd" id="passwd" class="form-control">
     <c:if test="${param.message == 'error' }">
        <span style="color:red">
          비밀번호가 일치하지 않습니다.
        </span>
      </c:if>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <!-- 게시물 번호 -->
      <input type="hidden" name="num" value="${dto.num}">
      <input type="button" value="확인" id="btnSave" class="btn btn-secondary">
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