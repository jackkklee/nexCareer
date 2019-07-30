package com.ch.my.service;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.my.dao.FileUpDao;
import com.ch.my.model.FileUp;
@Service
public class FileUpServiceImpl implements FileUpService{
	@Autowired
	private FileUpDao fd;

	@Override
	public int insert(FileUp file) {
		return fd.insert(file);
	}

	@Override
	public FileUp select(int file_num) {
		return fd.select(file_num);
	}

	@Override
	public int down(int file_num) {
		return fd.down(file_num);
	}

	@Override
	public int totalSearch2(HashMap<String, Object> hm) {
		return fd.totalSearch2(hm);
	}

	@Override
	public List<FileUp> list(int startRow, int endRow) {
		return fd.list(startRow,endRow);
	}

	@Override
	public int total() {
		return fd.total();
	}

	@Override
	public List<FileUp> list2(String category, int startRow, int endRow) {
		return fd.list2(category,startRow,endRow);
	}

	@Override
	public int total(String category) {
		return fd.total(category);
	}

	@Override
	public List<FileUp> listSearch1(HashMap<String, Object> hm) {
		return fd.listSearch1(hm);
	}

	@Override
	public int totalSearch(HashMap<String, Object> hm) {
		return fd.totalSearch(hm);
	}

	@Override
	public List<FileUp> listSearch2(HashMap<String, Object> hm) {
		return fd.listSearch2(hm);
	}

	@Override
	public int update(FileUp file) {
		
		return fd.update(file);
	}

	@Override
	public int delete(int file_num) {
		
		return fd.delete(file_num);
	}

	@Override
	public List<FileUp> list6() {
		return fd.list6();
	}
}