<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Arrays"%>

<%@ page import="estados.Counter" %>
<%@page import="estados.NombreTablas"%>
<%@page import="estados.Top"%>
<%@ page import="java.sql.*" %>

<%
HttpSession sesion = request.getSession();

String[] subzonas = (String[])request.getSession().getAttribute("subzonas");
String[] zonas = (String[])request.getSession().getAttribute("zonas");
String[] estados = (String[])request.getSession().getAttribute("estados");
String[] tipos = (String[])request.getSession().getAttribute("tipos");
String[] categorias = (String[])request.getSession().getAttribute("categorias");
String[] cadenas = (String[])request.getSession().getAttribute("cadenas");
String[] generos = (String[])request.getSession().getAttribute("generos");
String[] nse = (String[])request.getSession().getAttribute("nse");
String[] edades = (String[])request.getSession().getAttribute("edades");

String topString = request.getParameter("topNum");
int top = Integer.parseInt(topString);

String[] puntos = (String[])request.getSession().getAttribute("puntos");

String esta = (String)sesion.getAttribute("esta");
String zona = (String)sesion.getAttribute("zona");
String subz = (String)sesion.getAttribute("subz");
String tipo = (String)sesion.getAttribute("tipo");
String cate = (String)sesion.getAttribute("cate");
String cade = (String)sesion.getAttribute("cade");
String gene = (String)sesion.getAttribute("gene");
String ns6  = (String)sesion.getAttribute("ns6");
String edad = (String)sesion.getAttribute("edad");


Top Top = new Top(puntos, generos, nse, edades, top);
String mapa =Top.getMString();


ResultSet puntosC = Top.getTopPuntos();

Counter counts = Top.getCount();
int noC = counts.getNoCruceros();
int peC = counts.getNoPeriodicoCruceros();
int noLC = counts.getNoLCs();
int peLC = counts.getNoPeriodicoLC();
int noM = counts.getNoMujeres();
int peM = counts.getNoPerioricoMujeres();
int totalNo = noC + noLC + noM;
int totalPe = peC + peLC + peM;
	
String detalleQuery = Top.getQueryDetalle();

String title = "Top " + top + " Cruceros";
String accion = "Top";

String checkbox = "edad";
String tabla = "<tr><td><strong>Estados</strong></td></tr><tr><td>" + esta + "</td></tr>";
tabla += "<tr><td><strong>Zonas</strong></td></tr><tr><td>" +  zona + "</td></tr>";
tabla += "<tr><td><strong>Subzonas</strong></td></tr><tr><td>" + subz+ "</td></tr>";
tabla += "<tr><td><strong>Tipos</strong></td></tr><tr><td>"+  tipo + "</td></tr>";
tabla += " <tr><td><strong>Categorias</strong></td></tr><tr><td>"+  cate +"</td></tr>";
tabla += "<tr><td><strong> Cadenas</strong></td></tr><tr><td>"+ cade+ "</td></tr>";
tabla += "<tr><td><strong>Generos</strong></td></tr><tr><td>"+ gene + "</td></tr>";
tabla += "tr><td><strong> NSE</strong></td></tr><tr><td>"+ ns6+ "</td></tr>";



%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=title%></title>

<%@include file="../include/_js.jsp" %>
<%@include file="../include/_css.jsp" %>



<%=mapa %>
<script>
function isInt () {
	var str = document.getElementById("sumTop").value;
    var n = ~~Number(str);
    return String(n) === str && n > 0;
};
</script>
</head>
<body>

<%@include file="../include/_navbar.jsp" %>

<div class="container" id="publi">

	<div class="col-xs-12" id="titleBox">
	<div class="row">
	<div class="col-xs-4 title"></div>
	<div class="col-xs-4" id="title"><%=title %></div>
	<div class="col-xs-4 title"></div>
	</div>
	</div>

 <div class="row">
      <div id="caja1" class="col-md-12">
          <div id="select" class="col-md-4">
          
	    <form method="post" action="Top" name="inputpage"  onsubmit="return isInt()">
			Top Cruceros<br>
			<input class="form-control" type="text" name="topNum" id= "sumTop"></input>
			<br><br>
			<INPUT class="btn btn-block btn-lg btn-primary" TYPE="submit"  id= "sum" Value="Enviar" NAME="Enviar" title="Click to submit">
		</form>		

          
          
          </div>
           
        <div id="googleMap" class="col-md-8"></div>
      </div><!-- /map-outer -->
  </div> 
  
  <div class="row">
  <div  class="col-md-12">
  	
  	<div id ="caja3" class="col-md-3">
  	
  	<input type="button" id="seleccion" class ="btn btn-success btn-block"  value="Mostrar selección">
  	<div id="tablaS">
  	<table><%=tabla%></table>
  	</div>
  		
  	</div>
  	
  	<div id ="caja2" class="col-md-8 col-md-offset-1">
  		
  		<div class="row">
  		<div class="col-xs-3" >
  		<div class="col-xs-12 count"></div><div class="col-xs-12 count">Establecimientos</div><div class="col-xs-12 count">Periodico</div>
  		</div>
  		<div class="col-xs-2" id="cruceros" >
  		<div class="col-xs-12 count" >Cruceros</div><div class="col-xs-12 count"><%=noC %></div><div class="col-xs-12 count"><%=peC %></div>
  		</div>
  		<div class="col-xs-2" id="locales" >
  		<div class="col-xs-12 count" >Locales Cerrados</div><div class="col-xs-12 count"><%=noLC %></div><div class="col-xs-12 count"><%=peLC %></div>
  		</div>
  		<div class="col-xs-2" id="mujeres">
  		<div class="col-xs-12 count">Mujeres</div><div class="col-xs-12 count"><%=noM %></div><div class="col-xs-12 count"><%=peM %></div>
  		</div>
  		<div class="col-xs-2" id="total">
  		<div class="col-xs-12 count">Total</div><div class="col-xs-12 count"><%=totalNo %></div><div class="col-xs-12 count"><%=totalPe %></div>
  		</div>
  		</div>
  		<div class="col-xs-3 col-xs-offset-9" id="detail">
  		
  		        <form method="post" action="Detalle" name="inputpage" target="blank" >
            <input  type="hidden" name="detalleQuery" value="<%= detalleQuery%>">
            <INPUT style="width:100px;height:40px" class='btn btn-primary' type="submit"  value="Detalle" NAME="Enviar" title="Click to submit">
        </form>
  		</div>
  	</div>
  	
  </div>
  </div>




</div>	
<%@include file="../include/footer.jsp" %>

</body>
</html>