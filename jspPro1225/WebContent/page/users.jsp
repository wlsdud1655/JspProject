<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
</head>
<body>
<c:if test="${message == '사용 가능한 아이디입니다.' }">
<b style="color: blue;">${message}</b>
</c:if>
<c:if test="${message == '중복된 아이디가 있습니다.' }">
<b style="color: red;">${message}</b>
</c:if>
</body>
</html>