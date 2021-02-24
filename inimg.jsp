  <%@ page import="java.io.File" %>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="javax.servlet.*" %>
   <%@ page import="javax.servlet.jsp.*" %>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
<%
try{              
Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin",
                 "mis_user","india#123");
                 out.println("connected");

               String path=request.getRealPath("images"); 
		 File file = new File(path+"/img.jpg");
                 FileInputStream fis=new FileInputStream(file);
		 // out.println("database connected");
             String sql="insert into student(stud_name,stud_email,stud_password, stud_gender,stud_date,stud_img) values(?,?,?,?,?,?)";
                 PreparedStatement st= con.prepareStatement(sql);
                 st.setString(1, "Ram");
                 st.setString(2, "rj@gmailcom");
                 st.setString(3, "1234");
                 st.setString(4, "male");
                 st.setString(5, "05/12/2020");
st.setBinaryStream(6,fis, (int)fis.available());

                // out.println(stud_img);
                 int s=st.executeUpdate();
                 if(s>0)
                 {
                 out.println("inserted");
                 }
                 else{
                 out.println("error");
                 }
		 }
		 catch(Exception e)
		 {
		 out.println(e);
		 }
		 %>
