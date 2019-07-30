package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Member;
public interface MemberDao {

	Member select(String id);

	int charge(Member member);

	int down(Member member);

	int upload(Member member2);

	int update(Member member);

	int vipApp(Member member);

	int delete(String id);

	int vipAccept(Member member);

	List<Member> list();

	List<Member> list2();

	int vipReject(Member member);

	int insert(Member member);

	void setRoomNum(int num, String id);

	void removeNum(String id);

	int selectNum(String id);

	/*Collection<Member> setRoomNum(Member member);*/

}