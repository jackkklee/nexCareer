package com.ch.my.dao;
import java.util.Collection;
import java.util.List;

import com.ch.my.model.Manager;
public interface ManagerDao {


	Manager select(String managerid);
}