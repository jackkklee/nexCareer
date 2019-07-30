package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.ChargeDao;
import com.ch.my.model.Charge;
@Service
public class ChargeServiceImpl implements ChargeService{
	@Autowired
	private ChargeDao cd;
	@Override
	public int point(int charge_option) {
		return cd.point(charge_option);
	}
	@Override
	public List<Charge> myChargeList(int startRow, int endRow, String id) {
		return cd.myChargeList(startRow, endRow, id);
	}
	@Override
	public int total(String id) {
		return cd.total(id);
	}
	@Override
	public List<Charge> chargeList() {
		return cd.chargeList();
	}
	@Override
	public int insert(Charge charge) {
		return cd.insert(charge);
	}
}