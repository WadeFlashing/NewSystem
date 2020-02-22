<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>注册页面</title>
    <style>
        * { margin: 0; padding: 0; }
        html { height: 100%; }
        body { height: 100%; background: #fff url(images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
        .dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 600px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
        
        .form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 30px;}
        .form-item input { width: 350px; height: 45px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        .form-item button { width: 350px; height: 35px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
        .form-item2 input { width: 350px; height: 45px; padding-left: 70px;  border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        #username { background: url(images/emil.png) 20px 14px no-repeat; }
        #password { background: url(images/password.png) 23px 11px no-repeat; }
        .tip { display: none; position: absolute; left: 20px; top: 52px; font-size: 14px; color: #f50; }
        .reg-bar { width: 360px; margin: 20px auto 0; font-size: 14px; overflow: hidden;}
        .reg-bar a { color: #fff; text-decoration: none; }
        .reg-bar a:hover { text-decoration: underline; }
        .reg-bar .reg { float: left; }
        .reg-bar .forget { float: right; }
        .dowebok ::-webkit-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok ::-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-ms-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
		
        @media screen and (max-width: 500px) {
            * { box-sizing: border-box; }
            .dowebok { position: static; width: auto; height: auto; margin: 0 30px; border: 0; border-radius: 0; }
            .logo { margin: 50px auto; }
            .form-item { width: auto; }
            .form-item input, .form-item button, .reg-bar { width: 100%; }
        }
    </style>
  </head>
  
  <body>
     <div class="dowebok">
        <br><br>
        <form  name="form2"  method="post" action="register">
        <div class="form-item">
            <input  type="text" name="username" id="username"  placeholder="账号">
            
        </div>
        <div class="form-item">
            <input  type="password"  name="password" id="password" placeholder="密码">
        </div>
      
            <font color="white">&emsp;&emsp;&emsp;性别：</font>
            <label><input name="sex" type="radio" value="men" /><font color="white">  男</font> </label> &emsp;&emsp;
			<label><input name="sex" type="radio" value="women" /><font color="white">  女</font></label>   
			   
		<br><br>
		<div class="form-item2">
				&emsp;&emsp;<input  type="text" name="phone" placeholder="手机号码" >
				<br><br>
				&emsp;&emsp;<input type="text" name="address" placeholder="地址" >
			</div>
			<br><br>
        <div class="form-item"><button type="submit" id="submit" >注册</button></div>
       <div class="form-item"><button type="reset" id="reset" >重置</button></div>
        </form>
         
    </div>
    <script src="images/jquery.min.js"></script>
  </body>
</html>
