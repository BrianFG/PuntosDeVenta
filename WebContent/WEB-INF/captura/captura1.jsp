<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="estados.Captura"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Captura</title>
<style type="text/css">

body {
    background-image: -o-linear-gradient(bottom, #FFFFFF 37%, #065E13 100%);
background-image: -moz-linear-gradient(bottom, #FFFFFF 37%, #065E13 100%);
background-image: -webkit-linear-gradient(bottom, #FFFFFF 37%, #065E13 100%);
background-image: -ms-linear-gradient(bottom, #FFFFFF 37%, #065E13 100%);
background-image: linear-gradient(to bottom, #FFFFFF 37%, #065E13 100%);
  font-family: 'Montserrat', Arial;
  font-size: 1em;
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    text-align: center;
    color: #fff;
    height: 750px;
}
.page-container {
    overflow: hidden;
    width: 1000px;
    margin: 100px auto 0 auto;
    padding-bottom: 60px;
}

.pricing-table {
    float: left;
    width: 250px;
    margin: 17px 12px 0 12px;
    background: #f8f8f8;
    -moz-box-shadow: 0 2px 15px 0 rgba(0,0,0,.2);
    -webkit-box-shadow: 0 2px 15px 0 rgba(0,0,0,.2);
    box-shadow: 0 2px 15px 0 rgba(0,0,0,.2);
    
}

.pricing-table strong { font-weight: 700; color: #3d3d3d; }

.pricing-table-header {
    padding: 2px 0 2px 0;
    background-color: #1F3A93;

}

.pricing-table-header h2 { font-size: 16px; font-weight: 700; }
.pricing-table-header h3 { margin-top: 20px; font-size: 14px; font-weight: 400; text-shadow: 0 -2px 0 rgba(0,0,0,.25); }

.pricing-table-space { height: 7px; }

.pricing-table-text {
    
    border-bottom: 1px solid #ddd;
    text-align: center;
    line-height: 30px;
    font-size: 12px;
    color: #888;
}

.pricing-table-features {
    margin: 15px 30px 0 30px;
    padding: 0 10px 15px 10px;
    border-bottom: 1px solid #ddd;
    text-align: center;
    line-height: 30px;
    font-size: 16px;
    color: #888;
}

.pricing-table-sign-up {
    margin-top: 25px;
    padding-bottom: 30px;
}

.pricing-table-sign-up a {
    display: inline-block;
    width: 180px;
    height: 40px;
    background: #3d3d3d;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#494949), to(#3e3e3e));
    background-image: -webkit-linear-gradient(top, #494949, #3e3e3e);
    background-image: -moz-linear-gradient(top, #494949, #3e3e3e);
    background-image: -o-linear-gradient(top, #494949, #3e3e3e);
    background-image: -ms-linear-gradient(top, #494949, #3e3e3e);
    background-image: linear-gradient(to bottom, #494949, #3e3e3e);
    line-height: 40px;
    font-size: 20px;
    color: #fff;
    text-decoration: none;
    text-transform: uppercase;
    text-shadow: 0 -2px 0 rgba(0,0,0,.25);
    -o-transition: all .2s;
    -moz-transition: all .2s;
    -webkit-transition: all .2s;
    -ms-transition: all .2s;
}

.pricing-table-sign-up a:hover {
    text-decoration: none;
    -moz-box-shadow: 0 -5px 10px 0 rgba(0,0,0,.2) inset;
    -webkit-box-shadow: 0 -5px 10px 0 rgba(0,0,0,.2) inset;
    box-shadow: 0 -5px 10px 0 rgba(0,0,0,.2) inset;
}

.pricing-table-sign-up a:active {
    -moz-box-shadow: 0 3px 8px 0 rgba(0,0,0,.2) inset;
    -webkit-box-shadow: 0 3px 8px 0 rgba(0,0,0,.2) inset;
    box-shadow: 0 3px 8px 0 rgba(0,0,0,.2) inset;
}


/* Highlighted table */

.pricing-table-highlighted {
    margin-top: 0;
    float: 
}

.pricing-table-highlighted .pricing-table-header {
    background: #628842;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#76a04f), to(#648a43));
    background-image: -webkit-linear-gradient(top, #76a04f, #648a43);
    background-image: -moz-linear-gradient(top, #76a04f, #648a43);
    background-image: -o-linear-gradient(top, #76a04f, #648a43);
    background-image: -ms-linear-gradient(top, #76a04f, #648a43);
    background-image: linear-gradient(to bottom, #76a04f, #648a43);
}

.pricing-table-highlighted .pricing-table-sign-up a {
    background: #628842;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#76a04f), to(#648a43));
    background-image: -webkit-linear-gradient(top, #76a04f, #648a43);
    background-image: -moz-linear-gradient(top, #76a04f, #648a43);
    background-image: -o-linear-gradient(top, #76a04f, #648a43);
    background-image: -ms-linear-gradient(top, #76a04f, #648a43);
    background-image: linear-gradient(to bottom, #76a04f, #648a43);
}


/*
    Name:           ph-buttons
    Description: 	Pixcil Hub Buttons
    Author: 		   Pixcils®
    Version: 	  	1.0
*/

/*Main button class
==========================*/
.ph-button {
	width : 97.9%;
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

.ph-btn-orange {

    border-color: #F89406;
	background-color: #F89406;

}
.ph-btn-orange:hover, .ph-btn-orange:focus, .ph-btn-orange:active {
    background-color: #E87E04;
    border-color: #E87E04;    
}

.ph-btn-purple {

    border-color: #AEA8D3;
	background-color: #AEA8D3;

}
.ph-btn-purple:hover, .ph-btn-purple:focus, .ph-btn-purple:active {
    background-color: #BE90D4;
    border-color: #BE90D4;    
}



/*Blue
==========================*/
.ph-btn-blue {

    border-color: #3498db;
    background-color: #3498db;
}

.ph-btn-blue:hover, .ph-btn-blue:focus, .ph-btn-blue:active {
    background-color: #2980b9;
    border-color: #2980b9;   
}

/*Grey
==========================*/
.ph-btn-grey {

     background-color: #C6CCD2;
     border-color: #AAB3BB;
}
.ph-btn-grey:hover, .ph-btn-grey:focus, .ph-btn-grey:active {
    background-color: #B8BFC7;
    border-color: #AAB3BB; 
}

/*Red
==========================*/
.ph-btn-red {

    background-color: #e74c3c ;
    border-color: #e74c3c ;

}
.ph-btn-red:hover, .ph-btn-red:focus, .ph-btn-red:active {
    background: #c0392b;
    border-color: #c0392b ;    
}


/*DEMO ONLY FOR CENTER POSITION*/
.ph-container {
  #3b8ec2
  margin: 0 auto;
  display: inline;
servlets utf-8
  
}

.ph-float {
  
  float: left;
  width: 22%;
  padding: 10px;  
  padding-top: 50px;  
  text-align: center;

}

.ph-clear {    border-style: solid;
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
  
  clear: both;
   
}


select {

   width:200px;

   font-size: 12px;
   border: none;
      overflow: hidden;
   background-color: 	#C8F7C5;
}

.wrapper {
  height: 380px;
  width: 840px;
  background:#ECF0F1;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

.box2 {
  height: 200px;
  width: 840px;
  background:#C2FFAD;
  margin: 20px auto auto auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

.boxElimina{
  height: 150px;
  width: 450px;
  background:#66CC99;
  margin: 20px auto auto auto;
  font-size: 20px;
  color : 	#1F1F14;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);

}

.boxModifica{
  height: 100px;
  width: 450px;
  background:#90C695;
  margin: 20px auto auto auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);

}

.boxInserta{
  height: 100px;
  width: 450px;
  background:#68C3A3;
  margin: 20px auto auto auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

.boxInsertaPun{
  height: 180px;
  width: 350px;
  background:#2ECC71;
  margin: 20px auto auto auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

.boxInsertaPunText input{
	background : #66CC99;
	border: none;
	width: 80%;
	margin: 2px auto 2px auto;
}

.modText {
	background: transparent;
	border: none;
	text-align: center;
	font-size: 18px;
	width: 420px;
}

.boxFinal {
  height: 50px;
  width: 450px;
  background: transparent;
  margin: 328px auto auto auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

.header {
	height: 50px;
	width: 1100px;
	text-align: center;
	margin: auto;
	color : #22313F;
}

.logo {
	height: 50px;
	width: 1200px;
	text-align: left;
	margin: auto;
}

</style>

<script type="text/javascript">

function confirma(){
	return confirm("¿Seguro que desea relaizar esta acción?");
}
</script>
</head>

<%

ResultSet estados = Captura.getEstados();
ResultSet zonas = Captura.getZonas();
ResultSet subZonas = Captura.getSubZonas();
ResultSet tipos = Captura.getTipos();
ResultSet categorias = Captura.getCategorias();
ResultSet cadenas = Captura.getCadenas();
ResultSet rel = Captura.getRelacionCCT();
%>
<script type="text/javascript">
var tipo = "";
var cadena = "";
var categoria = "";

var zonasArr = new Array();
<%int i = 0;
while (zonas.next()){ %>
	zonasArr[<%=i%>] = ["<%=zonas.getString(1)%>","<%=zonas.getString(2)%>","<%=zonas.getString(3)%>" ];<%i++;}%>

var subZonasArr = new Array();
<%i = 0;
while (subZonas.next()){ %>
	subZonasArr[<%=i%>] = ["<%=subZonas.getString(1)%>","<%=subZonas.getString(2)%>","<%=subZonas.getString(3)%>"];<%i++;}%>

var tiposArr = new Array();
<%i = 0;
while (tipos.next()){ %>
	tiposArr[<%=i%>] = ["<%=tipos.getString(1)%>", "<%=tipos.getString(2)%>"];<%i++;}%>

var catArr = new Array();
<%i = 0;
while (categorias.next()){ %>
	catArr[<%=i%>] = ["<%=categorias.getString(1)%>", "<%=categorias.getString(2)%>"];<%i++;}%>

var cadArr = new Array();
<%i = 0;
while (cadenas.next()){ %>
	cadArr[<%=i%>] = ["<%=cadenas.getString(1)%>", "<%=cadenas.getString(2)%>" ];<%i++;}%>

var relArr = new Array();
<%i = 0;
while (rel.next()){ %>
	relArr[<%=i%>] = ["<%=rel.getString(1)%>","<%=rel.getString(2)%>","<%=rel.getString(3)%>","<%=rel.getString(4)%>","<%=rel.getString(6)%>","<%=rel.getString(7)%>"];<%i++;}%>

function clear (valor){
	document.getElementById(valor).innerHTML ="";
	document.getElementById("modificacion").innerHTML ="";
	document.getElementById("insertar").innerHTML ="";
};

function goZonas($i) {
	var select = "<div class='pricing-table-header'><h2>Zona</h2>" 
	+ "<select name=\"zon\" onclick=\"goSubZonas(value);\">";
	for (var j = 0 ; j < zonasArr.length; j++){
		if (zonasArr[j][2] == $i){
			select+= "<option value =\"" + zonasArr[j][0] + "\">" + zonasArr[j][1] +"</option>" ;
		}
	}
	select+= "</select>";
	select+= "<div class='pricing-table-space'></div></div><div class='pricing-table-text'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-red'  value=\"Eliminar Zona\" onclick= \"eliminarZona()\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-blue'  value=\"Modificar Zona\"  onclick=\"modificar('Nuevo nombre de la Zona' , 'modZona');\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-green' value=\"Agregar Zona\"  onclick=\"insertar('Nueva Zona' , 'inZona');\">";
	select+= "</div></div>"
	clear("subZonas");clear("tipos");clear("categorias");clear("cadenas");clear("final");
	document.getElementById("zonas").innerHTML = select;
   };
   
function goSubZonas($i){
	var select =  "<div class='pricing-table-header'><h2>SubZona</h2>" 
		+"<select name=\"sub\" onclick =\"goTipos();\">";
	for (var j = 0 ; j < subZonasArr.length; j++){
		if (subZonasArr[j][2] == $i){
			select+= "<option value =\"" + subZonasArr[j][0] + "\">" + subZonasArr[j][1] +"</option>" ;
		}
	}
	select += "</select>";
	select+= "<div class='pricing-table-space'></div></div><div class='pricing-table-text'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-red'  value=\"Eliminar SubZona\" onclick= 'eliminarSubZona();'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-blue' value=\"Modificar SubZona\"  onclick=\"modificar('Nuevo nombre de la SubZona' , 'modSubZona');\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-green' value=\"Agregar SubZona\"  onclick=\"insertar('Nueva SubZona' , 'inSubZona');\">";
	select+= "</div></div>"
	clear("tipos");clear("categorias");clear("cadenas");clear("final");
	document.getElementById("subZonas").innerHTML = select;
}; 

function goTipos(){
	var select = "<div class='pricing-table-header'><h2>Tipo de Establecimiento</h2>" 
		+ "<select name=\"tip\" onclick=\"goCategoria(value);\">";
	for (var j = 0 ; j < tiposArr.length; j++){
		select+= "<option value =\"" + tiposArr[j][0] + "\">" + tiposArr[j][1] +"</option>" ;
	}
	select += "</select>";
	select+= "<div class='pricing-table-space'></div></div><div class='pricing-table-text'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-red'  value=\"Eliminar Tipo\" onclick='eliminarTipo();'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-blue' value=\"Modificar Tipo\"  onclick=\"modificar('Nuevo nombre del Tipo de Establecimiento' , 'modTipo');\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-green' value=\"Agregar Tipo de Establecimiento\"  onclick=\"insertar('Nuevo Tipo' , 'inTipo');\">";
	select+= "</div></div>"
	clear("categorias");clear("cadenas");clear("final");
	document.getElementById("tipos").innerHTML = select;
};

function goCategoria($i){
	tipo = $i;
	var select = "<div class='pricing-table-header'><h2>Categoria</h2>"  
		+"<select name=\"cat\" onclick=\"goCadena(value);\">";
	var arr = new Array();
	for (var j = 0 ; j < relArr.length; j++){
		if (relArr[j][2] == tipo){
			if (arr.indexOf(relArr[j][3]) == -1){
				select+= "<option value =\"" + relArr[j][3] + "\">" + relArr[j][4] +"</option>" ;
			}
			arr[j] = relArr[j][3];
		}
	}
	select += "</select>";
	select+= "<div class='pricing-table-space'></div></div><div class='pricing-table-text'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-red'  value=\"Eliminar Categoria\" onclick='eliminarCategoria();'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-blue'value=\"Modificar Categoria\"  onclick=\"modificar('Nuevo nombre de la Categoria' , 'modCategoria');\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-green' value=\"Agregar Categoria\"  onclick=\"insertar('Nueva Categoria' , 'inCategoria');\">";
	select+= "</div></div>"
	clear("cadenas");clear("final");
	document.getElementById("categorias").innerHTML = select;	
};

function goCadena ($i){
	categoria = $i;
	var select = "<div class='pricing-table-header'><h2>Cadena</h2>"
		+"<select name=\"cad\" onclick=\"goFinal(value);\">";
	var arr = new Array();
	for (var j = 0 ; j < relArr.length; j++){
		if (relArr[j][2] == tipo && relArr[j][3] == categoria){
			if (arr.indexOf(relArr[j][1]) == -1){
				select+= "<option value =\"" + relArr[j][1] + "\">" + relArr[j][5] +"</option>" ;
			}
			arr[j] = relArr[j][1];
		}
	}
	select+= "</select>";
	select+= "<div class='pricing-table-space'></div></div><div class='pricing-table-text'>";
    select+= "<input readonly='readonly' class='ph-button ph-btn-red'  value=\"Eliminar Cadena\" onclick='eliminarCadena();'>";
	select+= "<input readonly='readonly' class='ph-button ph-btn-blue' value=\"Modificar Cadena\"  onclick=\"modificar('Nuevo nombre de la Cadena' , 'modCadena');\">";
	select+= "<input readonly='readonly' class='ph-button ph-btn-green' value=\"Agregar Cadena\"  onclick=\"insertar('Nueva Cadena' , 'inCadena');\">";
	select+= "</div></div>";
	clear("final");
	document.getElementById("cadenas").innerHTML = select;	
};

function goFinal (){
	var select = "<div class = 'boxFinal' ><input class='ph-button ph-btn-orange' type=\"submit\" name=\"delmodPunto\" value=\"Ir a Puntos de Venta\">";
	select += "<input readonly='readonly' class='ph-button ph-btn-purple' type=\"button\"  value=\"Agregar Punto de Venta\" onclick=\"insertarPunto();\"></div>";
	document.getElementById("final").innerHTML = select;	

};

function modificar(accion , ac){
	var mod = "<div class='boxModifica'><br><input class ='modText' type=\"text\" name=\"nuevo\" value=\"" + accion + "\"><br><br>";
	mod += "<input readonly='readonly' class='mod-button ph-btn-blue' type=\"submit\" name=\""+ ac + "\" value=\"Modificar\"></div>";
	clear("insertar");clear("eliminar");
	document.getElementById("modificacion").innerHTML = mod;
	document.getElementById('modificacion').scrollIntoView();
};

function insertar(accion, ac){
	var ins = "<div class='boxInserta'><br><input class ='modText' type=\"text\" name=\"new\" value=\"" + accion + "\">";
	ins += "<br><br><input class='mod-button ph-btn-green' type=\"submit\" name=\""+ ac + "\" value=\"Insertar\"></div>";
	clear("modificacion");clear("eliminar");
	document.getElementById("insertar").innerHTML = ins;
	document.getElementById('insertar').scrollIntoView();
};

function insertarPunto(){
	var puntoN = "<div class='boxInsertaPun'><div class='boxInsertaPunText'><input type=\"text\" name=\"nomPunto\" value=\"Nombre del Punto\">";
	puntoN += "<input type=\"text\" name=\"dir\" value=\"Dirección\">";
	puntoN += "<input type=\"text\" name=\"lng\" value=\"Longitud\">";
	puntoN += "<input type=\"text\" name=\"lat\" value=\"Latitud\">";
	puntoN += "<input type=\"text\" name=\"dot\" value=\"Dotación\"></div>";
	puntoN += "<br><input type=\"submit\" name=\"inPunto\" value=\"Insertar\"></div>";
	clear("modificacion");clear("eliminar");
	document.getElementById("insertar").innerHTML = puntoN;	
	document.getElementById('insertar').scrollIntoView();
};

function eliminarEstado(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta pertenecientes al Estado asi como las Zonas y SubZonas"
	+ " contenidas dentro de él<br><br>";
	elimina += "<input class='mod-button ph-btn-red' type=\"submit\" name=\"delEstado\" value=\"Confirmar\"></div>";
	clear("modificacion");clear("insertar");
	document.getElementById("eliminar").innerHTML = elimina;	
	document.getElementById('eliminar').scrollIntoView();
};

function eliminarZona(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta pertenecientes a la Zona asi como SubZonas"
		+ " contenidas dentro de ella<br><br>";
		elimina += "<input class='mod-button ph-btn-red'  type=\"submit\" name=\"delZona\" value=\"Confirmar\"></div>";
		clear("modificacion");clear("insertar");
		document.getElementById("eliminar").innerHTML = elimina;
		document.getElementById('eliminar').scrollIntoView();
};

function eliminarSubZona(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta pertenecientes a la SubZona"
		+ " <br><br>";
		elimina += "<input class='mod-button ph-btn-red'  type=\"submit\" name=\"delSubZona\" value=\"Confirmar\"></div>";
		clear("modificacion");clear("insertar");
		document.getElementById("eliminar").innerHTML = elimina;
		document.getElementById('eliminar').scrollIntoView();
};

function eliminarTipo(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta clasificados con este Tipo de Establecimiento"
		+ "<br><br>";
		elimina += "<input class='mod-button ph-btn-red'  type=\"submit\" name=\"delTipo\" value=\"Confirmar\"></div>";
		clear("modificacion");clear("insertar");
		document.getElementById("eliminar").innerHTML = elimina;
		document.getElementById('eliminar').scrollIntoView();
};

function eliminarCadena(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta clasificados con esta Cadena"
		+ "<br><br>";
		elimina += "<input class='mod-button ph-btn-red'  type=\"submit\" name=\"delCadena\" value=\"Confirmar\"></div>";
		clear("modificacion");clear("insertar");
		document.getElementById("eliminar").innerHTML = elimina;
		document.getElementById('eliminar').scrollIntoView();
};

function eliminarCategoria(){
	var elimina = "<div class='boxElimina'>Se eliminaran todos los Puntos de venta clasificados con esta Categoría"
		+ "<br><br>";
		elimina += "<input class='mod-button ph-btn-red'  type=\"submit\" name=\"delCategoria\" value=\"Confirmar\"></div>";
		clear("modificacion");clear("insertar");
		document.getElementById("eliminar").innerHTML = elimina;
		document.getElementById('eliminar').scrollIntoView();
};

</script>
<body>

<div class= "logo">
<img id="logoP" alt="" src="imagenes/logo2.jpg">
</div>

 <div class ="header">
  
  <h1>Captura</h1>
  </div>
<form action="Captura" method="Post"  onsubmit ="return confirma();">

<div class="wrapper">
<div id="estados" class='pricing-table'>
<div class='pricing-table-header'>
<h2>Estado</h2>
<select name="est" onclick="goZonas(value);">
<%while(estados.next()){ %>
<option value = "<%=estados.getString(1)%>"><%=estados.getString(2)%></option><%}%>
</select>
<div class="pricing-table-space"></div>
</div>
<div class="pricing-table-text">
<input readonly='readonly' class='ph-button ph-btn-red'  value="Eliminar Estado" onclick='eliminarEstado();'>
<input readonly='readonly' class='ph-button ph-btn-blue' value="Modificar estado" onclick="modificar('Nuevo nombre del Estado' , 'modEstado');">
<input readonly='readonly' class='ph-button ph-btn-green' value="Agregar estado" onclick="insertar('Nuevo Estado' , 'inEstado');">
</div>
</div>


<div id="zonas" class="pricing-table"></div>
<div id="subZonas" class="pricing-table"></div>
<div id="tipos" class="pricing-table"></div>
<div id="categorias" class="pricing-table"></div>
<div id="cadenas" class="pricing-table"></div>
<div id="final"></div>
</div>

<div id="modificacion"></div>
<div id="insertar" ></div>
<div id="eliminar"> </div>

</form>
</body>
</html>