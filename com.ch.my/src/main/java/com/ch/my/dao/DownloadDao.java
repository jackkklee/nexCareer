package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Download;
public interface DownloadDao {

	int insert(Download download);

	int total(String id);

	List<Download> myDownList(int startRow, int endRow, String id);
}