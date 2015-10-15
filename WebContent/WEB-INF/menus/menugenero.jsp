<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="estados.Genero"%>
<%@ page import="estados.Counter" %>
<%@page import="estados.NombreTablas"%>
<%@ page import="java.sql.*" %>
<%   
HttpSession sesion = request.getSession();

String[] subzonas = (String[])request.getSession().getAttribute("subzonas");
String[] zonas = (String[])request.getSession().getAttribute("zonas");
String[] estados = (String[])request.getSession().getAttribute("estados");
String[] tipos = (String[])request.getSession().getAttribute("tipos");
String[] categorias = (String[])request.getSession().getAttribute("categorias");
String[] cadenas = (String[])request.getSession().getAttribute("cadenas");

String esta = (String)sesion.getAttribute("esta");
String zona = (String)sesion.getAttribute("zona");
String subz = (String)sesion.getAttribute("subz");
String tipo = (String)sesion.getAttribute("tipo");
String cate = (String)sesion.getAttribute("cate");
String cade = (String)sesion.getAttribute("cade");

Genero genero = new Genero(estados, zonas, subzonas, tipos, categorias, cadenas);

String mapa = genero.getMapa();
String[] puntos = genero.getPuntos();
request.getSession().setAttribute("puntos", puntos);
ResultSet rs= genero.getGeneros();

Counter counts = genero.getCount();
int noC = counts.getNoCruceros();
int peC = counts.getNoPeriodicoCruceros();
int noLC = counts.getNoLCs();
int peLC = counts.getNoPeriodicoLC();
int noM = counts.getNoMujeres();
int peM = counts.getNoPerioricoMujeres(); 
int totalNo = noC + noLC + noM;
int totalPe = peC + peLC + peM;

String detalleQuery = genero.getQueryDetalle();

String title = "Menú Género";
String accion = "MenuNSE";

String checkbox = "genero";
String tabla = "<tr><td><strong>Estados</strong></td></tr><tr><td>" + esta + "</td></tr>";
tabla += "<tr><td><strong>Zonas</strong></td></tr><tr><td>" +  zona + "</td></tr>";
tabla += "<tr><td><strong>Subzonas</strong></td></tr><tr><td>" + subz+ "</td></tr>";
tabla += "<tr><td><strong>Tipos</strong></td></tr><tr><td>"+  tipo + "</td></tr>";
tabla += " <tr><td><strong>Categorias</strong></td></tr><tr><td>"+  cate +"</td></tr>";
tabla += "<tr><td><strong> Cadenas</strong></td></tr><tr><td>"+ cade+ "</td></tr>";
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
function toggle(source) {
	if(document.getElementById("all").checked == 1){
		document.getElementById("sum").disabled=false;
	}else {
		document.getElementById("sum").disabled=true;
	}
	  checkboxes = document.getElementsByName('genero');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
	
function enableSubmit(){
	checkboxes = document.getElementsByName('genero');
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

<%@include file="../include/_navbar.jsp" %>

<div class="container" id="publi">

	<div class="col-xs-12" id="titleBox">
	<div class="row">
	<div class="col-xs-5 title"></div>
	<div class="col-xs-2" id="title"><%=title %></div>
	<div class="col-xs-5 title"></div>
	</div>
	</div>

 <div class="row">
      <div id="caja1" class="col-md-12">
          <div id="select" class="col-md-4">
          


          
                  <form method="post" action="<%=accion %>" name="inputpage" >
                  <div class="checkbox checkbox-primary">
            <input  type="checkbox" id= "all" onClick="toggle(this)" /> 
            <label for="all" class="css-label">
            Todos
            </label>
            </div>
            <div id="seleccionSub">
                <% int i = 0; while(rs.next()){ %>
                <div class="checkbox checkbox-success">
                    <input id ="checkboxG<%=i%>"data-toggle="checkbox"  type="checkbox" name="genero" onclick="enableSubmit()" value="<%= rs.getString(1)%>">
                    <label for="checkboxG<%=i%>" class="css-label">
                        <%= rs.getString(2)  %>
                    </label>
                    </div>
                <% i++;} rs.close(); %>
            </div>
            <div id="espacio"></div>
			<div class="col-md-3 col-md-offset-9">
            <INPUT class="btn btn-md btn-info" type="submit" disabled id= "sum" value="Enviar" NAME="Enviar" title="Click to submit">
        	</div>
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