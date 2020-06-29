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
  String email;
  String key;  
  String passwd; 
  email=request.getParameter("email");
  key=request.getParameter("key");
  passwd=request.getParameter("passwd");
  try {  
            Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
            String url = "jdbc:mysql://127.0.0.1:3306/cloudcompute?useUnicode=true&characterEncoding=UTF8"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			Statement st;
			st=conn.createStatement();			
			String selectStr="select * from yanzhenma where num="+key;
			System.out.print(selectStr+"\n");
		    ResultSet result=null;
		    result=st.executeQuery(selectStr);	
		    if(result !=null){
        	out.print("验证成功！");
        	String selectStr2="UPDATE user_info SET passwd="+"'"+passwd+"'"+" where email="+"'"+email+"'";
        	PreparedStatement pst=conn.prepareStatement(selectStr2);
		    int rs=pst.executeUpdate();
		    if(rs!=0){
             out.print("修改成功! ");
             response.setHeader("Refresh", "2;url=denglu.jsp"); 
			   st.close();
            }
         
            else{
            out.print("修改失败！请检查列值是否正确");           
            }
			st.close();
			}else{
			out.print("验证失败！请检查验证码是否正确");
			st.close();
			}
			 }catch (Exception e) {        
            out.print("数据库连接异常！请联系网站管理员");  
        }  
  
  
  %>
  
  
  
  
  
  </body>
</html>
