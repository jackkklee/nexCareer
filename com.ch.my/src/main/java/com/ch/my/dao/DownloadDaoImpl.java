package com.ch.my.dao;
import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Download;
@Repository
public class DownloadDaoImpl implements DownloadDao {
	@Autowired
	private SqlSessionTemplate sst;
	public int insert(Download download) {
		return sst.insert("downloadns.insert", download);
	}
	public List<Download> myDownList(int startRow, int endRow, String mem_id) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("mem_id", mem_id);
		return sst.selectList("downloadns.myDownList", hm);
	}
	public int total(String down_id) {
		return sst.selectOne("downloadns.total", down_id);
	}
}



