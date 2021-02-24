<%@ page import="java.sql.*" %>

<%
                String Email=request.getParameter("Email");
//              if(Email==Email)
//              {
                out.println(Email);
//              session.putValue("Fullname",Fullname);
                String Password=request.getParameter("Password");
                //out.println(Password);
//              session.putValue("Fullname",Fullname);
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin","mis_user","india#123");
                Statement st= con.createStatement();
                //ResultSet rs=st.executeQuery("select * from users where Fullname='"+Fullname+"'");
                String sql="select * from users where  Email='"+ Email +"' and Password='"+ Password +"'";
                //out.println(sql);
                ResultSet rs=st.executeQuery(sql);
                int x=0;
               if(rs.next()){
               //         out.println(rs.getString(2));
                       // out.println("hello");
		       session.setAttribute("email",Email);
                       response.sendRedirect("users.jsp");


			}
			else
			{		
			out.println("<b>invalid username and password");
			}

		 %>

