<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" />  
    </head>
    <body>
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <c:out value="${map[\"loginUser\"]}"></c:out><a href="login.jsp">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="./index.jsp" class="index_off"></a></li>
                <li><a href="./showAllMeterReaders" class="role_off"></a></li>
                <li><a href="" class="account_off"></a></li>
                <li><a href="" class="fee_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="" class="bill_off"></a></li>
                <li><a href="" class="report_off"></a></li>
                <li><a href="./modifyPassword" class="password_off"></a></li>
            </ul>          
        </div>
		<div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="" method="post" class="main_form">
                    <div class="text_info clearfix"><span>电费发行日期：</span></div>
                    <div class="input_info">
                        <input name="name" type="text"/>
                    </div>                    
                    <div class="text_info clearfix"><span>电费单价：</span></div>
                    <div class="input_info">
                        <input type="text" name="password"/>
                    </div>     
      				<div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save"/>
                        <input type="button" value="取消" class="btn_save" onclick="location.href='showAllMeterReaders';"/>
                    </div>
      		</form>
      	</div>
    </body>
</html>
