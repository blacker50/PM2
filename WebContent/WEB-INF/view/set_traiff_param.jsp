<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="/PM2/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/PM2/styles/global_color.css" /> 
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
        <!--Logo区域开始-->
        <div id="header">
            <img src="/PM2/images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javascript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../index.jsp" class="index_off"></a></li>
                <li><a href="../showAllMeterReaders" class="role_off"></a></li>
                <li><a href="../showAllTasks" class="account_off"></a></li>
                <li><a href="../showAllResults" class="fee_off"></a></li>
                <li><a href="../showAllDorms" class="service_off"></a></li>
                <li><a href="" class="bill_off"></a></li>
                <li><a href="" class="report_off"></a></li>
                <li><a href="../admin/pwd_modi" class="password_off"></a></li>
            </ul>             
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main"> 
     		<form action="${pageContext.request.contextPath}/showTraiffParam" method="post">
     		<div class="text_info clearfix"><span>电费单价（元/度）：</span></div>
            <div class="input_info"><span>${traiffParam.unit_price }</span></div>
            <div class="text_info clearfix"><span>每月用电补贴（度）：</span></div>
            <div class="input_info"><span>${traiffParam.basic_power }</span></div>
		    <div class="button_info clearfix">
		       <input value="返回" class="btn_save" type="button" onclick="location.href='../showTraiffParam';"/>
		    </div>
            </form>
        </div>
</body>
</html>