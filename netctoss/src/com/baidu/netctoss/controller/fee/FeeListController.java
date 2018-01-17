package com.baidu.netctoss.controller.fee;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.Page;
@Controller
@RequestMapping("/fee")
@SessionAttributes("page")//将model中key为"page"的存入session
public class FeeListController {
	@Resource
	private CostMapperDao dao;
	
	@RequestMapping("/list")
	public String execute(Page page,Model model){
	//取page对象时会先到request里找，如果没有再到session里找
		//先取出总记录数，计算出最大页
		Integer rows=dao.countRows();//获取costs数据总条数，用于计算页数
		page.setRows(rows);//setRows更新后，gettotalPage也更新
		//判断page中current是否大于实际的totalPage,如果大于就current-1
			//为了解决最后一页只有一条记录时的删除问题
		if(page.getCurrent()>page.getTotalPage()){
			page.setCurrent(page.getCurrent()-1);
			//减掉之后，current更新，再进行下面的数据查询
		}
		
		//查询current页的记录
		List<Cost> costs=dao.findPage(page);
		
		//将分页数据（page）和结果数据(costs)放入模型，供jsp取用
		model.addAttribute("costs",costs);
		model.addAttribute("page",page);
		//由于设置了SessionAttribute,这里存入model的page也会存入session
		return "fee/fee_list";
	}
}
