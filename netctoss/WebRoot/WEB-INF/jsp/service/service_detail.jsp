﻿<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="../index.html" class="index_off"></a></li>
                <li><a href="../role/list.from" class="role_off"></a></li>
                <li><a href="../admin/list.from" class="admin_off"></a></li>
                <li><a href="../fee/list.from" class="fee_off"></a></li>
                <li><a href="../account/list.from" class="account_on"></a></li>
                <li><a href="../service/list.from" class="service_off"></a></li>
                <li><a href="../bill/list.from" class="bill_off"></a></li>
                <li><a href="../report/list.from" class="report_off"></a></li>
                <li><a href="../user/list.from" class="information_off"></a></li>
                <li><a href="../user/list.from" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <form:form commandName="serviceLine" action="" method="post" cssClass="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info">
                <form:input path="id" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info">
                <form:input path="account_id" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>客户姓名：</span></div>
                <div class="input_info">
                <form:input path="real_name" readonly="true" cssClass="readonly"/></div>
                <div class="text_info clearfix"><span>身份证号码：</span></div>
                <div class="input_info">
                <form:input path="idcard_no" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                <form:input path="unix_host" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info">
                <form:input path="os_username" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <form:select path="status" disabled="true">
                        <form:option value="0">开通</form:option>
                        <form:option value="1">暂停</form:option>
                        <form:option value="2">删除</form:option>
                    </form:select>                        
                </div>
                <div class="text_info clearfix"><span>开通时间：</span></div>
                <div class="input_info">
                <form:input path="create_date" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>资费 ID：</span></div>
                <div class="input_info">
                <form:input path="cost_id" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                <form:input path="cost_name" readonly="true" cssClass="width200 readonly" /></div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <form:textarea path="cost_descr" readonly="true" cssClass="width300 height70 readonly" ></form:textarea>
                </div>  
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick='location.href="list.from"'/>
                </div>
            </form:form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)加拿大达内IT培训集团公司 </span>
        </div>
    </body>
</html>
