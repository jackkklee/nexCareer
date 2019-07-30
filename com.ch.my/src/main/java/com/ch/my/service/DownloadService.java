package com.ch.my.service;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Download;
public interface DownloadService {

	int insert(Download download);

	int total(String id);

	List<Download> myDownList(int startRow, int endRow, String id);
}