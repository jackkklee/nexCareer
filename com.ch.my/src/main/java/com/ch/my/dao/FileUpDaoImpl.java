package com.ch.my.dao;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.FileUp;
@Repository
public class FileUpDaoImpl implements FileUpDao {
	@Autowired
	private SqlSessionTemplate sst;
	/*전체 파일리스트 불러오는 메소드*/
	public List<FileUp> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("fileupns.list", hm);
	}
	/*분류에 해당하는 파일리스트 불러오는 메소드*/
	public List<FileUp> list2(String category, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("category", category);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("fileupns.list2", hm);
	}
	/*파일 검색 중 분류가 전체에 해당하는 파일리스트 불러오는 메소드*/
	public List<FileUp> listSearch1(HashMap<String, Object> hm) {
		return sst.selectList("fileupns.list3", hm);
	}
	/*파일 검색 중 분류가 전체가 아닌 경우 파일리스트 불러오는 메소드*/
	public List<FileUp> listSearch2(HashMap<String, Object> hm) {
		return sst.selectList("fileupns.list4", hm);
	}
	/*파일 업로드하여 삽입하는 메소드*/
	public int insert(FileUp file) {
		return sst.insert("fileupns.insert", file);
	}
	/*파일 번호에 해당하는 파일 객체 선택하는 메소드*/
	public FileUp select(int file_num) {
		return (FileUp) sst.selectOne("fileupns.select", file_num);
	}
	/*페이징을 위해 전체 목록의 개수를 구하는 메소드*/
	public int total() {
		return sst.selectOne("fileupns.total");
	}
	/*카테고리별 페이징을 위해 카테고리에 해당하는 목록의 개수를 구하는 메소드*/
	public int total(String category) {
		return sst.selectOne("fileupns.totalCategory", category);
	}
	/*페이징을 위해 검색에 해당하는 목록의 개수를 구하는 메소드*/
	public int totalSearch(HashMap<String, Object> hm) {
		return sst.selectOne("fileupns.totalSearch", hm);
	}
	/*페이징을 위해 검색에 해당하는 목록의 개수를 구하는 메소드(카테고리가 있는 경우)*/
	public int totalSearch2(HashMap<String, Object> hm) {
		return sst.selectOne("fileupns.totalSearch2", hm);
	}
	/*인기 top15 목록을 반환하는 메소드삭*/
	/*다운로드 시 다운로드 수 +1 시키는 메소드*/
	public int down(int file_num) {
		return sst.update("fileupns.down", file_num);
	}
	@Override
	public int update(FileUp file) {
		return sst.update("fileupns.update", file);
	}
	@Override
	public int delete(int file_num) {
		return sst.update("fileupns.delete", file_num);
	}
	@Override
	public List<FileUp> list6() {
		return sst.selectList("fileupns.list6");
	}
}



