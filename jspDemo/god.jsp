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
background:#00FFFF;
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
    
    <title>越の上帝模式！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.center{
margin:0 auto ; 
text-align:center
}
</style>
  </head>
  
  <body bgcolor="#40E0D0">

 <center><font size="15" color="#FFA500">欢迎来到上帝模式！</font></center> 
 <div class="center">
 <form action="god.jsp" autocomplete="off">
 <br>
 <a>输入要制裁的uid:</a>
 <input type="text" id="login-username" data-lpignore="true" name="uid">
 
  <button type="submit"  class="red_button">寻人！</button>

 </form>
 </div>
 <div class="center">
 查询结果：
 <% 
 String uid;
 uid=request.getParameter("uid");
 try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();
			
			String selectStr="select * from user_info where uid="+"'"+uid+"'";
		    ResultSet result=null;
		    result=st.executeQuery(selectStr);

			while (result.next()){
			out.println("姓名："+result.getString("name"));
			out.println("账号："+result.getString("uid"));
			out.println("密码："+result.getString("passwd"));
			out.println("邮箱："+result.getString("email"));
			out.println("手机号："+result.getString("phone"));
			out.println("学历："+result.getString("stu"));
			out.println("资产："+result.getString("money"));
			}  
			st.close();
			}catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  
 %>
 
 <div class="center">
 <form action="god.jsp" autocomplete="off">
 <br>
 <a>输入要修改的uid:</a>
 <input type="text" id="login-username" data-lpignore="true" name="test2">
 <a>输入要更改的字段:</a>
 <input type="text" id="login-username" data-lpignore="true" name="test">
  <a>；输入更改后的值:</a>
 <input type="text" id="login-username" data-lpignore="true" name="test1">
 
 
  <button type="submit"  class="red_button">送去改造！</button>

 </form>
 </div>
 </div>
  <div class="center">
 修改结果：
 <% 
 String test,test1,test2;
 test=request.getParameter("test");
 test1=request.getParameter("test1");
 test2=request.getParameter("test2");
 try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();
			
			String selectStr="UPDATE user_info SET "+test+"="+"'"+test1+"'"+" where uid="+"'"+test2+"'";
			System.out.print(selectStr+"\n");
		    PreparedStatement pst=conn.prepareStatement(selectStr);
		    int rs=pst.executeUpdate();
		    if(rs!=0){
        out.print("修改成功! ");
			   st.close();
            }
         
            else{
            out.print("修改失败！请检查列值是否正确");           
            }

      }catch (Exception e) {        
            //out.print("数据库连接异常！请联系网站管理员");  
        }  
 
 %>
  <div class="center">
 <form action="god.jsp" autocomplete="off">
 <br>
 <a>输入要删除的uid:</a>
 <input type="text" id="login-username" data-lpignore="true" name="test3">
  <button type="submit"  class="red_button">送去非洲！</button>

 </form>
 </div>
 </div>
<div class="center">
 删除结果：
 <% 
 String test3;
 test3=request.getParameter("test3");

 try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();
			
			String selectStr="delete from user where uid="+"'"+test3+"'";
			String selectStr2="delete from user_info where uid="+"'"+test3+"'";
			System.out.print(selectStr+"\n");
		    
		    PreparedStatement pst=conn.prepareStatement(selectStr);
		    PreparedStatement pst2=conn.prepareStatement(selectStr2);
		    
		    int rs=pst.executeUpdate();
		    int rs2=pst2.executeUpdate();
		    
		    if(rs!=0){
        out.print("已送上前往非洲的飞机！");
			    st.close();
            }
        
            else{
           // out.print("删除失败！请检查uid是否正确");           
            }

      }catch (Exception e) {        
            //out.print("数据库连接异常！请联系网站管理员");  
        }  
 %>
 <hr>
 <center><font size="12" color="#FFA500">网站注册用户信息</font></center>
<%
  
   try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();			
			String selectStr="select * from user_info";
			System.out.println(selectStr);
		    ResultSet result=null;
		    result=st.executeQuery(selectStr);
		    String names="";
		    while (result.next()){
			out.println("姓名："+result.getString("name"));
			out.println("uid："+result.getString("uid"));
			out.println("密码："+result.getString("passwd"));
			out.println("邮箱："+result.getString("email"));			
			out.println("电话："+result.getString("phone"));
			out.println("学历："+result.getString("stu"));
			out.println("资产："+result.getString("money")+"<br>");
			}  
			st.close();
		    
  		}catch (Exception e) {        
            out.print("数据库连接异常！请联系网站管理员");  
        }  
		
  
  
   %>
 
 

 
 
 
 
 

  </body>
</html>
