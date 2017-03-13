<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css">
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css"> 
    </head>
	<body class="index">
        <div class="login_box">
            <table>
                <tbody><tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input name="id" class="width150" type="text"></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input name="password" class="width150" type="password"></td>
                </tr> 
                <tr>
                    <td class="login_info">登录类型：</td>
                    <td colspan="2"><select name="" class="select_search">
                            <option>管理员</option>
                            <option>抄表员</option>
                        </select>
                    </td>
                </tr>          
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                        <a href="showAllAdmins"><img src="images/login_btn.png"></a>
                    </td>    
                    <td><span class="required"></span></td>                
                </tr>
            	</tbody>
            </table>
        </div>
	</body>
</html>