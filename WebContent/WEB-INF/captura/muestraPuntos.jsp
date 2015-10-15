<%@page import="estados.QueryMaker"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Puntos de Venta</title>
<style >


html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { overflow-y: scroll; }
body { 
  background:  url(<%= request.getContextPath() %>/images/greenp.png); /* http://subtlepatterns.com/weave/ */
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 62.5%;
  line-height: 1;
  color: #585858;
  padding: 22px 10px;
  padding-bottom: 55px;
}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 3.6em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
  color: #E4F1FE;
}


/** page structure **/
#wrapper {
  width: 1100px;
  height: 350px;
  background:#D2D7D3;
  margin: 85px auto auto auto;
  overflow: auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #5CB8E6;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('http://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('http://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
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

.ph-btn-orange {

    border-color: #F89406;
	background-color: #F89406;
	width : 180px;

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


.box1 {
  height: 150px;
  width: 1000px;
  background:#66CC99;
  margin: 20px auto auto auto;
  font-size: 20px;
  color : 	#1F1F14;
  -webkit-box-shadow: 20px 20px 30px -10px rgba(0,0,0,0.35);
  text-align: center;
  

}



.inDir{
	width: 380px;
}

.inNum{
	width : 165px;
}

.in{
	width : 70px;
}

.space{
	height: 20px;
}

table {
	text-align: center;
}

.header {
	height: 100px;
	width: 1100px;
	text-align: center;
}

.header input {
	float: right;
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
<script type="text/javascript">
function modificar(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var direccion = document.getElementById("b" +id).innerHTML;
	var lng = document.getElementById("c" +id).innerHTML;
	var lat = document.getElementById("d" +id).innerHTML;
	var dotacion = document.getElementById("e" +id).innerHTML;
	
	var mod = "<div class = 'box1'><div class='space'></div> <table>";
	mod += "<tr><td>Nombre</td><td>Dirección</td><td>Longitud</td><td>Latitud</td><td>Dotación</td></tr>";
	mod += "<tr><td><input class = 'inNum'type=\"text\" name=\"nombre\" value=\"" + nombre + "\"></td>";
	mod += "<td><input class = 'inDir' type=\"text\" name=\"dir\" value=\"" + direccion + "\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"lng\" value=\"" + lng + "\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"lat\" value=\"" + lat + "\"></td>";
	mod += "<td><input class = 'in'type=\"text\" name=\"dotacion\" value=\"" + dotacion + "\"></td></tr></table>";
	mod += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	mod += "<div class='space'></div><input readonly='readonly' class='mod-button ph-btn-blue' type=\"submit\" name=\"modPunto\" value=\"Modificar\"></div></div>";
	
	document.getElementById("modifica").innerHTML = mod;
	document.getElementById('modifica').scrollIntoView();

};



function eliminar(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var elimina = "<div class = 'box1'><div class='space'></div>Elimnar el punto de venta " + nombre + "<br><br>";
	elimina += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	elimina += "<div class='space'></div><input readonly='readonly' class='mod-button ph-btn-red' type=\"submit\" name=\"delPunto\" value=\"Confirmar\" ></div></div>";
	document.getElementById("elimina").innerHTML = elimina;
	document.getElementById('elimina').scrollIntoView();
};

function confirma(){
	return confirm("¿Seguro que desea relaizar esta acción?");
}

</script>
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

String query = "select PuntoDeVenta.* , RelacionTipoCadenaCategoria.idTipo from PuntoDeVenta , RelacionTipoCadenaCategoria"
 + " where idRelacionTipoCadenaCategoria = idRelacion"
 + " and idSubzona  = " + subzona 
 + " and idTipo = " +  tipo + " and idCategoria = " + categoria + " and idCadena = " + cadena;

 ResultSet rs = QueryMaker.executeQuery(query);


 %>

 <div class ="header">
  <img id="logoP" alt="" src="imagenes/logo2.jpg">
  <h1>Puntos de Venta</h1>

<form action="Captura" method="Post">
<input class='ph-button ph-btn-orange' type="submit"  value="Regresar">
<input type="hidden" name="captura1">
</form>
</div>
<form action="Captura" method="Post" id ="myForm" onsubmit ="return confirma();">
 <div id="wrapper">

 <table id="keywords" >
  <thead>
      <tr>
        <th><span>Nombre</span></th>
        <th><span>Dirección</span></th>
        <th><span>Longitud</span></th>
        <th><span>Latitud</span></th>
        <th><span>Dotación</span></th>
      </tr>
  </thead>
<%while (rs.next()){ String id = rs.getString(1);%>
<tr>
<td id = "<%="a"+ id%>"><%=rs.getString(2)%></td>
<td id = "<%="b"+ id%>"><%=rs.getString(3)%></td>
<td id = "<%="c"+ id%>"><%=rs.getString(7)%></td>
<td id = "<%="d"+ id%>"><%=rs.getString(8)%></td>
<td id = "<%="e"+ id%>"><%=rs.getString(9)%></td>
<td><input readonly='readonly' class='ph-button ph-btn-blue'  value="Modificar" onclick="modificar(<%= id  %> );"></td>
<td><input readonly='readonly' class='ph-button ph-btn-red'  value="Eliminar" onclick="eliminar(<%= id  %> );"></td>
</tr>
<%}rs.close(); %>
</table>
</div>
<div id = "modifica"></div>
<div id = "elimina"></div>

<input type="hidden" name="est" value="<%=estado%>">
<input type="hidden" name="zon" value="<%=zona%>">
<input type="hidden" name="sub" value="<%=subzona%>">
<input type="hidden" name="tip" value="<%=tipo%>">
<input type="hidden" name="cat" value="<%=categoria%>">
<input type="hidden" name="cad" value="<%=cadena%>">
<input type="hidden" name="pun" >

</form>

</body>

</html>