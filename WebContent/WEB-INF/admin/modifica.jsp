<%@page import="estados.QueryMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificación</title>
<style type="text/css">

body { 
  background-color : #EEEEEE;
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  line-height: 1;
  padding: 22px 10px;
  padding-bottom: 55px;
} 

.box {
	width: 500px;
	height: 250px;
	background-color: #ABB7B7;
	margin: 80px auto auto auto;
	text-align: center;
	font-size: 35px;
}

.space {
	height: 50px;
}

.ph-button {
	width : 80px;
    border-style: solid;
    color: #FFFFFF;	   
    cursor: pointer;
    font-style: normal;
    overflow: hidden;
    text-align: center;
    text-decoration: none;
    text-overflow: ellipsis;
    transition: all 200ms ease-in-out 0s;	
    font-family: "Gotham Rounded A","Gotham Rounded B",Helvetica,Arial,sans-serif;
    font-weight: 700;	
    font-size: 12px;
	
}

.mod-button {

    border-style: solid;
    color: #FFFFFF;	   
    cursor: pointer;
    font-style: normal;
    overflow: hidden;
    text-align: center;
    text-decoration: none;
    text-overflow: ellipsis;
    transition: all 200ms ease-in-out 0s;	
    font-family: "Gotham Rounded A","Gotham Rounded B",Helvetica,Arial,sans-serif;
    font-weight: 700;	
    font-size: 18px;
    height: 32px;
    width: 130px;
}

/*Green
==========================*/
.ph-btn-green {

    border-color: #019875;
	background-color: #019875;

}
.ph-btn-green:hover, .ph-btn-green:focus, .ph-btn-green:active {
    background-color: #27ae60;
    border-color: #27ae60;    
}

   #logo1{

height: 200px;
width: 200px;
 margin: 0px 10px auto auto;
    float: left;
    
   display: block;
    padding: 0; 

   
    
}

</style>
</head>
<body>
<%

String id = request.getParameter("id");
String query = "";
String mensaje = "Ocurrió un error";
String exitoso = "";

if ( request.getParameter("modUsuario") !=  null ){
	
	String usuario = request.getParameter("usuario");
	String nombre = request.getParameter("nombre");
	String apellidos = request.getParameter("apellidos");
	String correo = request.getParameter("correo");
	String telefono = request.getParameter("telefono");
	String password = request.getParameter("pass");
	String rol = request.getParameter("rol");
	
	query  = "update Usuarios set noEmpleado = '" + usuario + "' , nombre = '" + nombre 
			+ "' , apellidos = '" +  apellidos + "' , rolEmpleado = " + rol + ","
			+ "correo = '" + correo + "', telefono = " +  telefono  + ", password = " + " AES_ENCRYPT('" + password + "', 'Mexico01') "
			+ "where idUsuario = " +  id;
	exitoso = "Modificación exitosa";
	
}else if (request.getParameter("bloqUsuario") !=  null){
	query = "update Login set intentos = 100 where idUsuario = " + id ;
	exitoso = "Bloqueo existoso";
	
}else if (request.getParameter("desbloqUsuario") !=  null){
	query = "update Login set intentos = 0 where idUsuario = " + id ;
	exitoso = "Desloqueo existoso";
	
}else if (request.getParameter("desactUsuario") !=  null){
	query = "update Usuarios set idActivo = 0 where idUsuario = " + id;
	exitoso = "Desactivación exitosa";
	
}else if (request.getParameter("actUsuario") !=  null){
	query = "update Usuarios set idActivo = 1 where idUsuario = " + id;
	exitoso = "Activación exitosa";
}

if (QueryMaker.executeUpdate(query)){
	mensaje = exitoso;
}




%>

<div id="logo1">
 <img id="logoP" alt="" src="imagenes/logo2.jpg">
</div>
<div class = "box">
<div class="space"></div>
<%= mensaje%>

<div class="space"></div>
<form action="CapturaUsuarios" method="Post" id ="myForm">
<input type="hidden" name="regreso">
<input class='mod-button ph-btn-green' type="submit"  value="Regresar">
</form>


</div>

</body>
</html>