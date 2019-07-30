package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.DownloadDao;
import com.ch.my.model.Download;
@Service
public class DownloadServiceImpl implements DownloadService{
	@Autowired
	private DownloadDao dd;

	@Override
	public int insert(Download download) {
		return dd.insert(download);
	}

	@Override
	public int total(String id) {
		return dd.total(id);
	}

	@Override
	public List<Download> myDownList(int startRow, int endRow, String id) {
		return dd.myDownList(startRow, endRow, id);
	}
}