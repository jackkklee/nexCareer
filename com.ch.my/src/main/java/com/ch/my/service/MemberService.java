package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Member;
public interface MemberService {

	Member select(String id);

	int charge(Member member);

	int down(Member member);

	int upload(Member member2);

	int update(Member member);

	int vipApp(Member member);

	int delete(String id);

	int insert(Member member);

	int vipReject(Member member);

	List<Member> list2();

	int vipAccept(Member member);

	List<Member> list();

	void setRoomNum(int num, String id);

	void removeNum(String id);

	int selectNum(String id);


	/*Collection<Member> setRoomNum(Member member);*/

}
