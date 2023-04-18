<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script>
	var webSocket= new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
	var chatWindow,chatMessage,chatId;
	// 채팅창이 열리면 사용할 대화창, 메세지 입력창, 대화명 표시란 DOM 객체저장
	window.onload= function(){
		chatWindow=document.getElementById("chatWindow");
		chatMessage=document.getElementById("chatMessage");
		chatId= document.getElementById("chatId").value;
	}
	// 메세지 전송
	function sendMessage(){
		// 대화창에 표시 
		 chatWindow.innerHTML += "<div class='myMsg'>"+chatMessage.value+"</div>";
	      webSocket.send(chatId+"|"+chatMessage.value); //서버로 전송
	      chatMessage.value = ""; //메세치 입력창 초기화
	      chatWindow.scrollTop = chatWindow.scrollHeight; //대화창 스크롤

		
	}
	// 서버와 연결 종료
	function disconnect(){
		webSocket.close();
	}
	
	//엔터키 입력처리
	function enterKey(){
		if(window.event.keyCode==13){// 13은 'Enter'키의 코드값
			sendMessage();
			
			
		}
	}
	webSocket.onopen=function(event){
		chatWindow.innerHTML+="웹소켓 서버 연결<br>";
	}
	webSocket.onclose=function(event){
		chatWindow.innerHTML+="웹소켓 서버 연결 해제<br>";
	}
	webSocket.onerror=function(event){
		alert(event.data);
		chatWindow.innerHTML+="채팅 중 에러 발생<br>"
	};
	webSocket.onmessage=function(event){ //서버에서 나한태 받을떄 메세지 들어오는 이벤트 적기  
		var message=event.data.split("|") // 보낼때 | 해서 보냈으니 나도 받을때 아이랑 / 메세지랑 쪼개서 받기
		var sender=message[0];// 대화명
		var content=message[1];//메세지 내용
		if(content!=""){
			if(content.match("/")){
				if(content.match(("/"+chatId))){//나에게 온 메세지
					var temp=content.replace(("/"+chatId),"[귀속말]:");
					chatWindow.innerHTML+="<div>"+sender+":"+temp+"</div>";
				}
				
			}else{
			chatWindow.innerHTML+="<div>"+sender+":"+content+"</div>";
			}
		}
		chatWindow.scrollTop=chatWindow.scrollHeight;
		
			
	};
</script>
<style>
#chatWindow {
	boder: 1px solid black;
	width: 270px;
	height: 310px;
	overflow: scroll;
	padding: 50px
}

#chatMessage {
	width: 236px;
	height: 30px;
}

#sendBtn {
	height: 30px;
	position: relative;
	top: 2px;
	left: -2px;
}

#closeBtn {
	margin-botton: 3px;
	position: relative;
	top: 2px;
	left: -2px;
}

#chatId {
	width: 158px;
	height: 24px;
	border: 1px solid #AAAAAA;
	background-color: #EEEEEE;
}

.myMsg {
	text-align: right;
}
</style>

</head>
<body>
	<!-- 대화창 UI 구조 정의  -->
	대화명 :
	<input type="text" id="chatId" value="${param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>

	</div>


</body>
</html>