package com.ch.my.service;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import com.ch.my.model.FileUp;
public interface FileUpService {
	int insert(FileUp file);

	FileUp select(int file_num);

	int down(int file_num);

	int totalSearch2(HashMap<String, Object> hm);

	List<FileUp> list(int startRow, int endRow);

	int total();

	List<FileUp> list2(String category, int startRow, int endRow);

	int total(String category);

	List<FileUp> listSearch1(HashMap<String, Object> hm);

	int totalSearch(HashMap<String, Object> hm);

	List<FileUp> listSearch2(HashMap<String, Object> hm);

	int update(FileUp file);

	int delete(int file_num);

	List<FileUp> list6();

}