package com.baidu.netctoss.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class Cost implements Serializable{
	//为了能查询和接收时与表中字段匹配地自动填充值，本类属性变量名与COST表需对应
	//MyBatis能默认封装成实体类的约定
	private Integer id;//主键
	private String name;//资费名
	private Integer base_duration;//基本时长
	private Double base_cost;//基本费用
	private Double unit_cost;//单位费用
	private String status;//状态
	private String descr;//资费说明
	private Date creatime;//创建时间
	private Date startime;//开启时间
	private String cost_type;//资费类型
	private List<Integer> ids=new ArrayList<Integer>();//多个id
	//在属性里先给list初始化好；因为list需要.add(),避免没初始化.add()出空指针
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
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
	public Integer getBase_duration() {
		return base_duration;
	}
	public void setBase_duration(Integer baseDuration) {
		base_duration = baseDuration;
	}
	public Double getBase_cost() {
		return base_cost;
	}
	public void setBase_cost(Double baseCost) {
		base_cost = baseCost;
	}
	public Double getUnit_cost() {
		return unit_cost;
	}
	public void setUnit_cost(Double unitCost) {
		unit_cost = unitCost;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public Date getStartime() {
		return startime;
	}
	public void setStartime(Date startime) {
		this.startime = startime;
	}
	public String getCost_type() {
		return cost_type;
	}
	public void setCost_type(String costType) {
		cost_type = costType;
	}
	
	
}
