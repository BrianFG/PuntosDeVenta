<%@page import="estados.QueryMaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detalles Punto De Venta</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-1.11.1.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.tablesorter.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.btechco.excelexport.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery.base64.js"></script>
<script src="http://wsnippets.com/secure_download.js"></script>
    <!-- Loading Bootstrap -->
    <link href="<%= request.getContextPath() %>/css/flat/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="<%= request.getContextPath() %>/css/flat/flat-ui.css" rel="stylesheet">

<script type="text/javascript">

$(function(){
  $('#keywords').tablesorter(); 
});

$(document).ready(function () {
    $("#btnExport").click(function () {
        $("#keywords").btechco_excelexport({
            containerid: "keywords"
           , datatype: $datatype.Table
           , filename: 'DetallesPuntoDeVenta'
        });
    });
});

</script>
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
}


/** page structure **/
#wrapper {
  display: block;
  width: 1000px;
  background:#D2D7D3;
  margin: 0 auto;
  padding: 10px 17px;
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
    width: 230px;
    margin : 15px auto auto 150px;
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


</style>

</head>
<body>
<%
String detalleQuery = request.getParameter("detalleQuery");
ResultSet detalleRS = QueryMaker.executeQuery(detalleQuery);
 %>
 
 
 
 
  <div id="wrapper">
 <table id="keywords" >
 <thead>
      <tr>
        <th><span>Estado</span></th>
        <th><span>Tipo</span></th>
        <th><span>Nombre</span></th>
        <th><span>Dirección</span></th>
        <th><span>Zona</span></th>
        <th><span>Sub-Zona</span></th>
        <th><span>Dotación</span></th>
      </tr>
  </thead>
    <tbody>
<%while (detalleRS.next()){ %>
<tr>
<td class="lalign"><%=detalleRS.getString(1) %></td>
<td><%=detalleRS.getString(2) %></td>
<td><%=detalleRS.getString(3) %></td>
<td><%=detalleRS.getString(4) %></td>
<td><%=detalleRS.getString(5) %></td>
<td><%=detalleRS.getString(6) %></td>
<td><%=detalleRS.getString(7) %></td>
</tr>
<%}%>
</tbody>
</table>
</div>
 <button class='mod-button ph-btn-blue' id="btnExport">Exportar tabla a Excel</button>
</body>
</html>