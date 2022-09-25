package com.fp.smartDoctor.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.chat.model.dao.ChatDao;
import com.fp.smartDoctor.chat.model.vo.Chat;
import com.fp.smartDoctor.chat.model.vo.openChat;
import com.fp.smartDoctor.member.model.vo.Member;

@Service("sService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao cDao;

	@Override
	public ArrayList<Member> selectMember(HashMap<String, Object> map) {
		
		return cDao.selectMember(map);
	}

	@Override
	public int insertFriendList(HashMap<String, String> map) {
		
		return cDao.insertFriendList(map);
	}

	@Override
	public ArrayList<Member> selectFriendList(String id) {
	
		return cDao.selectFriendList(id);
	}

	@Override
	public int insertChatOnetoTOne(HashMap<String, String> map) {
	
		return cDao.insertChatOneToOne(map);
	}

	@Override
	public Chat selectChatOnetoOne(HashMap<String, String> map) {
		
		return cDao.selectChatOnetoOne(map);
	}

	@Override
	public int insertChatmsg(HashMap<String, Object> dbmap) {
		
		return cDao.insertChatmsg(dbmap);
	}

	@Override
	public ArrayList<Chat> selectchatroom(String id) {

		return cDao.selectchatroom(id);
	}

	@Override
	public Chat selectchatroomdetail(String co_no) {
		
		return cDao.selectchatroomdetail(co_no);
	}

	@Override
	public int openchatroominsert(openChat openchat) {
		
		return cDao.openchatroominsert(openchat);
	}

	@Override
	public int selectopenchatroom(openChat openchat) {
	
		return cDao.selectopenchatroom(openchat);
	}

	@Override
	public openChat selectopenchatroomdetail(int cm_no) {
	
		return cDao.selectopenchatroomdetail(cm_no);
	}

	@Override
	public int insertOpenChatmsg(HashMap<String, Object> dbmap) {
		
		return cDao.insertOpenChatmsg(dbmap);
	}

	@Override
	public ArrayList<openChat> selectopenchatroomlist() {
		
		return cDao.selectopenchatroomlist();
	}

	@Override
	public ArrayList<openChat> selectchatlist(int cm_no) {
	
		return cDao.selectchatlist(cm_no);
	}

	@Override
	public openChat passwordcheck(HashMap<String, Object> check) {
	
		return cDao.passwordcheck(check);
	}

	@Override
	public int openchatroomOut(Map<String, Object> map2) {
		
		return cDao.openchatroomOut(map2);
	}

	@Override
	public int joinchatroom(Map<String, Object> map2) {

		return cDao.joinchatroom(map2);
	}

	@Override
	public int deletefriend(HashMap<String, Object> map) {
	
		return cDao.deletefriend(map);
	}

	@Override
	public ArrayList<Member> recommendList(String id) {

		return cDao.recommendList(id);
	}

	@Override
	public int chatReadCheck(Map<String, Object> map) {
		return cDao.chatReadCheck(map);
	}

	@Override
	public ArrayList<Chat> selectOneToOnechatlist(int co_no) {
		
		return cDao.selectOneToOnechatlist(co_no);
	}

	@Override
	public String selectfriendName(String id) {
		
		return cDao.selectfriendName(id);
	}

	@Override
	public ArrayList<Chat> selectchatroom2(String id) {
		
		return cDao.selectchatroom2(id);
	}

	@Override
	public List<Chat> selectMyChatRoomNo(String loginUserid) {
	
		return cDao.selectMyChatRoomNo(loginUserid);
	}

	@Override
	public ArrayList<Chat> selectcount() {

		return cDao.selectcount();
	}

	@Override
	public int insertreport(HashMap<String, Object> map) {

		return cDao.insertreport(map);
	}

	@Override
	public int deleteopenchatroom(String cm_no) {
	
		return cDao.deleteopenchatroom(cm_no);
	}

	@Override
	public int deleteopenchatlist(String cm_no) {

		return cDao.deleteopenchatlist(cm_no);
	}

	@Override
	public Chat selectmanagerchat(String user) {
	
		return cDao.selectmanagerchat(user);
	}

	@Override
	public int insertmanagerchat(String user) {

		return cDao.insertmanagerchat(user);
	}

	@Override
	public int insertChatmsg2(HashMap<String, Object> map) {

		return cDao.insertChatmsg2(map);
	}

	@Override
	public String selectreportchk(String user) {

		return cDao.selectreportchk(user);
	}

	@Override
	public int unreadcount(String loginUserid) {
		
		return cDao.unreadcount(loginUserid);
	}

	
}
