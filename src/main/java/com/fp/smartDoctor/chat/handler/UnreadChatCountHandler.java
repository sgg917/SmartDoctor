package com.fp.smartDoctor.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fp.smartDoctor.chat.model.service.ChatService;
import com.fp.smartDoctor.chat.model.vo.Chat;
import com.fp.smartDoctor.member.model.vo.Member;

public class UnreadChatCountHandler extends TextWebSocketHandler {
	
	  @Autowired ChatService cService;
		 
	  private List<Map<String,Object>> sessionList = new ArrayList<Map<String, Object>>();
		
		private static Logger logger = LoggerFactory.getLogger(UnreadChatCountHandler.class);
		
		//클라이언트와 연결 된 후
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws IOException {
		//채팅방 번호와 보낸이 아이디
			Map<String,Object> sessionmap = session.getAttributes();
			
			Member m = (Member)sessionmap.get("loginUser");
			String  loginUserid =m.getEmpNo();

			  
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("loginUser",loginUserid);
			  map.put("session", session);
			  
			  int count =cService.unreadcount(loginUserid);
			  String jsonstr = String.valueOf(count);
			  
			  session.sendMessage(new TextMessage(jsonstr));
			  
			  sessionList.add(map);
				logger.info("{} 연결됨", session.getId()); 
			//연결 완료.
		}
		
		//웹 소켓 서버로 데이터를 전송했을 경우
		 @Override
		 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			 logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			   //JSON --> MAP으로 변환
			   ObjectMapper objectMapper = new ObjectMapper();
			   Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
			   
			   Map<String,Object> sessionmap = session.getAttributes();
				
				Member m = (Member)sessionmap.get("loginUser");
				String  loginUserid =m.getEmpNo();
			   
			   
			   
			   //이거 왜넣었을까?
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   map.put("session", session);
			   
			   //메세지 뿌려주기
  		
				   		for(int i=0;i<sessionList.size();i++) {
				   			Map<String, Object> mapSessionList = sessionList.get(i);
				   			String loginUser = String.valueOf(mapSessionList.get("loginUser"));
				   			String friendid = mapReceive.get("friendid");
				   					if(loginUser.equals(friendid)) {
				   						
				   					
									WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
									
									int count =cService.unreadcount(friendid);
									 
									String jsonstr = String.valueOf(count);
									sess.sendMessage(new TextMessage(jsonstr));
				   					}
				   		}
				   		
				   	}
		 
			@Override
			public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
				//여기서 Db를 등록하면 되지않을까?
				//List 삭제
					
				logger.info("{} 연결 끊김",session.getId());
				 
				 for (int i = 0; i < sessionList.size(); i++) {
						Map<String, Object> map = sessionList.get(i);
						String loginUser = String.valueOf(map.get("loginUser"));
						WebSocketSession sess = (WebSocketSession)map.get("session");
						
						if(session.equals(sess)) {
							
							sessionList.remove(map);
						
						}
						
			}
			}

}
