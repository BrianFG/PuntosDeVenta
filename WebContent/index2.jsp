<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1" %>  
<%
String message = (String)request.getAttribute("message");
String tipo = (String)request.getAttribute("tipo");
%>
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>Login Application</title>

 <link rel="stylesheet" href="http://sscol.jebal.comuv.com/css/font.css">
<style type="text/css">

<%@include file="css/index.css" %>
