<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
    </head>
	<body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <a href="../login.jsp">[退出]</a>            
        </div>
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../index.jsp" class="index_off"></a></li>
                <li><a href="../showAllMeterReaders" class="role_off"></a></li>
                <li><a href="../showAllAdmins" class="admin_off"></a></li>
                <li><a href="../toll.jsp" class="fee_off"></a></li>
                <li><a href="../meterReade.jsp" class="account_off"></a></li>
                <li><a href="../showAllDorms" class="service_off"></a></li>
                <li><a href="../account.jsp" class="bill_off"></a></li>
                <li><a href="../report.jsp" class="report_off"></a></li>
                <li><a href="../showUserInfo" class="information_off"></a></li>
                <li><a href="../modifyPassword" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form:form action="${pageContext.request.contextPath}/admin" method="post"  modelAttribute="admin" class="main_form">
					<c:if test="${admin.adminId>0 }">
						<form:hidden path="adminId"/>
						<input type="hidden" name="_method" value="put"/>	
					</c:if>           
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                    	<form:input path="adminName" />
                    </div>
                    <div class="button_info clearfix">
                        <input value="保存" class="btn_save" type="submit"/>
                        <input value="取消" class="btn_save" type="button" onclick="location.href='../showAllAdmins';"/>
                    </div>
            </form:form>  
        </div>
</body>
</html>