package com.fp.smartDoctor.chat.handler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fp.smartDoctor.chat.model.service.ChatService;
import com.fp.smartDoctor.member.model.vo.Member;

@Component
public class oneToOneChatHandler extends TextWebSocketHandler {
		
	
	  @Autowired ChatService cService;
	 
	//세션저장 ("co_no",co_no),("session",세션) - ...
		private List<Map<String,Object>> sessionList = new ArrayList<Map<String, Object>>();
		
		private static Logger logger = LoggerFactory.getLogger(oneToOneChatHandler.class);
		
		private static final String FILE_UPLOAD_PATH = "C:/test/websocket/";
		
		static int fileUploadIdx = 0;
		static String fileUploadSession = "";
		
		//클라이언트와 연결 된 후
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws IOException {
		//채팅방 번호와 보낸이 아이디

			Map<String,Object> sessionmap = session.getAttributes();
			
			Member m = (Member)sessionmap.get("loginUser");
			
			//co_no가져오기
			String co_no = String.valueOf(sessionmap.get("co_no"));

			//list<map<string,object>>에 들어갈 map저장
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("co_no",co_no);
			  map.put("session", session);
			  
			  Map<String,Object> map2 = new HashMap<String, Object>();
			  map2.put("co_no",co_no);
			  map2.put("id", m.getEmpNo());
			  
			  int result = cService.chatReadCheck(map2);
			  
			  int count =cService.unreadcount(m.getEmpNo());
			  
				String jsonstr = "count" + String.valueOf(count);

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
			   Map<String, Object> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
			   
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   map.put("co_no", mapReceive.get("co_no"));
			   map.put("session", session);
			   
			   //같은방 인원수 체크
			   int count = 0;
			   for(int i=0;i<sessionList.size();i++) {
				   Map<String, Object> mapSessionList = sessionList.get(i);
				   String co_no = String.valueOf(mapSessionList.get("co_no"));
					WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
				   
					if(co_no.equals(mapReceive.get("co_no"))) {
						count++;
					}
			   }
			   String yn = "";
			   //메세지전송 (Y,N)체크해주기위한 IF문
			  if(count == 2) {
				  yn = "Y";
			  }else {
				  yn ="N";
			  }
			  
			  //db에 저장 준비
			  Map<String,Object> userIdmap = session.getAttributes();
				Member m = (Member)userIdmap.get("loginUser"); //세션 교체
				String loginid = m.getEmpNo();
			
			  map.put("yn", yn);
			  map.put("id", loginid);
			  map.put("message",String.valueOf(mapReceive.get("msg")));
			  if(mapReceive.containsKey("filename")) {
				  map.put("img",String.valueOf(mapReceive.get("filename")));
				  int result = cService.insertChatmsg2(map);//db저장
				  
			  }else {
				  int result = cService.insertChatmsg(map);//db저장
			  }
			  
			  
			  //메세지 뿌려주기
			   for(int i=0; i<sessionList.size(); i++) {
					Map<String, Object> mapSessionList = sessionList.get(i);
					
					//sessionList에 담긴 Map에 값 가져옴 
					String co_no = String.valueOf(mapSessionList.get("co_no"));
					WebSocketSession sess = (WebSocketSession)mapSessionList.get("session");
					
					//만약 Map값을 불러왔는데 방번호가 같다면?
					if(co_no.equals(mapReceive.get("co_no"))) {
						
						  
						  if(mapReceive.containsKey("filename")) {
							  String name = m.getEmpName();
								String jsonStr2 = co_no + "|" +name+ "|" + mapReceive.get("msg")+"|" +mapReceive.get("img")+"|"+mapReceive.get("filename");
								sess.sendMessage(new TextMessage(jsonStr2)); //여기잠깐바꿈
					
						  }else {
						
								String name = m.getEmpName();
								
								String jsonStr2 = co_no + "|" +name+ "|" + mapReceive.get("msg")+"|" +mapReceive.get("img");						
		
								sess.sendMessage(new TextMessage(jsonStr2)); //여기잠깐바꿈
						  }	
					}
			   }
			
			 
		   }
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
			//List 삭제
				
			logger.info("{} 연결 끊김",session.getId());
			 
			 for (int i = 0; i < sessionList.size(); i++) {
					Map<String, Object> map = sessionList.get(i);
					String co_no = (String)map.get("co_no");
					WebSocketSession sess = (WebSocketSession)map.get("session");
					
					if(session.equals(sess)) {
						sessionList.remove(map);
					}
		}
		}
		
		
		
}
