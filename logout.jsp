<%@page import="java.util.*" %>
<%
session.invalidate(); %>
<b> you are loged out
	<%
response.sendRedirect("userlogin.jsp");
%>

