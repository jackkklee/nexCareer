package com.ch.my.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Member;
@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;
	// 회원 객체 하나 선택하여 반환
	public Member select(String id) {
		return (Member) sst.selectOne("memberns.select", id);
	}
	// 회원 객체 하나 수정
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}
	// 회원 객체 하나 삭제
	public int delete(String id) {
		return sst.delete("memberns.delete", id);
	}
	// 회원 객체 하나 등록
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}
	// 금액 충전
	public int charge(Member member) {
		return sst.update("memberns.charge", member);
	}
	// 다운로드 시 멤버 포인트 차감
	public int down(Member member) {
		return sst.update("memberns.down", member);
	}
	// 업로드 한 자료가 다운로드 될 때 판매자 포인트 상승
	public int upload(Member member) {
		return sst.update("memberns.upload", member);
	}
	// 회원 목록 조회
	public List<Member> list() {
		return sst.selectList("memberns.list");
	}
	// 판매자 신청 회원 조회
	public List<Member> list2() {
		return sst.selectList("memberns.list2");
	}
	public int vipApp(Member member) {
		return sst.update("memberns.vipapply", member);
	}
	public int vipAccept(Member member) {
		return sst.update("memberns.vipaccept", member);
	}
	public int vipReject(Member member) {
		return sst.update("memberns.vipreject", member);
	}
	public void setRoomNum(int num,String id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("num",num);
		hm.put("id",id);
		sst.update("memberns.setRoomNum", hm);
	}
/*	@Override
	public Collection<Member> setRoomNum(Member member) {
		sst.update("memberns.setRoomNum",member);
		return null;
	}*/
	@Override
	public void removeNum(String id) {
		sst.update("memberns.removeNum",id);
	}
	@Override
	public int selectNum(String id) {
		return sst.selectOne("memberns.selectNum",id);
	}
}



