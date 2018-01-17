package com.baidu.netctoss.dao;

import java.util.List;
import java.util.Map;

import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.Page;

public interface CostMapperDao {
	public List<Cost> findPage(Page page);
	public Integer countRows();
	public void insertFee(Cost c);
	public Cost findById(Integer id);
	public void updateById(Cost c);
	public void deleteById(Integer id);
	public void start(Integer id);
	public List<Cost> findByConditions(Cost c);
	public List<Cost> findByIds(Cost c);
	public List<Cost> findAllAvailable();
}
