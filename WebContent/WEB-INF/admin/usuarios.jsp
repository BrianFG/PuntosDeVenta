<%@page import="estados.QueryMaker"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administración de Usuarios</title>
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
  width: 1200px;
  height: 350px;
  background:#D2D7D3;
  margin: 85px auto auto auto;
  overflow: auto;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 10px;
}



#keywords thead {
  cursor: pointer;
  background: #5CB8E6;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 3px 9px;
  padding-left: 14px;
}
#keywords thead tr th span { 
  padding-right: 8px;
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
	width : 75px;
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
    font-weight: 600;	
    font-size: 11px;
	
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

.ph-btn-green2 {
	width : 150px;
    border-color: #00B16A;
	background-color: #00B16A;

}
.ph-btn-green2:hover, .ph-btn-green2:focus, .ph-btn-green2:active {
    background-color: #03A678;
    border-color: #03A678;    
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
  width: 1200px;
  background:#95A5A6;
  margin: 20px auto auto auto;
  font-size: 20px;
  color : 	#1F1F14;
  -webkit-box-shadow: 20px 20px 30px -10px rgba(0,0,0,0.35);
  text-align: center;
  

}



.inDir{
	width: 380px;
}

.inNom{
	width : 120px;
}
 
.inNum{
	width : 120px;
}

.inApe{
	width: 200px;
}

.inUser {
	width: 100px;
}

.space{
	height: 20px;
}

table {
	text-align: center;
}

.header {
	height: 40px;
	width: 1200px;
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


td { 
  width: 600px;
  
}



</style>

<script type="text/javascript">



function nuevo(){

	
	
	var mod = "<div class = 'box1'><div class='space'></div> <table>";
	mod += "<tr><td>Usuario</td><td>Nombre</td><td>Apellidos</td><td>Correo</td><td>Teléfono</td>";
	mod += "<td>Password</td><td>Estatus</td><td>Rol</td></tr>";
	mod += "<tr><td><input class = 'inUser'type=\"text\" name=\"usuario\"></td>";
	mod += "<td><input class = 'inNom' type=\"text\" name=\"nombre\"></td>";
	mod += "<td><input class = 'inApe' type=\"text\" name=\"apellidos\"></td>";
	mod += "<td><input class = 'inApe' type=\"text\" name=\"correo\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"telefono\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"pass\"></td>";
	mod += "<td><input type='checkbox' name='activo' name=\"estatus\">Activo</td>";
	mod += "<td>"+ select + "</td></tr></table>";
	mod += "<div class='space'></div><input class='mod-button ph-btn-green' type=\"submit\" name=\"inUsuario\" value=\"Agregar\"></div></div>";
	
	document.getElementById("modifica").innerHTML = mod;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	

};



function modificar(id){
	var usuario = document.getElementById("a" +id).innerHTML;
	var nombre = document.getElementById("b" +id).innerHTML;
	var apellidos = document.getElementById("c" +id).innerHTML;
	var correo = document.getElementById("d" +id).innerHTML;
	var telefono = document.getElementById("e" +id).innerHTML;
	
	
	var mod = "<div class = 'box1'><div class='space'></div> <table>";
	mod += "<tr><td>Usuario</td><td>Nombre</td><td>Apellidos</td><td>Correo</td><td>Teléfono</td>";
	mod += "<td>Password</td><td>Rol</td></tr>";
	mod += "<tr><td><input class = 'inUser'type=\"text\" name=\"usuario\" value=\"" + usuario + "\"></td>";
	mod += "<td><input class = 'inNom' type=\"text\" name=\"nombre\" value=\"" + nombre + "\"></td>";
	mod += "<td><input class = 'inApe' type=\"text\" name=\"apellidos\" value=\"" + apellidos + "\"></td>";
	mod += "<td><input class = 'inApe' type=\"text\" name=\"correo\" value=\"" + correo + "\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"telefono\" value=\"" + telefono + "\"></td>";
	mod += "<td><input class = 'inNum' type=\"text\" name=\"pass\" value=\"" + "" + "\"></td>";
	mod += "<td>"+ select + "</td></tr></table>";
	mod += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	mod += "<div class='space'></div><input class='mod-button ph-btn-blue' type=\"submit\" name=\"modUsuario\" value=\"Modificar\"></div></div>";
	
	document.getElementById("modifica").innerHTML = mod;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	

};



function eliminar(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var elimina = "<div class = 'box1'><div class='space'></div>Elimnar el Usuario " + nombre + "<br><br>";
	elimina += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	elimina += "<div class='space'></div><input class='mod-button ph-btn-red' type=\"submit\" name=\"delUsuario\" value=\"Confirmar\" ></div></div>";
	document.getElementById("elimina").innerHTML = elimina;
	document.getElementById("modifica").innerHTML = "";
	document.getElementById('elimina').scrollIntoView();
	
};

function bloquear(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var bloqueo = "<div class = 'box1'><div class='space'></div>Bloquear el usuario " + nombre + "<br><br>";
	bloqueo += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	bloqueo += "<div class='space'></div><input class='mod-button ph-btn-orange' type=\"submit\" name=\"bloqUsuario\" value=\"Confirmar\" ></div></div>";
	document.getElementById("modifica").innerHTML = bloqueo;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	
};

function desbloquear(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var desact = "<div class = 'box1'><div class='space'></div>Desbloquear el usuario " + nombre + "<br><br>";
	desact += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	desact += "<div class='space'></div><input class='mod-button ph-btn-green' type=\"submit\" name=\"desbloqUsuario\" value=\"Confirmar\" ></div></div>";
	document.getElementById("modifica").innerHTML = desact;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	
};

function desactivar(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var desact = "<div class = 'box1'><div class='space'></div>Desactivar el usuario " + nombre + "<br><br>";
	desact += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	desact += "<div class='space'></div><input class='mod-button ph-btn-orange' type=\"submit\" name=\"desactUsuario\" value=\"Confirmar\" ></div></div>";
	document.getElementById("modifica").innerHTML = desact;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	
};

function activar(id){
	var nombre = document.getElementById("a" +id).innerHTML;
	var desact = "<div class = 'box1'><div class='space'></div>Activar el usuario " + nombre + "<br><br>";
	desact += "<input type=\"hidden\" name=\"id\" value=\"" + id + "\">";
	desact += "<div class='space'></div><input class='mod-button ph-btn-green' type=\"submit\" name=\"actUsuario\" value=\"Confirmar\" ></div></div>";
	document.getElementById("modifica").innerHTML = desact;
	document.getElementById("elimina").innerHTML = "";
	document.getElementById('modifica').scrollIntoView();
	
	
};


function confirma(){
	return confirm("¿Seguro que desea relaizar esta acción?");
}

</script>

</head>
<body>
<%


String query = "select Usuarios.*,  Roles.nombre, intentos from  Usuarios, Roles , Login"
 + " where Usuarios.rolEmpleado = Roles.idRoles "
 + " and Login.idUsuario = Usuarios.idUsuario ";

String queryRoles = "select * from Roles";

ResultSet rs = QueryMaker.executeQuery(query);
ResultSet roles = QueryMaker.executeQuery(queryRoles);


 %>

<script>
var rol = new Array();
<%int i = 0;
while (roles.next()){ %>
	rol[<%=i%>] = ["<%=roles.getString(1)%>", "<%=roles.getString(2)%>"];<%i++;} roles.close();%>
	
	
var select = "<select name=\"rol\">";
for (var j = 0 ; j < rol.length; j++){
	select+= "<option value =\"" + rol[j][0] + "\">" + rol[j][1] +"</option>" ;
}
select += "</select>";

</script>


<div class= "logo">
<img id="logoP" alt="" src="imagenes/logo2.jpg">
</div>

 <div class ="header">
  
  <h1>Administrar Usuarios</h1>
   <input readonly="readonly" class='mod-button ph-btn-green2'  value="Nuevo Usuario" onclick="nuevo();">
  </div>
  
<form action="CapturaUsuarios" method="Post" id ="myForm" onsubmit ="return confirma();">

 <div id="wrapper">


 <table id="keywords" >
  <thead>
      <tr>
        <th><span>Usuario</span></th>
        <th><span>Nombre</span></th>
        <th><span>Apellidos</span></th>
        <th><span>Correo</span></th>
        <th><span>Telefono</span></th>
        <th><span>Rol</span></th>
        <th><span>Estatus</span></th>
        <th><span>Intentos</span></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
  </thead>
  
<%
while (rs.next()){ String id = rs.getString(1); 
String estatus = rs.getInt(9) == 1 ? "Activo" : "Inactivo"; 
int intentos = rs.getInt(12);
String bloqueo = intentos >= 3 ? "Bloqueado" : "" + intentos ;%>
<tr>
<td id = "<%="a"+ id%>"><%=rs.getString(2)%></td>
<td id = "<%="b"+ id%>"><%=rs.getString(3)%></td>
<td id = "<%="c"+ id%>"><%=rs.getString(4)%></td>
<td id = "<%="d"+ id%>"><%=rs.getString(6)%></td>
<td id = "<%="e"+ id%>"><%=rs.getString(7)%></td>
<td id = "<%="g"+ id%>"><%=rs.getString(11)%></td>
<td id = "<%="h"+ id%>"><%=estatus%></td>
<td id = "<%="i"+ id%>"><%=bloqueo%></td>
<td><input readonly="readonly" class='ph-button ph-btn-blue'  value="Modificar" onclick="modificar(<%= id  %> );"></td>
<td><input readonly="readonly" class='ph-button ph-btn-red'  value="Eliminar" onclick="eliminar(<%= id  %> );"></td>
<% if (intentos >= 3){ %>
<td><input readonly="readonly" class='ph-button ph-btn-green'  value="Desbloquear" onclick="desbloquear(<%= id  %> );"></td>
<%} else { %>
<td><input readonly="readonly" class='ph-button ph-btn-orange'  value="Bloquear" onclick="bloquear(<%= id  %> );"></td>
<%} %>

<% if (estatus.equals("Activo")){ %>
<td><input readonly="readonly" class='ph-button ph-btn-orange'  value="Desactivar" onclick="desactivar(<%= id  %> );"></td>
<%} else { %>
<td><input readonly="readonly" class='ph-button ph-btn-green'  value="Activar" onclick="activar(<%= id  %> );"></td>
<%} %>


</tr>
<%}rs.close(); %>

</table>
</div>
<div id = "modifica"></div>
<div id = "elimina"></div>



</form>





</body>
</html>