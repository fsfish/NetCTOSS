package com.baidu.netctoss.dao;

import java.util.List;
import java.util.Map;

import com.baidu.netctoss.entity.Account;
import com.baidu.netctoss.vo.AccountPage;

public interface AccountMapperDao {
	public List<Account> findPageByConditions(AccountPage ap);
	public Integer countRowsByConditions(AccountPage ap);
	public void deleteById(Integer id);
	public Account findById(Integer id);
	public void updateAccount(Account acc);
	public void addAccount(Account acc);
	public Integer findIdByIdcard(String idcardNo);
	public void startById(Integer id);
	public void pauseById(Integer id);
	public String findIdcardById(Integer id);
	public Map<String, Object> findByIdCard(String idcard_no);
}
