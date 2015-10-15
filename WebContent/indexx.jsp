<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1" %>  
<%
String message = (String)request.getAttribute("message");
String tipo = (String)request.getAttribute("tipo");
%>
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>Login Application</title>

 <link rel="stylesheet" href="http://sscol.jebal.comuv.com/css/font.css">

  <!-- Bootstrap -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="<%= request.getContextPath() %>/css/flatUI.css" rel="stylesheet">
<style type="text/css">
.center{
text-align: center;
}

</style>
</head>  
<body >
<div class="container">

<%if (message!= null){ %>
    <div class="alert alert-<%= tipo.equals("error") ? "warning" : "success" %>">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
<%=message %>
    </div>
<%}%>

<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">                    
<div class="panel panel-success" >
<div class="panel-heading center">
<img alt="" src="imagenes/logo2.jpg" id="logo">
<div class="panel-title">Acceso a App de Mapas</div></div>     

<div style="padding-top:30px" class="panel-body" >

<div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>  
<form id="loginform" class="form-horizontal" role="form" action="loginServlet" method="post">
            
	<div style="margin-bottom: 25px" class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	<input id="login-username" type="text" class="form-control" name="username" value="" placeholder="No. empleado">                                        
	</div>

	<div style="margin-bottom: 25px" class="input-group">
	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	<input id="login-password" type="password" class="form-control" name="userpass"  placeholder="Password">
	</div>
	
	
    


	<div style="margin-top:10px" class="form-group">
	<div class="col-sm-12 controls">
	<input id="btn-login" type="submit" class="btn btn-primary btn-lg btn-block" value ="Ingresar">
	</div>
	</div>
  
</form>     
</div>                     
</div>  
</div>

  
</div>
</body>
<footer class="footer">
<div class="container">
<p>© Copyright 2014 Metro International</p>  
</div>          
</footer>  
</html>



















































