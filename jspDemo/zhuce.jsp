<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style1.css">
  <title>用户注册</title>
      
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
</head>
<body>
<form  action="submit2.jsp" autocomplete="off">
  <div class="reg_div">
  <p>注册劳力士枯燥俱乐部</p>
  
    <ul class="reg_ul">
      <li>
          <span>用户名：</span>
          <input type="text" name="username" value="" placeholder="4-8位用户名" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
          <span>账号：</span>
          <input type="text" name="uid" value="" placeholder="登录账号 16位字符以内" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
          <span>密码：</span>
          <input type="password" name="" value="" placeholder="6-16位密码" class="reg_password">
          <span class="tip password_hint"></span>
      </li>
      <li>
          <span>确认密码：</span>
          <input type="password" name="passwd" value="" placeholder="确认密码" class="reg_confirm">
          <span class="tip confirm_hint"></span>
      </li>
      <li>
          <span>邮箱：</span>
          <input type="email" name="email" value="" placeholder="邮箱" class="reg_email">
          <span class="tip email_hint"></span>
      </li>
      <li>
          <span>手机号：</span>
          <input type="text" name="phone" value="" placeholder="手机号" class="reg_mobile">
          <span class="tip mobile_hint"></span>
      </li>
     
      <li>
          <span>学历：</span>
          <input type="text" name="stu" value="" placeholder="博士 硕士 本科 专科 幼儿园" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
          <span>资产：</span>
          <input type="text" name="money" value="" placeholder="资产低于六位数就不要注册了好咩" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
        <button type="submit" name="button" class="red_button">提交注册</button>
      </li>
    </ul>
  </div>
  
  </form>

  <div style="text-align:center;">
<p ><a href="https://github.com/chenyu86784/Java_web" target="_blank"> Java Web程越小组</a></p>
</div>
</body>
</html>
