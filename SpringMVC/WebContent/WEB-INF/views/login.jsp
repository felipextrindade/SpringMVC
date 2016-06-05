<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- PACN -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Agenda</title>
        <link href="layout/styles/contact.css" rel="stylesheet" type="text/css" media="all">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<link href="layout/styles/agenda.css" rel="stylesheet" type="text/css" media="all">
	</head>	
		<div align="center" class="mainDiv">
			
			<h1 >Login</h1>
		
			<form:form modelAttribute="login" method="post" action="autentica">
				<table>
					<tr>
						<td> Usuário: </td>
						<td> <input type="text" name="usuario" /> </td>
					</tr>
					<tr>
						<td> Senha: </td>
						<td> <input type="password" name="senha" /> </td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="Logar" /> 
						</td>
					</tr>
				</table>
			
				
			</form:form>
			
			<h3>${erro}</h3>
		</div>
			
    
    <body>