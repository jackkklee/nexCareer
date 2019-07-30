package kr.co.ucp.neww.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NewDaoImpl implements NewDao{
	@Autowired
	private SqlSessionTemplate sst;
}
