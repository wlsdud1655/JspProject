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
	$("#btnInsert").click(function(){
		 ok();
	});
	$("#btnEsc").click(function(){
		no();
	});
	$("#btnData").click(function(){
		var param="userid="+$("#userid").val();
		var userid=$("#userid").val();
		var exp1 = /^[a-zA-Z0-9]{6,16}$/;
		
		
		if(userid == null || userid == ""){
			alert("아이디를 입력하세요.");
			userid.focus();
			return;
		}
		 if(!exp1.test(userid)){
			 alert("아이디는 영문자,숫자 6~16자리로 입력하세요.");
			 userid.focus();
			 return;
		 }
		$.ajax({
			type: "post",
			url: "${path}/home_servlet/userid_check.do",
			data: param,
			success: function(result){
				  $("#panal").html(result);
			}
		});
		
		/* document.form1.action="${path}/home_servlet/userid_check.do";
		document.form1.submit(); */
	});
});
function passwdCheck(){
	var passwd=$("#passwd").val();
	 
	 var exp2 = /^[a-zA-z0-9]{8,}$/;
	 if(!exp2.test(passwd)){
	     document.getElementById("passwdCheck").innerHTML = "영문자,숫자 8자리이상으로 입력하세요.";
		 return;
	 }
	 if(exp2.test(passwd)){
	     document.getElementById("passwdCheck").innerHTML = "유효한 비밀번호입니다.";
		 return;
	 }
}
function passwd1Check(){
	var passwd=$("#passwd").val();
	var passwd1=$("#passwd1").val();
	
	if(passwd == passwd1){
		document.getElementById("passwd1Check").innerHTML = "비밀번호가 일치합니다.";
	}
	if(passwd != passwd1){
		document.getElementById("passwd1Check").innerHTML = "비밀번호가 틀립니다.";
	}
	
}
function nameCheck(){
	var name=$("#name").val();
	var exp5=/^[가-힣\x20]{2,10}$/;
	  if(!exp5.test(name)){
		  document.getElementById("nameCheck").innerHTML = "한글 2~10자 이내로  입력하세요.";
	  }
	  if(exp5.test(name)){
		  document.getElementById("nameCheck").innerHTML = "유효한 이름입니다.";
	  }
}
function juminCheck(){
	var jumin=$("#jumin").val();
	var exp6=/^[0-9]{6}-[1-4]{1}[0-9]{6}$/;
	  if(!exp6.test(jumin)){
		  document.getElementById("juminCheck").innerHTML = "주민번호를 정확히 입력하세요.";
	  }
	  if(exp6.test(jumin)){
		  document.getElementById("juminCheck").innerHTML = "유효한 주민번호입니다.";
	  }
}
function emailCheck(){
	var email=$("#email").val();
	var exp4=/^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	  if(!exp4.test(email)){
		  document.getElementById("emailCheck").innerHTML = "이메일 형식이 잘못 되었습니다.";
	  }
	  if(exp4.test(email)){
		  document.getElementById("emailCheck").innerHTML = "유효한 이메일입니다.";
	  }
}
function hpCheck(){
	var hp=$("#hp").val();
	 var exp7=/^[0]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}$/;
	  if(!exp7.test(hp)){
		  document.getElementById("hpCheck").innerHTML = "연락처 형식이 잘못 되었습니다.";
	  }
	  if(exp7.test(hp)){
		  document.getElementById("hpCheck").innerHTML = "유효한 연락처입니다.";
	  }
}
function jusoCheck(){
	var juso=$("#juso").val();
	var exp5=/^[가-힣\x20]{2,}$/;
	  if(!exp5.test(juso)){
		  document.getElementById("jusoCheck").innerHTML = "한글 2글자 이상입력하세요.";
	  }
	  if(exp5.test(juso)){
		  document.getElementById("jusoCheck").innerHTML = "유효한 주소입니다.";
	  }
}
function ok(){
	 //아이디
	 var userid = document.getElementById("userid");
	 if(userid.value == ""){
		 alert("아이디를 입력해주세요.");
		 userid.focus();
		 return;
	 }
	 var exp1 = /^[a-zA-Z0-9]{6,16}$/;
	 if(!exp1.test(userid.value)){
		 alert("아이디는 영문자,숫자 6~16자리로 입력하세요.");
		 userid.focus();
		 return;
	 }
	 //비밀번호
	 var passwd = document.getElementById("passwd");
	 if(passwd.value == ""){
		 alert("비밀번호를 입력해주세요.");
		 passwd.focus();
		 return;
	 }
	 var exp2 = /^[a-zA-z0-9]{8,}$/
	 if(!exp2.test(passwd.value)){
		 alert("비밀번호는 영문자,숫자 8자리이상으로 입력하세요.");
		 passwd.focus();
		 return;
	 }
	 //비밀번호 확인
	 var passwd1=document.getElementById("passwd1");

	  if(passwd.value != passwd1.value){
		 alert("비밀번호를 다시 확인해주세요");
		 passwd1.focus();
		 return;
	 }
	  //이름
	  var name= document.getElementById("name");
	  if(name.value == ""){
		  alert("이름을 입력해주세요.");
		  name.focus();
			 return;
	  }
	  var exp5=/^[가-힣\x20]{2,10}$/;
	  if(!exp5.test(name.value)){
		  alert("이름은 한글 2~10자 이내로 입력하세요.");
			name.focus();
			return;
	  }
	  //주민번호
	  var jumin=document.getElementById("jumin");
	  if(jumin.value == ""){
		  alert("주민번호를 입력하세요.");
		  jumin.focus();
			return;
	  }
	  var exp6=/^[0-9]{6}-[1-4]{1}[0-9]{6}$/;
	  if(!exp6.test(jumin.value)){
		  alert("주민번호를 정확히 입력하세요.");
		  jumin.focus();
			return;
	  }
	  //이메일
	  var email = document.getElementById("email");
	  if(email.value == ""){
		  alert("이메일을 입력해주세요.");
		  email.focus();
			 return;
	  }
	  var exp4=/^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	  if (!exp4.test(email.value)){
			alert("이메일 형식이 잘못 되었습니다.");
			email.focus();
			return;
		}
	  //연락처
	  var hp=document.getElementById("hp");
	  if(hp.value == ""){
		  alert("전화번호를 입력하세요.");
		  phone.focus();
			return;
	  }
	  var exp7=/^[0]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}$/;
	  if(!exp7.test(hp.value)){
		  alert("전화번호를 정확히 입력하세요.");
		  phone.focus();
			return;
	  }
	  //주소
	  var juso=document.getElementById("juso");
	  if(juso.value == ""){
		  alert("주소를 입력하세요.");
		  juso.focus();
			return;
	  }
	  if(userid!="" && passwd!="" && passwd1!="" && name!="" && jumin!="" && email!="" && hp!="" && juso!=""){
	  alert("회원가입이 완료되었습니다.");
	  document.form1.submit();  
	  }
}
function no(){
	 alert("메인 화면으로 돌아갑니다.");
	 location.href="${path}/page/index.jsp";
}
</script>
<style rel="stylesheet">
 body{
  margin: auto;
  vertical-align: middle;
  text-align: center;
  
  font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
   background: #596778;
 }
#page{
 margin: auto;
 vertical-align: middle;
 text-align: center;
 width: 100%;
 height: 100%;
}
#context{
margin:auto;
text-align: center;
 width:60%;
 height:100%;
 float: left;
}

.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #777;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #F7F7F7;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: #C4E17F;
   border-radius: 5px 5px 0 0;
   background-image: -webkit-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #db9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -moz-linear-gradient(left, #c4e17f, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -o-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCC 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9DBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: linear-gradient(to right, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #c49cde 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62c2e4 87.5%, #62C2E4);
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #F0776C;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
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
  <%-- <form name="form1" action="${path}/home_servlet/showMember.do" method="post">
   <fieldset>
   <b>아이디 : </b><input id="userid" name="userid" placeholder="영문자,숫자 6~16자리"><br>
   <b>비밀번호 : </b><input type="password" id="passwd" name="passwd" placeholder="영문자,숫자 8자리이상"><br>
   <b>비밀번호 확인 : </b><input type="password" id="passwd1" name="passwd1" placeholder="비밀번호 확인"><br>
   <b>이름 : </b><input id="name" name="name" placeholder="한글만 입력"><br>
   <b>주민번호 : </b><input id="jumin" name="jumin" placeholder="예)111111-1111111"><br>
   <b>이메일 : </b><input id="email" name="email" placeholder="예)abcd@naver.com"><br>
   <b>휴대폰 : </b><input id="hp" name="hp" placeholder="예)010-XXXX-XXXX"><br>
   <b>주소 : </b><input id="juso" name="juso" placeholder="예)서울시 강동구"><br>
   <input type="button" id="btnInsert" value="가입하기">
   <input type="button" id="btnEsc" value="취소">
   </fieldset>
  </form> --%>
  <form class="signUp" id="signupForm" method="post" name="form1" action="${path}/home_servlet/showMember.do">
  
  <h1 class="signUpTitle">회원가입</h1>
   <b>아이디<button type="button" id="btnData" style="float: right;" class="btn btn-default">중복확인</button></b><input type="text" name="userid" id="userid" class="signUpInput" placeholder="영문자,숫자 6~16자리" autofocus required>
   <div id="panal"></div>
   <b>비밀번호</b><input type="password" name="passwd" id="passwd" class="signUpInput" oninput="passwdCheck()" placeholder="영문자,숫자 8자리이상" required>
   <div id="passwdCheck" style="font-size: 0.8em;"></div>
   <b>비밀번호 확인</b><input type="password" id="passwd1" name="passwd1" class="signUpInput" oninput="passwd1Check()" placeholder="비밀번호 확인" required>
   <div id="passwd1Check" style="font-size: 0.8em;"></div>
   <b>이름</b><input id="name" name="name" class="signUpInput" oninput="nameCheck()" placeholder="예)김철수"><br>
   <div id="nameCheck" style="font-size: 0.8em;"></div>
   <b>주민번호</b><input id="jumin" name="jumin" class="signUpInput" oninput="juminCheck()" placeholder="예)111111-1111111" required>
   <div id="juminCheck" style="font-size: 0.8em;"></div>
   <b>이메일</b><input id="email" name="email" class="signUpInput" oninput="emailCheck()" placeholder="예)abcd@naver.com" required>
   <div id="emailCheck" style="font-size: 0.8em;"></div>
   <b>휴대폰</b><input type="tel" id="hp" name="hp" class="signUpInput" oninput="hpCheck()" placeholder="예)010-XXXX-XXXX" required>
   <div id="hpCheck" style="font-size: 0.8em;"></div>
   <b>주소</b> <input id="juso" name="juso" class="signUpInput" oninput="jusoCheck()" placeholder="예)서울시 강동구" required>
   <div id="jusoCheck" style="font-size: 0.8em;"></div>
   <input type="button" id="btnInsert" value="회원가입" class="signUpButton">
  

</form>

 </div>
  
 <!-- footer 태그 -->
 <%@ include file="../include/footer.jsp" %>
 </div>
 


</body>
</html>