package com.fp.smartDoctor.chat.model.service;

import java.util.ArrayList;
import java.util.Optional;

import com.fp.smartDoctor.chat.model.vo.Chat;
import com.fp.smartDoctor.chat.model.vo.ContectList;
import com.fp.smartDoctor.chat.model.vo.Department;
import com.fp.smartDoctor.chat.model.vo.Favorites;

public interface ChatService {

	ArrayList<Department> selectDeptList();

	ArrayList<ContectList> selectContectList(String title);

	ContectList selectContectMember(int eno);

	int insertMessage(Chat chat);

	int updateStatus(ContectList con);

	ArrayList<Chat> selectChatList(Chat chat);

	ArrayList<Favorites> selectFavoriteList(int eno);

	int insertFavorites(Favorites f);

	void deleteFavorites(Favorites f);

	Favorites checkFavorites(Favorites f);

}
