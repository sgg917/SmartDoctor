package com.fp.smartDoctor.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fp.smartDoctor.chat.model.vo.Chat;
import com.fp.smartDoctor.chat.model.vo.openChat;
import com.fp.smartDoctor.member.model.vo.Member;

public interface ChatService {

	ArrayList<Member> selectMember(HashMap<String, Object> map);

	int insertFriendList(HashMap<String, String> map);

	ArrayList<Member> selectFriendList(String id);

	int insertChatOnetoTOne(HashMap<String, String> map);

	Chat selectChatOnetoOne(HashMap<String, String> map);

	int insertChatmsg(HashMap<String, Object> dbmap);

	ArrayList<Chat> selectchatroom(String id);

	Chat selectchatroomdetail(String co_no);

	int openchatroominsert(openChat openchat);

	int selectopenchatroom(openChat openchat);

	openChat selectopenchatroomdetail(int cm_no);

	int insertOpenChatmsg(HashMap<String, Object> dbmap);

	ArrayList<openChat> selectopenchatroomlist();

	ArrayList<openChat> selectchatlist(int cm_no);

	openChat passwordcheck(HashMap<String, Object> check);

	int openchatroomOut(Map<String, Object> map2);

	int joinchatroom(Map<String, Object> map2);

	int deletefriend(HashMap<String, Object> map);

	ArrayList<Member> recommendList(String id);

	int chatReadCheck(Map<String, Object> map);

	ArrayList<Chat> selectOneToOnechatlist(int co_no);

	String selectfriendName(String id);

	ArrayList<Chat> selectchatroom2(String id);

	List<Chat> selectMyChatRoomNo(String loginUserid);

	ArrayList<Chat> selectcount();

	int insertreport(HashMap<String, Object> map);

	int deleteopenchatroom(String cm_no);

	int deleteopenchatlist(String cm_no);

	Chat selectmanagerchat(String user);

	int insertmanagerchat(String user);

	int insertChatmsg2(HashMap<String, Object> map);

	String selectreportchk(String user);

	int unreadcount(String loginUserid);

}
