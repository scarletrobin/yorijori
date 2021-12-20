<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/chat/Chat.css" rel="stylesheet" type="text/css">

   <div class="chatFrm shadow" id="chatFrmUser">
       <div class="chatTop"><p>요리조리 1:1 문의</p></div>
       <div class="chatMain scrollBottom">
           <table id="chatUserTbl">
			<!-- WebSocket으로 추가 -->
           </table>
           <button id="qnaBtn">자주묻는질문</button>
           <div id="blank"></div>
       </div>
       <div class="chatBottom">
           <textarea id="chatText"></textarea>
           <button id="chatEnter"></button>
       </div>
   </div>
   
<script>
	var sessionMemberNo = ${sessionScope.m.memberNo};
	var sendMsg;
	var sendTextBefore;
	var ws;
	var chatbotCheck = 0;
	var alarm;
	$(function(){
	    $("#chatFrmUser").css("display","none").prop("on",false);
	    $(".chatAlarm").css("display","inline");
		alarm = -1;
		$("#chatUserAlarm").text(alarm);
	    ws = new WebSocket("ws://192.168.219.102/chatWebsoket.do");
		ws.onopen = startChat;
		ws.onmessage = receiveMsg;
        ws.onclose = endChat;
	});
	
	$("#chatUser").click(function(){
		// alarm
 		alarm = 0;
 		$("#chatUserAlarm").text(alarm);
		// chat
		if($("#chatFrmUser").prop("on") == false){
	        $("#chatFrmUser").css("display","block").prop("on",true);
	        startChat();
		}else{
			$("#chatFrmUser").css("display","none").prop("on",false);
			$("#chatUserTbl").children().remove();
		}
	});
	
	function startChat(){
	    var data = {type:"start",memberNo:sessionMemberNo};
	   	ws.send(JSON.stringify(data));
	   	chatbotCheck = 0;
	}
	function receiveMsg(param){
		appendChat(param.data);
	}
	function endChat(){
		
	}
	
	function appendChat(appendMsg){
		// alarm
		if($("#chatFrmUser").prop("on") == false){
			alarm += 1;
			$("#chatUserAlarm").text(alarm);
		}
		// chat
		if(appendMsg.length != 0){
			if(appendMsg != "noAnswer") {
				$("#chatUserTbl").append(appendMsg);
	    		$(".scrollBottom").scrollTop($(".scrollBottom")[0].scrollHeight);  // div scroll bottom으로
				$("#chatText").val("");
	    		sendMsg = "";
	    		sendTextBefore = "";
			}else{
				var sMsg = "<tr><td class='sendText'><div>"+sendMsg+"</div></td></tr>";
				$("#chatUserTbl").append(sMsg);
				$(".scrollBottom").scrollTop($(".scrollBottom")[0].scrollHeight);  // div scroll bottom으로
				$("#chatText").val("");
	    		sendMsg = "";
	    		sendTextBefore = "";
				chatbotCheck = 1;
			}
		}else{
			$("#qnaBtn").click();
		}
	}
	
	$("#chatEnter").click(function(){
		if(chatbotCheck != 1){
			console.log(chatbotCheck);
			if(sendMsg.trim() != ""){  // 문자열에서 공백 제거한 값 != ""
			    var sender = sessionMemberNo;
			    var receiver = 86;
			    var data = {type:"chat", chatSend:sender, chatReceive:receiver, chatContent:sendMsg};
			    ws.send(JSON.stringify(data));
			}
		}else{  // 챗봇 호출시
			if(sendMsg != null){
				var data = {type:"chatbotAnswer", chatContent:sendMsg};
				ws.send(JSON.stringify(data));
			}
		}
		chatbotCheck = 0;
	});
	
	$("#qnaBtn").click(function(){
		// chatbot 기본list 출력
		// keyward : start1, start2
		var data = {type:"chatbot"};
      	ws.send(JSON.stringify(data));
      	chatbotCheck = 1;
	});

	$("#chatText").keyup(function(){  // textarea 글자수 제한 (엔터 포함)
		var sendText = $(this).val();
		var sendMsgBr = sendText.replace(/(\n|\r\n)/g,"<br>");
		// 글자수
		var maxByte = 1000;  // max
	    var textVal = sendMsgBr;
	    var textLen = 0;  // 문자 갯수 check
	    var totalByte=0;
	    for(var i=0; i<textVal.length; i++){
	    	var eachChar = textVal.charAt(i);
	        var uniChar = escape(eachChar) //유니코드 형식으로 변환
	        if(uniChar.length>4){
	        	// 한글 : 3Byte
	            totalByte += 3;
	        }else{
	        	// 영문,숫자,특수문자 : 1Byte
	            totalByte += 1;
	        }
	        // 문자 갯수 check
	        if(totalByte<=maxByte){
	        	textLen = i+1;
	        }
	    }
	    // 결과처리
	    if(totalByte>maxByte){
	    	alert("최대 1000Byte까지만 입력가능합니다.");
	    	$(this).val(sendTextBefore);
        }else{
        	sendTextBefore = sendText;  // 전역변수 sendTextBefore
        	sendMsg = sendMsgBr;
        }
	});
</script>
