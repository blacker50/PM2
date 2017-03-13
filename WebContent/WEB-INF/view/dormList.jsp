<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global_color.css" />       
    </head>
    <body>
    	<form action="" method="post" id="form1">
			<input type="hidden" name="_method" value="delete"/>
	    </form>
        <!--Logo区域开始-->
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <a href="login.jsp">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="./index.jsp" class="index_off"></a></li>
                <li><a href="./showAllMeterReaders" class="role_off"></a></li>
                <li><a href="./showAllAdmins" class="admin_off"></a></li>
                <li><a href="./toll.jsp" class="fee_off"></a></li>
                <li><a href="./meterReader.jsp" class="account_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="./account.jsp" class="bill_off"></a></li>
                <li><a href="./report.jsp" class="report_off"></a></li>
                <li><a href="./showUserInfo" class="information_off"></a></li>
                <li><a href="./modifyPassword" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
        	<div class="search_add">
        			<form:form action="${pageContext.request.contextPath}/dorm" modelAttribute="dorm">
                    	<div>宿舍ID：<form:input class="text_search width200" type="text" path="dormId"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form:form>
                    <input value="增加" class="btn_add" onclick="location.href='./dorm';" type="button"/>
            </div>
            <form action="" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>宿舍ID</th>
                            <th>联系电话</th>
                            <th>余额</th>
                        </tr>                      	
             			<c:forEach var="dorm" items="${dorms }">
							<tr><td>${dorm.dormId }</td>
								<td>${dorm.dormName }</td>
								<td>${dorm.balance }</td>
	                            <td>
	                                <a href="dorm/${dorm.dormId}">编辑</a>&nbsp;&nbsp;
	                                <a href="dorm/${dorm.dormId}" class="delete">删除</a>
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