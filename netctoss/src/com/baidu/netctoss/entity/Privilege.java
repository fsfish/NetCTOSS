package com.baidu.netctoss.entity;

import java.io.Serializable;
import java.util.List;

public class Privilege implements Serializable {

	private String id;
	
	private String name;
	
	private List<String> urls;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
  	return name;
  }
	public void setName(String name) {
  	this.name = name;
  }
	public List<String> getUrls() {
		return urls;
	}
	public void setUrls(List<String> urls) {
		this.urls = urls;
	}

}
