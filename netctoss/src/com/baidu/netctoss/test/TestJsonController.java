package com.baidu.netctoss.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.Page;

@Controller
@RequestMapping("/test")
public class TestJsonController {
	@Resource
	private CostMapperDao dao;
	
	@RequestMapping("/json1")
	@ResponseBody
	public String f1(){//返回一个字符串
		return "1";
	}
	@RequestMapping("/json2")
	@ResponseBody
	public Map<String,Object>f2(){//返回多个值,用HashMap
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", "1001");
		map.put("name", 111);
		return map;
	}
	@RequestMapping("/json3")
	@ResponseBody
	public List<String> f3(){//返回一个集合
		List<String> list=new ArrayList<String>();
		list.add("123");
		list.add("lxx");
		return list;
	}
	@RequestMapping("/json4")
	@ResponseBody
	public Object f4(){//返回一个对象
		Cost c=new Cost();
		return c;
	}
	
	@RequestMapping("/json5")
	@ResponseBody
	public List<Cost> f5(){//返回对象的集合
		Page p=new Page();
		List<Cost> list=dao.findPage(p);
		return list;
	}
}
