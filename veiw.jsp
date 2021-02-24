<%@ page import="java.util.*,com.javatpoint.dao.*,com.javatpoint.beans.*" %>  
<%
try
{

String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=5;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  
List<Emp> list=EmpDao.getRecords(pageid,total);  
  
out.print("<h1>Page No: "+spageid+"</h1>");  
out.print("<table border='1' cellpadding='4' width='60%'>");  
out.print("<tr><th>Id</th><th>Name</th><th>Email</th><th>Password</th>");  
for(Emp e:list){  
    out.print("<tr><td>"+e.getId()+"</td><td>"+e.getFullname()+"</td><td>"+e.getEmail()+"</td><td>"+e.getPassword()+"</td></tr>");  
}  

out.print("</table>");  
}
catch(Exception e)
{
System.out.println(e);
}
%>  
<a href="veiw.jsp?page=1">1</a>  
<a href="veiw.jsp?page=2">2</a>  
<a href="veiw.jsp?page=3">3</a>  

