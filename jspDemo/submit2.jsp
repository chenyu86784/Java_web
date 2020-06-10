<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
html,body {
width: 100%;
height: 100%;
margin: 0;
padding: 0;
}
.content {
width: 500px; 
height: 300px;
background: #FFB6C1;
margin: 0 auto; /*水平居中*/
position: relative;
top: 508;
margin-top:-150px; 
font-size:30px
}
</style>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'submit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#FFB6C1">
  
  <div class="content">
  <%
  
  //out.print("username:"+request.getParameter("username"));   
  //out.print("passwd:"+request.getParameter("passwd"));
  String user,passwd,uid,email,phone,love,stu,money;

  user=request.getParameter("username");
  passwd=request.getParameter("passwd");
  uid=request.getParameter("uid");
  email=request.getParameter("email");
  phone=request.getParameter("phone");
  love=request.getParameter("love");
  stu=request.getParameter("stu");
  money=request.getParameter("money");
  
  
 
       try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();			
			String selectStr="insert into user_info(name,uid,passwd,email,phone,stu,money) values ('"+user+"','"+uid+"','"+passwd+"','"+email+"','"+phone+"','"+stu+"','"+money+"')";
			String selectStr2="insert into user(uid,passwd,name) values ('"+uid+"','"+passwd+"','"+user+"')";
			System.out.print(selectStr+"\n");
			System.out.print(selectStr2+"\n");
		    PreparedStatement pst=conn.prepareStatement(selectStr);
		    PreparedStatement pst2=conn.prepareStatement(selectStr2);
        int rs=pst.executeUpdate();
        int rs2=pst2.executeUpdate();
        
        if(rs!=0){
        out.print("注册成功！ 欢迎您:"+user+"<br>"+"五秒后将跳转到登录页");
        response.setHeader("Refresh", "5;url=denglu.jsp"); 
        st.close();
			
            }
            else{
            out.print("注册失败！请检查注册值是否符合要求；五秒后将跳转到注册页面！");
            response.setHeader("Refresh", "5;url=zhuce.jsp"); 
            
            }

           
      }
      catch (Exception e) {        
            out.print("数据库连接异常！请联系网站管理员");  
        }  
		
	%>
	
	</div>  
 
  </body>
</html>
