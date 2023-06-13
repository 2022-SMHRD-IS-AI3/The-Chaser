<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<div id="messageArea"></div>
</body>
<script>
    	$(document).ready(function(){
    		alert("시작")
    		$.ajax({
    			url : "/apiTest",
    			type : "POST",
    			data : {
    				num : 1,
    				name : 'name1'
    			},
    			success : function(data){
    				$("#messageArea").text(data);
    				alert("성공");
    			},
    			error : function(){
    				alert("실패");
    			}
    		})
    	})
    
    </script>
<script  type="text/javascript">
	$("#sendBtn").click(function(){
		sendMessage();
		$('#message').val('')
	});
	
	let sock = new SockJS("http://localhost:9090/socket");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#message").val());
	}
	function onMessage(msg){
		var data = msg.data;
		$("#messageArea").text(data);
	}
	function onClose(evt){
		$("#messageArea").append("연결 끊김");
	}

</script>
</html>