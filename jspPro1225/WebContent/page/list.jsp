<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매료 팩토리</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/page/write.jsp";
	});
	$("#btnSearch").click(function(){
        var keyword=$("#keyword").val();
		if(keyword == ""){
			alert("검색어를 입력하세요.");
			$("#keyword").focus();
			return;
		}
			document.form1.submit();

	});
	$(".btnOut").click(function(){
		alert("로그인후 이용가능합니다.");
	});
});
function list(page){
	location.href="${path}/home_servlet/list.do?curPage="+page;
}
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

<div id="context" style="height: 100%;">
<h2>상품후기 게시판</h2>
<hr>
<form name="form1" method="post" action="${path}/home_servlet/search.do">
 <select name="search_option">
  <option value="userid">작성자</option>
  <option value="subject">제목</option>
  <option value="content">내용</option>
  <option value="all">작성자+제목+내용</option>
 </select>
 <input name="keyword" id="keyword">
 <button  type="button" id="btnSearch" class="btn btn-secondary">검색</button>
 <c:if test="${sessionScope.userid == null}">
 <button  type="button" class="btnOut" style="float:right;" class="btn btn-secondary">글쓰기</button>
 </c:if>
 <c:if test="${sessionScope.userid != null}">
 <button  type="button" id="btnWrite" style="float:right;" class="btn btn-secondary">글쓰기</button>
 </c:if>
</form>



<table class="table table-bordered">
 <tr>
   <th>번호</th>
   <th>작성자</th>
   <th>제목</th>
   <th>날짜</th>
   <th>조회수</th>
   <th>첨부파일</th>
   <th>다운로드</th>
 </tr>
 <c:forEach var="dto" items="${list}">
   <c:choose> 
     <c:when test="${dto.show == 'y'}">
 <tr>
   <td>${dto.num}</td>
   <td>${dto.userid}</td>
   <td>
     <!-- 답글 들여쓰기 -->
     <c:forEach var="i" begin="1" end="${dto.re_level}">
       &nbsp;&nbsp;
     </c:forEach>
     
     <c:if test="${sessionScope.userid != null }">
   <a href="${path}/home_servlet/view.do?num=${dto.num}">
   ${dto.subject}</a>
   </c:if>
   <c:if test="${sessionScope.userid == null }">
   <a href="#" class="btnOut">
   ${dto.subject}</a>
   </c:if>
   
   <!-- 댓글갯수 표시 -->
   <c:if test="${dto.comment_count > 0}">
     <span style="color:red;">(${dto.comment_count})</span>
   </c:if>
   </td>
   <td>${dto.reg_date}</td>
   <td>${dto.readcount}</td>
   <td align="center">
     <c:if test="${dto.filesize > 0 }">
      <a href="${path}/home_servlet/download.do?num=${dto.num}">
       <img src="../images/file.gif">
      </a> 
     </c:if>
   </td>
   <%-- <td>${dto.filename}</td> --%>
   <td>${dto.down}</td>
 </tr>
 </c:when>
 <c:otherwise>
   <tr>
     <td>${dto.num}</td>
     <td colspan="6" align="center">
     삭제된 게시물입니다.
     </td>
   </tr>
 </c:otherwise>
   </c:choose>
 </c:forEach>
 <!-- 페이지 네비게이션 출력 -->
 <tr>
   <td colspan="7" align="center">
     <c:if test="${page.curPage > 1}">
       <a href="#" onclick="list('1')">[처음]</a>
     </c:if>
     <c:if test="${page.curBlock > 1 }">
       <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
     </c:if>
     <c:forEach var="num" begin="${page.blockStart}" 
       end="${page.blockEnd}">
       <c:choose>
         <c:when test="${num == page.curPage}">
           <span style="color:red;">${num}</span>
         </c:when>
         <c:otherwise>
           <a href="#" onclick="list('${num}')">${num}</a>
         </c:otherwise>
       </c:choose>
     </c:forEach>
     <c:if test="${page.curBlock < page.totBlock}">
       <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
     </c:if>
     <c:if test="${page.curPage < page.totPage }">
       <a href="#" onclick="list('${page.totPage}')">[끝]</a>
     </c:if>
   </td>
 </tr>
</table>
</div>

<!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>
 </div>
</body>
</html>