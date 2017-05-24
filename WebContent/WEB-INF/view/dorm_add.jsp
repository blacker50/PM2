<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
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
		<div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form:form action="${pageContext.request.contextPath}/dorm/add" method="post" 
             modelAttribute="dorm" class="main_form">
                    <div class="text_info clearfix"><span>楼号：</span></div>
                    <div class="input_info">
                        <form:input path="building" name="building" type="text"/>
                    </div>  
                    <div class="text_info clearfix"><span>宿舍号：</span></div>
                    <div class="input_info">
                        <form:input path="num_id" name="num_id" type="text"/>
                    </div>  
                    <div class="text_info clearfix"><span>舍长姓名：</span></div>
                    <div class="input_info">
                        <form:input path="name" name="name" type="text"/>
                    </div>                    
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <form:input name="phone" path="phone" type="text"/>
                    </div>   
                    <div class="text_info clearfix"><span>剩余可用电量：</span></div>
                    <div class="input_info">
                        <form:input path="remain_power" name="remain_power" type="text"/>
                    </div>  
      				<div class="button_info clearfix">
                        <input type="submit" value="保存" class="btn_save"/>
                        <input type="button" value="取消" class="btn_save" onclick="location.href='showAllDorms';"/>
                    </div>
      		</form:form>
      	</div>
    </body>
</html>
