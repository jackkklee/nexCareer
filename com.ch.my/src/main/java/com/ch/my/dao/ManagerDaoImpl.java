package com.ch.my.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.my.model.Manager;
import com.ch.my.model.Member;
@Repository
public class ManagerDaoImpl implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public Manager select(String managerid) {
		return (Manager) sst.selectOne("managerns.select",managerid);
	}
}



