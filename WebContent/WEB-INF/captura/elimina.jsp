<%@page import="captura.Elimina"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Eliminación</title>
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

height: 200px;59ABE3
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

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String estado = request.getParameter("est");
String zona = request.getParameter("zon");
String subzona = request.getParameter("sub");
String tipo = request.getParameter("tip");
String cadena = request.getParameter("cad");
String categoria = request.getParameter("cat");

String mensaje = "";
String exito = "Eliminación existosa";
String error = "Error en la eliminación";
if (request.getParameter("delEstado")!=null){
	String idEstado = request.getParameter("est");
	mensaje = Elimina.eliminaEstado(idEstado) ? exito : error;
	
}else if (request.getParameter("delZona")!=null){
	String idZona = request.getParameter("zon");
	mensaje = Elimina.eliminaZona(idZona) ? exito : error;
	
}else if (request.getParameter("delSubZona")!=null){
	String idSubZona = request.getParameter("sub");
	mensaje = Elimina.eliminaSubZona(idSubZona) ? exito : error;
	
}else if (request.getParameter("delTipo")!=null){
	String idTipo = request.getParameter("tip");
	mensaje = Elimina.eliminaTipo(idTipo) ? exito : error;
	
}else if (request.getParameter("delCategoria")!=null){
	String idCategoria = request.getParameter("cat");
	mensaje = Elimina.eliminaCategoria(idCategoria) ? exito : error;
	
}else if (request.getParameter("delCadena")!=null){
	String idCadena = request.getParameter("cad");
	mensaje = Elimina.eliminaCadena(idCadena) ? exito : error;
	
}else if (request.getParameter("delPunto")!=null){
	String idPunto = request.getParameter("id");
	mensaje =  Elimina.eliminaPunto(idPunto) ? exito : error;
}
%>
<div id="logo1">
 <img id="logoP" alt="" src="imagenes/logo2.jpg">
</div>
<div class = "box">
<div class="space"></div>
<%= mensaje%>

<div class="space"></div>


<%if (request.getParameter("pun") != null){ %>
<form action="Captura" method="Post" id ="myForm">
<input class='mod-button ph-btn-green' type="submit"  value="Regresar">
<input type="hidden" name="est" value="<%=estado%>">
<input type="hidden" name="zon" value="<%=zona%>">
<input type="hidden" name="sub" value="<%=subzona%>">
<input type="hidden" name="tip" value="<%=tipo%>">
<input type="hidden" name="cat" value="<%=categoria%>">
<input type="hidden" name="cad" value="<%=cadena%>">
<input type ="hidden" name="delmodPunto" value ="nu">
</form>
<%} else{%>
<form action="Captura" method="Post" id ="myForm">
<input type="hidden" name="captura1">
<input class='mod-button ph-btn-green' type="submit"  value="Regresar">
</form>
<%} %>
</div>
</body>
</html>