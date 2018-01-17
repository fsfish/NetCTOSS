package com.baidu.netctoss.dao;

import java.util.List;

import com.baidu.netctoss.entity.TestEmp;


public interface TestEmpMapperDao {
	public List<TestEmp> findEmpsByDeptNo(Integer dept_no);
	public List<TestEmp> findEmpsByDeptNo1(Integer dept_no);
}
