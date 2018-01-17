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
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc")
                    btnObj.className = "sort_asc";
                else
                    btnObj.className = "sort_desc";
            }

            //启用
            function startFee(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                document.getElementById("operate_result_info").style.display = "block";
            	window.location.href="start.from?id="+id;
            }
            //删除
            function deleteFee(id) {//通过js传入一个参数
                var r = window.confirm("确定要删除此资费吗？");
                if(r){//当true时
               		document.getElementById("operate_result_info").style.display = "block";
            		//发出/fee/list.from?id=x
            		window.location.href="delete.from?id="+id;
            	}
            }
        </script>        
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
			<span>当前账号：<b>scott</b></span>
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
            <form action="" method="">
                <!--排序-->
                <div class="search_add">
                    <div>
                        <input type="button" value="月租" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="基费" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="时长" class="sort_asc" onclick="sort(this);" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toadd.from';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>
                        <c:forEach items="${costs}" var="cost">                      
	                        <tr>
	                            <td>${cost.id}</td>
	                            <td><a href="detail.from?id=${cost.id}">${cost.name}</a></td>
	                            <td>${cost.base_duration} 小时</td>
	                            <td>${cost.base_cost } 元</td>
	                            <td>${cost.unit_cost } 元/小时</td>
	                            <td>${cost.creatime}</td>
	                            <td>${cost.startime}</td>
	                            <td>${cost.status=="1"?"暂停":"开通"}</td>
	                            <td> 
	                            <c:if test='${cost.status=="1"}'>                               
	                                <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.id});" />
	                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toupdate.from?id=${cost.id}';" />
	                                <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${cost.id});" /><!-- 调用了一个js脚本 -->
	                            </c:if><!-- 判断是否是暂停状态，是才展示修改等选项 -->
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                	 <c:choose>
                		<c:when test="${page.current>1}">
                			<a href="list.from?current=${page.current-1}">上一页</a>
                		</c:when>
                		<c:otherwise>
                			<a>上一页</a>
                		</c:otherwise>
                	</c:choose>
                	<c:forEach begin="1" end="${page.totalPage}" var="p">
                		<c:choose>
                			<c:when test="${p==page.current}">
                				<a class="current_page">${p}</a>
                			</c:when>
                			<c:otherwise>
                				<a href="list.from?current=${p}">${p}</a>
                			</c:otherwise>
                		</c:choose>
                		
                	</c:forEach>
                    <c:choose>
                    	<c:when test="${page.current<page.totalPage}">
                    		<a href="list.from?current=${page.current+1}">下一页</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a>下一页</a>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
