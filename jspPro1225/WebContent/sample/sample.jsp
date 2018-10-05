<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script language="javascript" type="text/javascript">

        var thisUserId = "Marbong"; // 아이디입력

       

        // 텍스트에 박스에 입력한 대화내용을 서버에 전송한다.

        function sendTalk() {

            var obj = document.getElementById("talk_input");

            if(obj) {


                addTalk(obj.value);  //대회내용을 추가한다.

                obj.value = ""; //텍스트필드 초기화

                obj.focus();  //커서를 텍스트필드에 위치한다.

            }

        }

       

        // 입력된 대화 내용을 대화창에 추가한다.

        function addTalk(content) {

            var obj = document.getElementById("talk_view");

            if(obj) {

                var line = thisUserId + " - " + content + "<br>";  //이름 -내용을 저장

                obj.innerHTML += line;  //내용을 추가한다.

            }          

        }

    </script>

</head>

 <body>

        <div class="container">

            <div id="talk_view" class="talk_view"></div>   

            <input type="text" name="talk_input" id="talk_input" class="talk_input">

            <input type="button" name="talk_send" id="talk_send" value="입력" OnClick="sendTalk()">

        </div>

    </body>

</html>