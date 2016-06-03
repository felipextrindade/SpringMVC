<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="layout/styles/contact.css" rel="stylesheet" type="text/css" media="all">
<title>New/Edit Contact</title>
</head>
<body>
	<div class="mainDiv" align="center">
		<h1 id="title-table">New/Edit Contact</h1>
		<form:form action="saveContact" method="post" modelAttribute="contact">
		<table>
			<form:hidden path="id"/>
			<tr>
				<td><form:input path="name" placeholder="Name" /></td>
				
			</tr>
			<tr>
				<td><form:input path="email" placeholder="Email" /></td>
			</tr>
			<tr>
				<td><form:input path="address" placeholder="Address"/></td>
			</tr>
			<tr>
				<td><form:input path="telephone" placeholder="Telephone"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Save"></td>
			</tr>
		</table>
		</form:form>
	</div>
</body>
</html>