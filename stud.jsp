
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="javax.servlet.*" %> 
   <%@ page import="javax.servlet.jsp.*" %> 
   <%@ page import="java.sql.*,java.io.*" %>

	<%     

	String action="";
		String stud_name="";
		String stud_id="";
		String stud_password="";
        	String stud_email="";
		String stud_gender="";
		String stud_date="";
		String stud_img="";
	//	File file;

	//	out.println(stud_name);
	 action=request.getParameter("action");
		  String txtadd=(String)"add";
		  String txtdelete=(String)"delete";
		  String txtupdate=(String)"update";
		  String txtedit=(String)"edit";
		  out.println(action);
	  if(action!=null)
	 {

if(action.equals(txtadd))
	 {
	
	      
	 try{  
out.println("in add");
                 
                 stud_name=request.getParameter("stud_name");
                 stud_id=request.getParameter("stud_id");
                 stud_password=request.getParameter("stud_password");
                 stud_email=request.getParameter("stud_email");
                 stud_gender=request.getParameter("stud_gender");
                 stud_date=request.getParameter("stud_date");
                 stud_img=request.getParameter("stud_img");
		 
		 // make mysql connection here
		 
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin",
		 "mis_user","india#123");
		 out.println("connected");

		 out.println("database connected");
	         String sql="insert into student(stud_name,stud_email,stud_password, stud_gender,stud_date,stud_img) values(?,?,?,?,?,?)";
		 PreparedStatement st= con.prepareStatement(sql);
		 st.setString(1, stud_name);
		 st.setString(2, stud_email);
		 st.setString(3, stud_password);
		 st.setString(4, stud_gender);
		 st.setString(5, stud_date);
st.setString(6, stud_img);

		// out.println(stud_img);
		 int s=st.executeUpdate();
		 if(s>0)
		 {
		 out.println("inserted");
		 }
		 else{
		 out.println("error");
		 }
 
		 con.close();
                }
		
		
		
		catch(Exception e)
		{
		out.print(e);
		}
		
		}
 
		
	    else if(action.equals(txtdelete))
	    {
	      // String id=request.getParameter("stud_id");
	       try
	       {
	         
                 stud_id=request.getParameter("stud_id");

		 Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin",
		 "mis_user","india#123");
		 String sql="DELETE FROM student WHERE stud_id="+stud_id;
		out.println(stud_id);
		Statement st=con.createStatement();
		int i=st.executeUpdate(sql);
		 con.close();
	 
	       out.println("Data Deleted Successfully!");
		}
		catch(Exception e)
		{
		System.out.print(e);
	 //       e.printStackTrace();
		}
		}

		else if(action.equals(txtupdate))
	      {
	      out.println("i am in update");

	       try
	      {
                 stud_name=request.getParameter("stud_name");
                 stud_id=request.getParameter("stud_id");
                 stud_password=request.getParameter("stud_password");
                 stud_email=request.getParameter("stud_email");
                 stud_gender=request.getParameter("stud_gender");
                 stud_date=request.getParameter("stud_date");
                 stud_img=request.getParameter("stud_img");
             
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin",
		 "mis_user","india#123");
	 //         out.println("database connected");
	    String sql="update student set stud_name=?,stud_email=?,stud_password=?, stud_gender=?,stud_date=?,stud_img=? where stud_id="+stud_id;
	//  String sql="update student set stud_name=? where stud_id=31";   
		 PreparedStatement st= con.prepareStatement(sql);
		 st.setString(1, stud_name);
		  st.setString(2, stud_email);
		 st.setString(3, stud_password);
		 st.setString(4, stud_gender);
		 st.setString(5, stud_date);
		 st.setString(6, stud_img);
		 out.println(stud_gender);
		 int i=st.executeUpdate();
	   //     out.println(sql);
		 con.close();
		}
		catch(Exception e)
		{
		out.print(e);
		}
		}

		else if(action.equals(txtedit))
		 {
			 out.println("i am in edit block");
	 if(stud_id!=null)
		    {
		     Connection conn = null;
		     Statement st = null;
		     ResultSet rs = null;
		     String name="";
	try
	{
		 stud_id=request.getParameter("stud_id");

		Class.forName("com.mysql.jdbc.Driver");
		conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin","mis_user","india#123");
		st=conn.createStatement();
		String sql ="select * from student where stud_id="+stud_id;
	  													
		rs = st.executeQuery(sql);
			out.println(stud_name);
		while(rs.next()){
		stud_name= rs.getString("stud_name");
		  stud_email=rs.getString("stud_email");
		  stud_password=rs.getString("stud_password");
		  stud_gender= rs.getString("stud_gender");
		  stud_date= rs.getString("stud_date");
		  stud_img= rs.getString("stud_img");
		}
		conn.close();
		}
		 catch(Exception e)
		{
		out.print(e);
		}
		 }
	       }

		}
		%>
	<!DOCTYPE html>
	<html>
	<head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>AdminLTE 3 | General Form Elements</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta name="viewport" content="width=device-width, initial-scale=1">

	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
	  <!-- Google Font: Source Sans Pro -->
	  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	</head>
	<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	  <!-- Navbar -->
	  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
	    <!-- Left navbar links -->
	    <ul class="navbar-nav">
	      <li class="nav-item">
		<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
	      </li>
	      <li class="nav-item d-none d-sm-inline-block">
		<a href="../../index3.html" class="nav-link">Home</a>
	      </li>
	      <li class="nav-item d-none d-sm-inline-block">
		<a href="#" class="nav-link">Contact</a>
	      </li>
	    </ul>

	    <!-- SEARCH FORM -->
	    <form class="form-inline ml-3">
	      <div class="input-group input-group-sm">
		<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
		<div class="input-group-append">
		  <button class="btn btn-navbar" type="submit">
		    <i class="fas fa-search"></i>
		  </button>
		</div>
	      </div>
	    </form>

	    <!-- Right navbar links -->
	    <ul class="navbar-nav ml-auto">
	      <!-- Messages Dropdown Menu -->
	      <li class="nav-item dropdown">
		<a class="nav-link" data-toggle="dropdown" href="#">
		  <i class="far fa-comments"></i>
		  <span class="badge badge-danger navbar-badge">3</span>
		</a>
		<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
		  <a href="#" class="dropdown-item">
		    <!-- Message Start -->
		    <div class="media">
		      <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
		      <div class="media-body">
			<h3 class="dropdown-item-title">
			  Brad Diesel
			  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
			</h3>
			<p class="text-sm">Call me whenever you can...</p>
			<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
		      </div>
		    </div>
		    <!-- Message End -->
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item">
		    <!-- Message Start -->
		    <div class="media">
		      <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
		      <div class="media-body">
			<h3 class="dropdown-item-title">
			  John Pierce
			  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
			</h3>
			<p class="text-sm">I got your message bro</p>
			<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
		      </div>
		    </div>
		    <!-- Message End -->
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item">
		    <!-- Message Start -->
		    <div class="media">
		      <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
		      <div class="media-body">
			<h3 class="dropdown-item-title">
			  Nora Silvester
			  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
			</h3>
			<p class="text-sm">The subject goes here</p>
			<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
		      </div>
		    </div>
		    <!-- Message End -->
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
		</div>
	      </li>
	      <!-- Notifications Dropdown Menu -->
	      <li class="nav-item dropdown">
		<a class="nav-link" data-toggle="dropdown" href="#">
		  <i class="far fa-bell"></i>
		  <span class="badge badge-warning navbar-badge">15</span>
		</a>
		<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
		  <span class="dropdown-item dropdown-header">15 Notifications</span>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item">
		    <i class="fas fa-envelope mr-2"></i> 4 new messages
		    <span class="float-right text-muted text-sm">3 mins</span>
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item">
		    <i class="fas fa-users mr-2"></i> 8 friend requests
		    <span class="float-right text-muted text-sm">12 hours</span>
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item">
		    <i class="fas fa-file mr-2"></i> 3 new reports
		    <span class="float-right text-muted text-sm">2 days</span>
		  </a>
		  <div class="dropdown-divider"></div>
		  <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
		</div>
	      </li>
	      <li class="nav-item">
		<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
		  <i class="fas fa-th-large"></i>
		</a>
	      </li>
	    </ul>
	  </nav>
	  <!-- /.navbar -->

	  <!-- Main Sidebar Container -->
	  <aside class="main-sidebar sidebar-dark-primary elevation-4">
	    <!-- Brand Logo -->
	    <a href="../../index3.html" class="brand-link">
	      <img src="../../dist/img/AdminLTELogo.png"
		   alt="AdminLTE Logo"
		   class="brand-image img-circle elevation-3"
		   style="opacity: .8">
	      <span class="brand-text font-weight-light">AdminLTE </span>
	    </a>

	    <!-- Sidebar -->
	    <div class="sidebar">
	      <!-- Sidebar user (optional) -->
	      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
		<div class="image">
		  <img src="../images/rushi.jpg" class="img-circle elevation-2" alt="User Image">
		</div>
		<div class="info">
			<a href="#"  class="text-success"> <h4>Rushi Jagdale</h4></a>  
		</div>
	      </div>

	      <!-- Sidebar Menu -->
	      <nav class="mt-2">
		<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
		  <!-- Add icons to the links using the .nav-icon class
		       with font-awesome or any other icon font library -->
		  <li class="nav-item has-treeview">
		    <a href="person.jsp" class="nav-link">
		      <i class="nav-icon fas fa-tachometer-alt"></i>
		      <p>
			Dashboard
			<i class="right fas fa-angle-left"></i>
		      </p>
		    </a>
		  </li>
		  <li class="nav-item">
		    <a href="example.jsp" class="nav-link">
		      <i class="nav-icon fas fa-th"></i>
		      <p>
			Person
			<span class="right badge badge-danger">New</span>
		      </p>
		    </a>
		  </li>
		  <li class="nav-item has-treeview">
		    <a href="one.jsp" class="nav-link">
		      <i class="nav-icon fas fa-chart-pie"></i>
		      <p>
			Charts
			<i class="right fas fa-angle-left"></i>
		      </p>
		    </a>
		      </li>
		  <li class="nav-item has-treeview">
		    <a href="#" class="nav-link">
		      <i class="nav-icon fas fa-tree"></i>
		      <p>
			UI Elements
			<i class="fas fa-angle-left right"></i>
		      </p>
		    </a>
		  </li>
		  <li class="nav-item has-treeview menu-open">
		    <a href="#" class="nav-link active">
		      <i class="nav-icon fas fa-edit"></i>
		      <p>
			Forms
			<i class="fas fa-angle-left right"></i>
		      </p>
		    </a>
		    <ul class="nav nav-treeview">
		      <li class="nav-item">
			<a href="../forms/general.html" class="nav-link active">
			  <i class="far fa-circle nav-icon"></i>
			  <p>General Elements</p>
			</a>
		      </li>
		      <li class="nav-item">
			<a href="../forms/advanced.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>Advanced Elements</p>
			</a>
		      </li>
		      <li class="nav-item">
			<a href="../forms/editors.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>Editors</p>
			</a>
		      </li>
		      <li class="nav-item">
			<a href="../forms/validation.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>Validation</p>
			</a>
		      </li>
		    </ul>
		  </li>
	      </nav>
	      <!-- /.sidebar-menu -->
	    </div>
	    <!-- /.sidebar -->
	  </aside>

	  <!-- Content Wrapper. Contains page content -->
	  <div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <div class="container-fluid">
		<div class="row mb-2">
		  <div class="col-sm-6">
		    <h1>General Form</h1>
		  </div>
		  <div class="col-sm-6">
		    <ol class="breadcrumb float-sm-right">
		      <li class="breadcrumb-item"><a href="#">Home</a></li>
		      <li class="breadcrumb-item active">General Form</li>
		    </ol>
		  </div>
		</div>
	      </div><!-- /.container-fluid -->
	    </section>

	    <!-- Main content -->
	    <section class="content">
	      <div class="container-fluid">
		<div class="row">
		  <!-- left column -->
		  <div class="col-md-6">
		    <!-- general form elements -->
		    <div class="card card-primary">
		      <div class="card-header">
			<h3 class="card-title">Add student</h3>
		      </div>
		      <form  id="myForm"  action="stud.jsp" method="post">
		              <div class="card-body">
			    <div class="form-group">
			    <label for="exampleInputName">Name</label>
			    <input type="text" name="stud_name" class="form-control" id="exampleInputName" placeholder="Enter name" value="<%=stud_name %>">
			  </div>

			  <div class="form-group">
			    <label for="exampleInputEmail1">Email address</label>
			    <input type="email" name="stud_email" value="<%=stud_email %>" class="form-control" id="exampleInputEmail1" placeholder="Enter email" >
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" name="stud_password" value="<%=stud_password %>" class="form-control" id="exampleInputPassword1" placeholder="Password">
			  </div>
			    <div class="row">
			    <div class="col-sm-6">
			  <div   class="form-group" >
				  <label  >Gender</label>
			  <select  class="form-control" name="stud_gender">

				  <option value="<%=stud_gender%>" ><%=stud_gender%></option>
                                  <option value="0" >male</option>
                                  <option value="1" >female</option>

				  <%/*
				 if(stud_gender.equals("0")) 
				  {
				  %>
                                 
				  <option value="0" selected>male</option>
				  <option value="1" >female</option>
				  <%}else{%>
				  <option value="0">male</option>
				  <option value="1" selected>female</option>
                                 <%}*/%>
				 
			  </select>
			    </div>
			    </div>
			   </div>
			     <div class="row">
			    <div class="col-sm-6">
			      <div class="form-group">
			   <label>Birth Date</label>
			   <input type="date" name="stud_date" value="<%=stud_date %>" class="form-control" placeholder="Birth date" >
			</div>
			       </div>
			</div>
			 <div class="custom-file">
				<input type="file" name="stud_img" value="" class="custom-file-input" id="exampleInputFile">
				<label class="custom-file-label" for="exampleInputFile">Choose file</label>
			      </div>
			     <div class="card-footer">
				     
				     <%
				     if(action!=null)
				      if(action.equals(txtedit))
				{%>
				  <input type="hidden" name="action" value="update">
				  <input type="hidden" name="stud_id" value="<%=stud_id %>" >
	     <button type="submit" value="update"  class="btn btn-primary-block bg-gradient-success" onclick="addFun()">UPDATE</button>
	     <%}

	    %>
	      <input type="hidden" name="action" value="add">
	      <button type="submit" value="add" class="btn btn-primary-block bg-gradient-warning" >ADD</button>
	      
	      
	   

			  </div>
			  </div>
			  </form>
		      <!-- /.card-header -->
		      <!-- form start -->
		    </div>
		    <!-- /.card -->

		    <!-- Form Element sizes -->
		    <!-- /.card -->

		    <!-- /.card -->

		    <!-- Input addon -->
		    </div>            <!-- /.card -->
		    <!-- Horizontal Form -->
		    <!-- /.card -->
		  <div class="col-md-6">
		    <div class="card">
		      <div class="card-header">
			<h3 class="card-title">Student Data</h3>

			<div class="card-tools pagination">XShowing : 1</div>
		      </div>
		      <!-- /.card-header -->
		      <div class="card-body p-0">
	<%
		 try
		 {
		  //  String stud_id = request.getParameter("stud_id");
		   Class.forName("com.mysql.jdbc.Driver");
		   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin",
		   "mis_user","india#123");
		    Connection conn = null;
		     Statement st = null;
		     ResultSet rs = null;
		       %>
			<table class="table">
			  <thead>
			    <tr>
			      <th>#</th>
			      <th>Name</th>
			      <th>Date</th>
			      <th></th>
			      <th></th>

			    </tr>
			  </thead>
			  <tbody>
	 <%
		   st=con.createStatement();
		  String sql ="select * from student";
		 // out.println(sql);
	     rs = st.executeQuery(sql);
		  while(rs.next())
		  {

		 // out.println(rs.getString("stud_name"));
		  %>
			    <tr>
			    <td><%=rs.getString("stud_id") %></td>
			      <td class="text-success" title=""><%=rs.getString("stud_name") %></td>
			      <td><%=rs.getString("stud_date") %></td>
			      <td><image src="<%=stud_date%>" width="150" height="200"/></td>
 
			      <td><a href='?stud_id=<%=rs.getString("stud_id")%>&action=edit' type="submit" class="btn btn-sm btn-primary">Edit</a></td>

			      <td>
					 <form role="form" action="addstudent.jsp" method="post"  >
				      <a href='?stud_id=<%=rs.getString("stud_id")%>&action=delete' type="submit" class="btn btn-sm btn-danger" onclick="myFunction()" >Delete</a>
			       <input type="hidden" name="action" value="delete" >
					<input type="hidden" name="stud_id" value="<%=stud_id %>" >
		    
					 </form>

			      </td>
			    </tr>
	<%
	       }
		con.close();
		}
		catch (Exception e) {
		e.printStackTrace();
		}
			%>

			  </tbody>
			</table>
	<ul class="pagination">
	  <li><a href="#">1</a></li>
	  <li><a href="#">2</a></li>
	  <li><a href="#">3</a></li>
	  <li><a href="#">4</a></li>
	  <li><a href="#">5</a></li>
	</ul>
		      </div>
		      <!-- /.card-body -->
		    </div>
		    <!-- /.card -->

		  </div>


		  <!--/.col (left) -->
		  <!-- right column -->
		      <!-- /.card-body -->
		    <!-- /.card -->
		    <!-- general form elements disabled -->


		    <!-- /.card -->
		  </div>
		  <!--/.col (right) -->
		</div>
		<!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </section>
	    <!-- /.content -->
	  <!-- /.content-wrapper -->
	  <footer class="main-footer">
	    <div class="float-right d-none d-sm-block">
	      <b>...</b> 
	    </div>
	    <strong>Copyright &copy; 2020 <a href="http://adminlte.io">RJ</a>.</strong> All rights
	    reserved.
	  </footer>

	  <!-- Control Sidebar -->
	  <aside class="control-sidebar control-sidebar-dark">
	    <!-- Control sidebar content goes here -->
	  </aside>
	  <!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script src="../../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
	  bsCustomFileInput.init();
	});
		function myFunction() {
	  alert("data deleted successfully");
	}
		function addFun() {
	  alert("data added successfully");
	}

	</script>
	</body>
</html>
