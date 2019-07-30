package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Charge;
import com.ch.my.model.Room;
public interface RoomService {

	List<Room> list();

	int maxNum();

	int insert(Room room);

	void upCount(int num);

	void downCount(int selectNum);

	void delete();

	String selectSubject(int num);

	Room select(int num);


	
}