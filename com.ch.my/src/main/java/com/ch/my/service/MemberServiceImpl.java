package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.MemberDao;
import com.ch.my.model.Member;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;
	@Override
	public Member select(String id) {
		return md.select(id);
	}
	@Override
	public int charge(Member member) {
		return md.charge(member);
	}
	@Override
	public int down(Member member) {
		return md.down(member);
	}
	@Override
	public int upload(Member member2) {
		return md.upload(member2);
	}
	@Override
	public int update(Member member) {
		return md.update(member);
	}
	@Override
	public int vipApp(Member member) {
		return md.vipApp(member);
	}
	@Override
	public int delete(String id) {
		return md.delete(id);
	}
	@Override
	public int insert(Member member) {
		return md.insert(member);
	}
	@Override
	public int vipReject(Member member) {
		return md.vipReject(member);
	}
	@Override
	public List<Member> list2() {
		return md.list2();

	}
	@Override
	public int vipAccept(Member member) {
		return md.vipAccept(member);
	}
	@Override
	public List<Member> list() {
		return md.list();
	}
/*	@Override
	public Collection<Member> setRoomNum(Member member) {
		return md.setRoomNum(member);
	}*/
	public void setRoomNum(int num, String id) {
		md.setRoomNum(num, id);
	}
	@Override
	public void removeNum(String id) {
		md.removeNum(id);
	}
	@Override
	public int selectNum(String id) {
		return md.selectNum(id);
	}
}