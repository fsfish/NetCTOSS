package com.baidu.netctoss.entity;

import java.io.Serializable;

public class TestEmp implements Serializable{
	private Integer id;
	private String name;
	private String sex;
	private Integer dept_no;
	//关联属性
	private TestDept dept;
	
	public TestDept getDept() {
		return dept;
	}
	public void setDept(TestDept dept) {
		this.dept = dept;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getDept_no() {
		return dept_no;
	}
	public void setDept_no(Integer deptNo) {
		dept_no = deptNo;
	}
}
