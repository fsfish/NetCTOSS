<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
        </script>
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
                <li><a href="../role/role_list.html" class="role_on"></a></li>
                <li><a href="../admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="../fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="../account/account_list.html" class="account_off"></a></li>
                <li><a href="../service/service_list.html" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">           
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="update.from" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                	<input type="hidden" name="id" value="${rolePrivi.role.id}"/>
                    <input type="text" name="name" class="width200" value="${rolePrivi.role.name}" />
                    <span class="required">*</span> 
                    <div class="validate_msg_medium error_msg">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                        <c:forEach items="${rolePrivi.allPrivileges}" var="p">
                        	<!-- 把遍历的每一个privilege的id传回rolePrivi对象的
                        	(用于二次遍历特殊定义的)privi_id属性,在方法内在遍历时做匹配值-->
                        	<c:set target="${rolePrivi}" 
                        		property="privi_id" value="${p.id}"></c:set>
                        	<c:choose>
                        	<c:when test="${rolePrivi.checked}">
                        	<li>
                        		<input type="checkbox" value="${p.id}" 
                        		checked name="rolePrivis"/>${p.name}
                        	</li>
                        	</c:when>
                        	<c:otherwise>
                        	<li>
                        		<input type="checkbox"  value="${p.id}"
                        		name="rolePrivis"/>${p.name}
                        	</li>
                        	</c:otherwise>
                        </c:choose>
                        </c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick='location.href="list.from"'/>
                </div>
            </form> 
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)加拿大达内IT培训集团公司 </span>
        </div>
    </body>
</html>
