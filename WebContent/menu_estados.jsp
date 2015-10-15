<%@ page import="java.sql.*" %>
<%@ page import="estados.Estado" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<html>
<head>

<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
</script>

<script>
function initialize()
{
var mapProp = {
  center:new google.maps.LatLng(23, -102),
  zoom:5,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };
var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>MenuSeleccion</title>
	<script type="text/javascript" src="js/estados.js"></script>
	<style type="text/css">

	</style>
	<script type="text/javascript">
	
	

function checkbox()
{
    var bk=document.getElementById("bk").value;;
    var cer=document.getElementById("cr").value;
    document.writeln(" " + bk );
    document.write(" " + cer);    
}
</script>

<script language="JavaScript">

function ventanaSecundaria (URL){
	   window.open(URL,"ventana1","width=600,height=600,scrollbars=NO")
	}

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
<div id="wrapper">
							<div id="menu">
							<h2>Menu Estados</h2>
		
		<form method="post" action="ValidateEstado" name="inputpage" >	
		  <input type="checkbox" id= "all" onClick="toggle(this)"/> Todos<br/>	
		
        <%
			        	ResultSet rs= Estado.getEstados();
			                while(rs.next()){
			        %>
        
        <input type="checkbox" name="checkbox" onclick="enableSubmit()" value="<%= rs.getString(1)%>"  ><%= rs.getString(2)%><br>
        <% } %>
         
          <INPUT type="submit" disabled id= "sum" value="Submit" NAME="Enviar" title="Click to submit">
           </form>
           
       </div>
       <div id="logo1">
<h3><a href="/menu_estados.jsp"><img id="logoP" alt="" src="imagenes/logo2.jpg"></a></h3>
</div>
<div id="box2">
<h3>Mapas</h3>
<div id="googleMap" style="width:98%;height:500px;"></div>
</div>
      
   

<div id="Field1"><p>Total de establecimientos: <input type="text" name="total"></p></div>
<div id="Field2"><p>Cantidad de periodico: <input type="text" name="periodico"></p></div>

<div id="footer">
<p>© Copyright 2014 Metro International</p>            
</div>
</div>
<script>
if(${estadoNoExiste== 'true'}){
	  alert("El estado selecionado no se encuentra");
	}
</script>
	
</body>
</html>