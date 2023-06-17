package com.wasp.chaser.controller;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.URI;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketExtension;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wasp.chaser.domain.MessageVO;
import com.wasp.chaser.domain.TestDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class WebSocketController {

	@Autowired
	private TestSocketHandler socketHandler;
	
	WebSocketSession session = new WebSocketSession() {
		
		@Override
		public void setTextMessageSizeLimit(int messageSizeLimit) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setBinaryMessageSizeLimit(int messageSizeLimit) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void sendMessage(WebSocketMessage<?> message) throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isOpen() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public URI getUri() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getTextMessageSizeLimit() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public InetSocketAddress getRemoteAddress() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Principal getPrincipal() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public InetSocketAddress getLocalAddress() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpHeaders getHandshakeHeaders() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public List<WebSocketExtension> getExtensions() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getBinaryMessageSizeLimit() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Map<String, Object> getAttributes() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getAcceptedProtocol() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void close(CloseStatus status) throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void close() throws IOException {
			// TODO Auto-generated method stub
			
		}
	};
	
	
	@GetMapping("/testSocket")
	public void socketTest(Model model) {
		log.info("testSocket........................................");
	}
	
	@GetMapping("/testSocket2")
	public void socketTest2(Model model) {
		log.info("testSocket2........................................");
	}
	
	@RequestMapping(value = "/sendWebSocketMessage" , method = RequestMethod.POST)
	public void sendWebSocketMessage(@RequestBody String msg) throws Exception {
		
		log.info(msg);
		
		socketHandler.handleTextMessage(session, new TextMessage(msg));
	}
	
}
