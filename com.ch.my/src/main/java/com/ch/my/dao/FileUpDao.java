package com.ch.my.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import com.ch.my.model.FileUp;
public interface FileUpDao {
	List<FileUp> listSearch2(HashMap<String, Object> hm);

	int totalSearch(HashMap<String, Object> hm);

	List<FileUp> listSearch1(HashMap<String, Object> hm);

	int total(String category);

	List<FileUp> list2(String category, int startRow, int endRow);

	int total();

	List<FileUp> list(int startRow, int endRow);

	int totalSearch2(HashMap<String, Object> hm);

	int down(int file_num);

	FileUp select(int file_num);

	int insert(FileUp file);

	int update(FileUp file);

	int delete(int file_num);

	List<FileUp> list6();

}