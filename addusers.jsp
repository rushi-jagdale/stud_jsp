<%@ page import="java.sql.*" %>
<%
String fname="";
String email="";
String pass="";
//String Retypepassword=request.getParameter("Retypepassword");
%>
<%
String id = request.getParameter("id");
String action=(String)request.getParameter("action");
//out.println(action);
//String txtupdate=(String)"update";
//String txtadd=(String)"add";
//if(action.equals(txtupdate)
//out.println(id);
Connection conn = null;
Statement st = null;
ResultSet rs = null;
if(id!=null)
{

	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin","mis_user","india#123");
	st=conn.createStatement();
	String sql ="select * from users where id="+id;
	out.println(sql);
	rs = st.executeQuery(sql);
		//out.println(rs);
	while(rs.next()){
		fname = rs.getString("Fullname");
		//out.println(fname);
		email = rs.getString("Email");
		pass  = rs.getString("Password");
	}
	conn.close();
	}

	out.println(id);
%>



<!DOCTYPE html>
<html>


<head>
					
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | DataTables</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->


	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini" >
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
  <script>
	function validate(){
	var Fullname=document.myform.Fullname;

	var Email=document.myform.Email;
	var Password=document.myform.Password;
	var Retypepassword=document.myform.Retypepassword;

	if (Fullname.value==null || Fullname.value==""){
	  alert("Name can't be blank");
	Fullname.focus();                                       
	  return false;
	}
         if (Email.value==null || Email.value==""){
          alert("Email can't be blank");
        Email.focus();                                       
          return false;
        }
  if (Password.value==null || Password.value==""){
          alert("Password can't be blank");
        Password.focus();                                       
          return false;
        }
									     
     
       if(Password.length<6){
	  alert("Password must be at least 6 characters long.");
          Password.focus();       
          return false;

   }
   if (Retypepassword.value==null){
          alert("please Retype password");
        Retypepassword.focus();                                       
          return false;
        }
									     
									     
}
 </script>
                 
      <form name="myform" method="post" action="users.jsp" onsubmit="return validate();" >

	      <% if(id==null) {%>
	      <input type="hidden" id="thisField" name="action" value="add">
	 <%    }
	 else {  %>
	     <input type="hidden" id="thisField" name="action" value="update">
	     <input type="hidden" id="Field" name="id" value="<%=id%>">
	
	     <% }
	  %>
	      <div class="form-group">
                    <label for="exampleInputFullname">Fullname</label>
                    <input type="text"  name="Fullname" class="form-control" id="exampleInputEmail1" placeholder="Enter Fullname" value="<%=fname %>">
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email"name="Email"  class="form-control" id="exampleInputEmail1" placeholder="Enter email" value="<%=email %>">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
		    <input type="password" name="Password"  class="form-control" id="exampleInputPassword1" placeholder="Password" value="<%=pass %>">

		  </div>
                   <div class="form-group">
			   <label for="exampleInputPassword1">ConfirmPassword</label>
                    <input type="password" name="RetypePassword"  class="form-control" id="exampleInputPassword1" placeholder="ConfirmPassword">

		  </div>

                <div class="card-footer">
			<button type="submit" value="submit"  class="btn btn-primary" > Submit</button>
			
                </div>
              </form>

</body>
</html>
