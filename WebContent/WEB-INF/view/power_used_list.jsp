<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global_color.css" />    
		<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		function doLogout() {
 		    $.get("admin/logout",function(data){
		        if(data=="logout"){  
		          alert("退出系统");
		          location="./login.jsp";
		        }
		    });
		}
	</script>   
    </head>
    <body>
        <form action="" method="post" id="form1">
			<input type="hidden" name="_method" value="delete"/>
	    </form>
        <!--Logo区域开始-->
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="./index.jsp" class="index_off"></a></li>
                <li><a href="./showAllMeterReaders" class="role_off"></a></li>
                <li><a href="./showAllTasks" class="account_off"></a></li>
                <li><a href="./showAllResults" class="fee_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="" class="bill_off"></a></li>
                <li><a href="" class="report_off"></a></li>
                <li><a href="./admin/pwd_modi" class="password_off"></a></li>
            </ul>           
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div class="search_add">
            		<form action="${pageContext.request.contextPath}/resultByMonth" method="post">
                    	<div>月份：<input class="text_search width200" type="text" name="mread_month"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form>
            </div>
            <form action="" method="post">   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                        	<th style="width:12.5%">月份</th>
                            <th style="width:12.5%">宿舍ID</th>
                            <th style="width:12.5%">上月读数</th>
                            <th style="width:12.5%">本月读数</th>
                            <th style="width:12.5%">本月用电量</th>
                            <th style="width:12.5%">剩余电量</th>
                            <th style="width:12.5%">状态</th>
                            <th style="width:12.5%">操作</th>
                        </tr> 
                        <!-- 判断是否admins元素是否是搜索id得到的一个 --> 
                        <c:if test="${fn:length(results)==0}">
                           <c:choose>
	                           <c:when test="${!empty resultSelected}">
	                        		<tr><td>${resultSelected.mread_month }</td>
	                        			<td>${resultSelected.dorm_id }</td>
										<td>${resultSelected.last_power_read }</td>
										<td>${resultSelected.power_read }</td>
										<td>${resultSelected.power_use }</td>
										<td>${resultSelected.remain_power }</td>
										<td>${resultSelected.remain_power gt 0?'正常':'欠费' }</td>
		                            	<td>
		                               		<a href="dorm/${dormSelected.id}">缴费</a>&nbsp;&nbsp;
		                            	</td>	
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
                        </c:if>                    	
             			<c:forEach var="result" items="${results }">
	                        <tr><td>${result.mread_month }</td>
	                        	<td>${result.dorm_id }</td>
								<td>${result.last_power_read }</td>
								<td>${result.power_read }</td>
								<td>
									<fmt:formatNumber value="${result.power_use }" pattern="#.00"/>
								</td>
								<td>${result.remain_power }</td>
								<td>${result.remain_power gt 0?'正常':'欠费' }</td>
	                            <td>
	                                <a href="dorm/${dorm.id}">缴费</a>&nbsp;&nbsp;
	                            </td>	
							</tr>
						</c:forEach>
                    </table>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>
