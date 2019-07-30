package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Charge;
public interface ChargeDao {

	int point(int charge_option);

	List<Charge> myChargeList(int startRow, int endRow, String id);

	int total(String id);

	List<Charge> chargeList();

	int insert(Charge charge);

}