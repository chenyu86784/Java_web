<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <br>
  
  <%
  int length=6;

  StringBuffer sb = new StringBuffer();
  Random a = new Random();
  for (int i = 0; i < length; ++i) {
		int number = a.nextInt(9);
		sb.append(number);
		}		
  System.out.print(sb+"\n");
  try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();			
			String selectStr="insert into yanzhenma values ("+sb+")";
			System.out.print(selectStr+"\n");
			PreparedStatement pst=conn.prepareStatement(selectStr);
			int rs=pst.executeUpdate();
			
			if(rs!=0){
        out.print("已发送验证码，请留意邮箱，不要刷新跳转页面！！！");
        st.close();		
            }
            else{
            out.print("出现错误！请联系网站管理员");
        
            }
      }
      catch (Exception e) {        
            out.print("数据库连接异常！请联系网站管理员");  
        }  
  String email;
  email=request.getParameter("email");
  response.setHeader("Refresh", "2;url=https://service-8x3y6w18-1257826237.gz.apigw.tencentcs.com/prepub/jsp?key="+sb+"&email="+email);

  %>
  
  
  
  
  
  </body>
</html>
