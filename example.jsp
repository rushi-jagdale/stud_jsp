<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
	    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>jstl tag example</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
   <body class="hold-transition sidebar-mini">
<div class=" wrapper">

	   <jsp:include page="header.html" /> 
	   <jsp:include page="slider.html" /> 
	   <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/myadmin"
         user = "mis_user"  password = "india#123"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from person;
      </sql:query>
       <section class="content">

<div class="content-wrapper">
 <div class="container-fluid">

       <div class="row">

       <div class="col-md-6">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Student Data</h3>

              </div>

       <div class="card-body p-0">
 
      <table  class="table">
         <tr>
            <th>Person ID</th>
            <th>Person Name</th>
            <th>Company </th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id}"/></td>
               <td><c:out value = "${row.name}"/></td>
               <td><c:out value = "${row.owner}"/></td>
            </tr>
         </c:forEach>
      </table>
       </div>
       </div>
</div>
       </div>
 </div>

 </div>
       </section>

	   <jsp:include page="footer.html" /> 
</div>

   </body>
</html>
