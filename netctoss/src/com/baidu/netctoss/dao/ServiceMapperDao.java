package com.baidu.netctoss.dao;

import java.util.List;


import com.baidu.netctoss.entity.Service;
import com.baidu.netctoss.vo.ServiceLine;
import com.baidu.netctoss.vo.ServicePage;

public interface ServiceMapperDao {
	public List<ServiceLine> findByConditions(ServicePage page);
	public Integer countRowsByConditions(ServicePage page);
	public void pauseById(Integer id);
	public void startById(Integer id);
	public void deleteById(Integer id);
	public ServiceLine findById(Integer id);
	public void addService(Service ser);
	public void updateService(ServiceLine ser);
}
