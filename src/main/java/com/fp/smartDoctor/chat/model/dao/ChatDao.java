package com.fp.smartDoctor.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.chat.model.vo.Chat;
import com.fp.smartDoctor.chat.model.vo.openChat;
import com.fp.smartDoctor.member.model.vo.Member;

@Repository("cDao")
public class ChatDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Member> selectMember(HashMap<String, Object> map) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectMember",map);
	}

	public int insertFriendList(HashMap<String, String> map) {
		
		return sqlSessionTemplate.insert("chatMapper.insertFriendList", map);
	}

	public ArrayList<Member> selectFriendList(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectFriend", id);
	}

	public int insertChatOneToOne(HashMap<String, String> map) {
	
		return sqlSessionTemplate.insert("chatMapper.insertChatOneToOne", map);
	}

	public Chat selectChatOnetoOne(HashMap<String, String> map) {
		
		return sqlSessionTemplate.selectOne("chatMapper.selectChatOnetoOne", map);
		
	}

	public int insertChatmsg(HashMap<String, Object> dbmap) {
		
		return sqlSessionTemplate.insert("chatMapper.insertChatmsg", dbmap);
	}

	public ArrayList<Chat> selectchatroom(String id) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectchatroom", id);
	}

	public Chat selectchatroomdetail(String co_no) {
		
		return sqlSessionTemplate.selectOne("chatMapper.selectOnechatroom", co_no);
	}

	public int openchatroominsert(openChat openchat) {
		
		return sqlSessionTemplate.insert("chatMapper.openchatroominsert", openchat);
	}

	public int selectopenchatroom(openChat openchat) {
		
		return sqlSessionTemplate.selectOne("chatMapper.selectopenchatroom", openchat);
	}

	public openChat selectopenchatroomdetail(int cm_no) {

		return sqlSessionTemplate.selectOne("chatMapper.selectopenchatroomdetail", cm_no);
	}

	public int insertOpenChatmsg(HashMap<String, Object> dbmap) {
		
		return sqlSessionTemplate.insert("chatMapper.insertOpenChatmsg",dbmap);
	}

	public ArrayList<openChat> selectopenchatroomlist() {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectopenchatroomlist");
	}

	public ArrayList<openChat> selectchatlist(int cm_no) {
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectchatlist", cm_no);
	}

	public openChat passwordcheck(HashMap<String, Object> check) {
		
		return sqlSessionTemplate.selectOne("chatMapper.passwordcheck", check);
	}

	public int openchatroomOut(Map<String, Object> map2) {
	
		return sqlSessionTemplate.update("chatMapper.openchatroomOut", map2);
	}

	public int joinchatroom(Map<String, Object> map2) {

		return sqlSessionTemplate.update("chatMapper.joinchatroom", map2);
	}

	public int deletefriend(HashMap<String, Object> map) {
	
		return sqlSessionTemplate.delete("chatMapper.deletefriend", map);
	}

	public ArrayList<Member> recommendList(String id) {

		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.recommendList", id);
	}

	public int chatReadCheck(Map<String, Object> map) {

		return sqlSessionTemplate.update("chatMapper.chatReadCheck", map);
	}

	public ArrayList<Chat> selectOneToOnechatlist(int co_no) {
		
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectOneToOnechatlist", co_no);
	}

	public String selectfriendName(String id) {
	
		return sqlSessionTemplate.selectOne("chatMapper.selectfriendName", id);
	}

	public ArrayList<Chat> selectchatroom2(String id) {
	
		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectchatroom2", id);
	}

	public List<Chat> selectMyChatRoomNo(String loginUserid) {
		
		return (List)sqlSessionTemplate.selectList("chatMapper.selectMyChatRoomNo", loginUserid);
	}

	public ArrayList<Chat> selectcount() {

		return (ArrayList)sqlSessionTemplate.selectList("chatMapper.selectcount");
	}

	public int insertreport(HashMap<String, Object> map) {
		
		return sqlSessionTemplate.insert("chatMapper.insertreport",map);
	}

	public int deleteopenchatroom(String cm_no) {
		
		return sqlSessionTemplate.delete("chatMapper.deleteopenchatroom", cm_no);
	}

	public int deleteopenchatlist(String cm_no) {
		
		return sqlSessionTemplate.delete("chatMapper.deleteopenchatlist",cm_no);
	}

	public Chat selectmanagerchat(String user) {
		
		return sqlSessionTemplate.selectOne("chatMapper.selectmanagerchat", user);
	}

	public int insertmanagerchat(String user) {
		
		return sqlSessionTemplate.insert("chatMapper.insertmanagerchat", user);
	}

	public int insertChatmsg2(HashMap<String, Object> map) {

		return sqlSessionTemplate.insert("chatMapper.insertChatmsg2", map);
	}

	public String selectreportchk(String user) {

		return sqlSessionTemplate.selectOne("chatMapper.selectreportchk", user);
	}

	public int unreadcount(String loginUserid) {
		
		return sqlSessionTemplate.selectOne("chatMapper.unreadcount", loginUserid);
	}
}
