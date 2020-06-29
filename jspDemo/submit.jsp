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
  String user;
  String passwd;  
  user=request.getParameter("username");
  passwd=request.getParameter("passwd");
 
       try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute?useUnicode=true&characterEncoding=UTF8"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();			
			String selectStr="select * from user_info where uid="+"'"+user+"'"+" and passwd="+"'"+passwd+"'";
			System.out.print(selectStr+"\n");
		    ResultSet result=null;
		    result=st.executeQuery(selectStr);		
			String status="";
			String names="";
			while (result.next()){
			status=result.getString("uid");
			names=result.getString("name");	     
            }
            String a,b;
            a=status;
            b="2018030848";
            if (status==""){
			out.print("登录失败 请检查您的用户名及密码！"+"<br>"+"(五秒后将跳转到登录页面)");
			response.setHeader("Refresh", "5;url=denglu.jsp");
    	    }
    	    else if(a.equals(b)){
    	    	out.println("登录成功! 欢迎您：可爱无敌帅气风流倜傥聪明盖世不可一世的~~~程越先生"+"<br>"+"五秒后将跳转到您的专属页面");
    	    	   st.close();
    	    	response.setHeader("Refresh", "5;url=god.jsp"); 
    	    }
    	    else{
    	    	out.print("登录成功 欢迎您:"+names+"<br>"+"五秒后将跳转到主页");
    	    	   st.close();
    	    	response.setHeader("Refresh", "5;url=index.jsp");  	    
    	   		 }
      }
      catch (Exception e) {        
            out.print("数据库连接异常！请联系网站管理员");  
        }  
		
	%>
	
	</div>  
 
  </body>
</html>
