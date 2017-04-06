<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css">
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css">
        <script type="text/javascript" src="jquery-1.7.2.min.js"></script>  
		<script type="text/javascript">   
		function adminLogin() {
 		    $.post("admin/login",$("#loginForm").serialize(),function(data){
		        if(data=="true"){  
		          alert("登录成功!");  
		          location="index.jsp";  
		        }else{  
		          alert("登录失败!");  
		          return false;
		        }  
		    });
		}
		function meterReaderLogin() {
 		    $.post("meterReader/login",$("#loginForm").serialize(),function(data){  		          
		        if(data=="true"){  
		          alert("登录成功!");  
		          location="mr_index.jsp";  
		        }else{  
		          alert("登录失败!"); 
		          return false;
		        }  
		    }); 
		}
		function doLogin() {
			//var roles = document.getElementsByName("roles");
			//alert($('#roles option:selected').val());
			/*
				jquery获取界面元素的值，对应的需要id和name一起下
			*/
			var name=$('#name').val();
			var password=$('#password').val();
			if(name=="" || name==null || password=="" || password==null) {
		   		alert("用户名和密码均不能为空!");
		   		return false;
			}
			if($('#roles option:selected').val()=="admin")
				adminLogin();
			else if($('#roles option:selected').val()=="meterReader")	
				meterReaderLogin();
		}
		</script>  
    </head>
	<body class="index">
        <div class="login_box">
        <form action="" method="post" id="loginForm">
            <table>
                <tbody><tr>
                    <td class="login_info">账号：</td>
                    <td colspan="2"><input id="name" name="name" class="width150" type="text"></td>
                </tr>
                <tr>
                    <td class="login_info">密码：</td>
                    <td colspan="2"><input id="password" name="password" class="width150" type="password"></td>
                </tr> 
                <tr>
                    <td class="login_info">登录类型：</td>
                    <td colspan="2"><select name="roles" id="roles" class="select_search">
                            <option value="admin">管理员</option>
                            <option value="meterReader">抄表员</option>
                        </select>
                    </td>
                </tr>          
                <tr>
                    <td></td>
                    <td class="login_button" colspan="2">
                        <input type="image" src="images/login_btn.png" onclick="doLogin()"/>
                    </td>    
                    <td><span class="required"></span></td>                
                </tr> 
            	</tbody>
            </table>
            </form>
        </div>
	</body>
</html>