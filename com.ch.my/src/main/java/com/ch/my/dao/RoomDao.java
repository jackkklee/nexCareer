package com.ch.my.dao;
import java.util.List;

import com.ch.my.model.Room;
public interface RoomDao {

	List<Room> list();

	int maxNum();

	int insert(Room room);

	void upCount(int num);

	void downCount(int selectNum);

	void delete();

	String selectSubject(int num);

	Room select(int num);


	

/*	int point(int charge_option);

	List<Charge> myChargeList(int startRow, int endRow, String id);

	int total(String id);

	List<Charge> chargeList();

	int insert(Charge charge);*/

}