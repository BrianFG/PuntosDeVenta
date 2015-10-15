<%@ page import="java.sql.*" %>
<%@ page import="estados.Estado" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
String title = "Menú Estados";

ResultSet rs= Estado.getEstados();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=title %></title>

<%@include file="../include/_js.jsp" %>
<%@include file="../include/_css.jsp" %>


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
          


          
                  <form method="post" action="ValidateEstado" name="inputpage" >
                  <div class="checkbox checkbox-primary">
            <input  type="checkbox" id= "all" onClick="toggle(this)" /> 
            <label for="all" class="css-label">
            Todos
            </label>
            </div>
            <div id="seleccionSub">
                <% int i = 0; while(rs.next()){ %>
                <div class="checkbox checkbox-success">
                    <input id ="checkboxG<%=i%>"data-toggle="checkbox"  type="checkbox" name="checkbox" onclick="enableSubmit()" value="<%= rs.getString(1)%>">
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
  





</div>	
<%@include file="../include/footer.jsp" %>

</body>
<script>
if(${estadoNoExiste== 'true'}){
	  alert("El estado selecionado no se encuentra");
	}
</script>
</html>