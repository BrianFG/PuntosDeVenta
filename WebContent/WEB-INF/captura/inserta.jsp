<%@page import="estados.QueryMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="captura.Inserta"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inserción</title>
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
String query  = "nothing";

if (request.getParameter("inEstado")!=null){
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInEstado(nombre);
}else if (request.getParameter("inZona")!=null){
	String estado = request.getParameter("est");
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInZona(nombre, estado);
}else if (request.getParameter("inSubZona")!=null){
	String zona = request.getParameter("zon");
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInSubZona(nombre, zona);
}else if (request.getParameter("inTipo")!=null){
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInTipo(nombre);
}else if (request.getParameter("inCategoria")!=null){
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInCategoria(nombre);
}else if (request.getParameter("inCadena")!=null){
	String nombre = request.getParameter("new");
	query  = Inserta.getQueryInCadena(nombre);
}else if (request.getParameter("inPunto")!=null){
	String subzona = request.getParameter("sub");
	String tipo = request.getParameter("tip");
	String cadena = request.getParameter("cad");
	String categoria = request.getParameter("cat");
	String nombre = request.getParameter("nomPunto");
	String direccion = request.getParameter("dir");
	String lng = request.getParameter("lng");
	String lat = request.getParameter("lat");
	String dotacion = request.getParameter("dot");
	query  = Inserta.getQueryInPunto(subzona, tipo, categoria, cadena, nombre, direccion, lng, lat, dotacion);

}
String mensaje = "";
if (QueryMaker.executeUpdate(query)){
	mensaje = "Inserción exitosa";
}else{
	mensaje = "Error";
}
%>
<div id="logo1">
 <img id="logoP" alt="" src="imagenes/logo2.jpg">
</div>
<div class = "box">
<div class="space"></div>
<%= mensaje%>

<div class="space"></div>
<form action="Captura" method="Post" id ="myForm">
<input type="hidden" name="captura1">
<input class='mod-button ph-btn-green' type="submit"  value="Regresar">
</form>
</div>
</body>
</html>