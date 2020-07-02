<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" >
<head>
 <base href="<%=basePath%>">
<meta charset="UTF-8">

<title>找回密码</title>
<meta http-equiv="pragma" content="no-cache" method="get">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/style.css">

</head>
<body>

<form class="form" action="forget.jsp" autocomplete="off">
  <div class="form-inner">
    <h2>找回密码</h2>
    <div class="input-wrapper">
      <label for="login-username">邮箱</label>
      <div class="input-group"><span class="icon">
          <svg viewBox="0 0 24 24">
            <path d="M12,4A4,4 0 0,1 16,8A4,4 0 0,1 12,12A4,4 0 0,1 8,8A4,4 0 0,1 12,4M12,14C16.42,14 20,15.79 20,18V20H4V18C4,15.79 7.58,14 12,14Z"></path>
          </svg></span>
        <input type="text" id="login-username" data-lpignore="true" name="email">
      </div>
    </div>
   
    <div class="btn-group">
      <button class="btn btn--primary" >获取验证码</button>
      </form>
     
    </div>
  </div>



</body>
</html>