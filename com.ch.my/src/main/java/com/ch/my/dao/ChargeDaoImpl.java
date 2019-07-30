package com.ch.my.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Charge;
@Repository
public class ChargeDaoImpl implements ChargeDao {
	@Autowired
	private SqlSessionTemplate sst;
	/*충전 내역 리스트 삽입*/
	public int insert(Charge charge) {
		return sst.insert("chargens.insert", charge);
	}
	/*충전 옵션에 해당하는 포인트 반환 메소드*/
	public int point(int charge_option) {
		return sst.selectOne("chargens.point", charge_option);
	}
	/*나의 결제내역 리스트*/
	public List<Charge> myChargeList(int startRow, int endRow, String mem_id) {
		System.out.println("다오2");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("mem_id", mem_id);
		return sst.selectList("chargens.myChargeList", hm);
	}
	/*페이징을 위해 전체 목록의 개수를 구하는 메소드*/
	public int total(String id) {
		return sst.selectOne("chargens.total", id);
	}
	@Override
	/*관리자 페이지에서 충전내역 조회*/
	public List<Charge> chargeList() {
		return sst.selectList("chargens.chargeList");
	}
}



