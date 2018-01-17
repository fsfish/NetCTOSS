package com.baidu.netctoss.entity;

import java.util.List;

public class TestDept {
	private Integer dept_no;
	private String dname;
	private String loc;
	
	//追加属性，用户存储某部门包含的所有员工emp信息
	private List<TestEmp> emps;
	
	public List<TestEmp> getEmps() {
		return emps;
	}
	public void setEmps(List<TestEmp> emps) {
		this.emps = emps;
	}
	public Integer getDept_no() {
		return dept_no;
	}
	public void setDept_no(Integer deptNo) {
		dept_no = deptNo;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
