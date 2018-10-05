<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnLogout").click(function(){
		if(confirm("로그아웃 하시겠습니까?")){
		location.href="${path}/home_servlet/logout.do";
		alert("로그아웃 되었습니다.");
		}
	});
	$("#btnChk").click(function(){
		alert("로그인후 이용가능합니다.");
	});
});
</script>
<style>
#header a{
color: black;
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
</style>
<div id="header">
 
  <a href="${path}/page/loginPage.jsp" class="menuone">
   <c:if test="${sessionScope.userid == null}">
   로그인
   </c:if>
   </a>
   <a href="#" class="menuone">
   <c:if test="${sessionScope.userid != null}">
  ${sessionScope.userid}님
   </c:if>
  </a>
  
  <a href="${path}/page/hoewonPage.jsp" class="menuone">
  <c:if test="${sessionScope.userid == null}">
  회원가입
  </c:if>
  </a>
  <a href="${path}/home_servlet/edit.do" class="menuone">
  <c:if test="${sessionScope.userid != null}">
  마이페이지
  </c:if>
  </a>
  
  <c:if test="${sessionScope.userid != null}">
  <a href="${path}/home_servlet/baguny.do" class="menuone">제품구매</a>
  </c:if>
  <c:if test="${sessionScope.userid == null}">
  <a href="#" id="btnChk" class="menuone">제품구매</a>
  </c:if>
  
  <%-- <a href="#" class="menuone">
  <c:if test="${sessionScope.userid == null}">
  출석체크
  </c:if>
  </a> --%>
  <a href="#" class="menuone" id="btnLogout">
  <c:if test="${sessionScope.userid != null}">
  로그아웃
  </c:if>
  </a>
  
  <a href="${path}/home_servlet/list.do">게시판</a>
  
  <div>
  <a class="logo" href="${path}/page/index.jsp">매료팩토리 </a>
  </div>
 </div>