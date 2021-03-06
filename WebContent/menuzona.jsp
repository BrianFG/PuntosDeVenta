<%@page import="java.util.Arrays"%>
<%@ page import="java.sql.*" %>
<%@ page import="estados.Zona" %>
<%@ page import="estados.Counter" %>
<%@page import="estados.NombreTablas"%>
<%@page import="javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Menú Zonas</title>
	<script type="text/javascript" src="js/estados.js"></script>
	<style type="text/css">
	<%@include file="../../css/screen.css" %> 
	</style>
	<script>

	function toggle(source) {
		if(document.getElementById("all").checked == 1){
			document.getElementById("sum").disabled=false;
		}else {
			document.getElementById("sum").disabled=true;
		}
		  checkboxes = document.getElementsByName('checkbox');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
		
	function enableSubmit(){
		checkboxes = document.getElementsByName('checkbox');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    if (checkboxes[i].checked == 1){
		    	document.getElementById("sum").disabled=false;
		    	return;
		    }
		  }
		  document.getElementById("sum").disabled=true;	  
	}
	</script>
</head>
<body>
<%
HttpSession sesion = request.getSession();

String[] estados = (String[])sesion.getAttribute("estados");

String esta = (String)sesion.getAttribute("esta");

Zona zona = new Zona(estados);
String mapa = zona.getMapa();
Counter counts = zona.getCount();
int noC = counts.getNoCruceros();
int peC = counts.getNoPeriodicoCruceros();
int noLC = counts.getNoLCs();
int peLC = counts.getNoPeriodicoLC();
int noM = counts.getNoMujeres();
int peM = counts.getNoPerioricoMujeres();

String detalleQuery = zona.getQueryDetalle();
%>	

<div id="wrapper">
     <div id="menu">
	     <h2><strong>Menu Zonas</strong></h2>
		 <div id ="form">
			 <form method="post" action="MenuSubZona" name="inputpage" >
		
			 <input type="checkbox" id= "all" onClick="toggle(this)" /> Todos<br/>
	         <%ResultSet rs2= zona.getZonas();
	         while(rs2.next()){ %>
	         <input type="checkbox" name="checkbox" onclick="enableSubmit()" value="<%= rs2.getString(1)%>"  ><%= rs2.getString(2) + " - " + rs2.getString(3) %><br>
	         <% } rs2.close(); %>
	         <INPUT type="submit" disabled id= "sum" value="Submit" NAME="Enviar" title="Click to submit">
	         </form>
	     </div>

	     <div id="seleccion">
	         <table>
		     <tr><td><strong>Estados</strong></td></tr><tr><td> <%= esta%></td></tr>
		     </table>
		 </div>					
     </div>
	<div id="logo1">
		<form method ="post" action = "Inicio"><input type="image" src="imagenes/logo2.jpg" alt="Submit" /></form>
	</div>
	<div id="box2">
		<h3>Mapas</h3><%=mapa %>
	</div>
	
	<div class = "countBox">
	<div class="countTittle2">No. de Establecimientos<br><br>Cantidad de Periodico</div>
	<div class="countTittle">Cruceros</div>
	<div class="countTittle">Locales Cerrados</div>
	<div class="countTittle">Mujeres</div>
	<div class="countTittle">Total</div>
	<div class="countSubBox lightGreen"><p><%=noC %></p></div>
	<div class="countSubBox green"><p><%=noLC %></p></div>
	<div class="countSubBox pink"><p><%=noM %></p></div>
	<div class="countSubBox orange"><p><%= noC+noLC+noM %></p></div>
	<div class="countSubBox2 lightGreen2"><p><%=peC %></p></div>
	<div class="countSubBox2 green2"><p><%=peLC %></p></div>
	<div class="countSubBox2 pink2"><p><%=peM %></p></div>
	<div class="countSubBox2 orange2"><p><%=peC+peLC+peM %></p></div>
	</div>
	
	<div id="footer">
	<form method="post" action="Detalle" name="inputpage" target="blank" >
	<input type="hidden" name="detalleQuery" value="<%= detalleQuery%>">
	<INPUT class='buttonD ph-btn-green' type="submit"  value="Detalle" NAME="Enviar" title="Click to submit">
	</form>
		<p>© Copyright 2014 Metro International</p>            
	</div>
	
</div>	
</body>
</html>