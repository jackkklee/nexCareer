package com.ch.my.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.RoomDao;
import com.ch.my.model.Room;
@Service
public class RoomServiceImpl implements RoomService{
	@Autowired
	private RoomDao rd;
/*	public int point(int charge_option) {
		return cd.point(charge_option);
	}
*/

	@Override
	public List<Room> list() {
		return rd.list();
	}

	@Override
	public int maxNum() {
		return rd.maxNum();
	}

	@Override
	public int insert(Room room) {
		return rd.insert(room);
	}

	@Override
	public void upCount(int num) {
		rd.upCount(num);
	}

	@Override
	public void downCount(int selectNum) {
		rd.downCount(selectNum);
	}

	@Override
	public void delete() {
		rd.delete();
	}

	@Override
	public String selectSubject(int num) {
		return rd.selectSubject(num);
	}

	@Override
	public Room select(int num) {
		return rd.select(num);
	}



}