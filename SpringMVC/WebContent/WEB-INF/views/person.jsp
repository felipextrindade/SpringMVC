<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
    	<link href="layout/styles/contact.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="layout/styles/remodal.css" rel="stylesheet" type="text/css" media="all">
	    <link rel="stylesheet" href="layout/styles/remodal-default-theme.css" rel="stylesheet" type="text/css" media="all">
	       <title>Persons</title>
    </head>
    <body>
    <script src="layout/scripts/jquery.min.js"></script>
    <script src="layout/scripts/remodal.js"></script>
    	<div class="mainDiv"align="center">
	        <h1>Person List</h1>
	        <!-- <h3 id="CreateContact"><a href="newContact">New Contact</a></h3> -->
	        <table id="mainTable">
	        <thead>
	        	<tr>
		        	<th>Name</th>
		        	<th>Surname</th>
	        	</tr>
	        </thead>	        	
				<c:forEach var="person" items="${listPerson}" varStatus="status">
	        	<tr>
					<td>${person.name}</td>
					<td>${person.surname}</td>
					<td>
						<a class=" button edit"  href="">Edit</a>
						<a class="button delete" href="deletePerson?id=${person.id}">Delete</a>
						<!-- href="deleteContact?id=${contact.id}"
								  "editContact?id=${contact.id}" --->
					</td>
							
	        	</tr>
				</c:forEach>	        	
			</table>
    	</div>
    	<div class="remodal" data-remodal-id="modaledit">
			  <button data-remodal-action="close" class="remodal-close"></button>
			
		</div> 
    	<br><br>
    	<center><a class=" button edit" href="/SpringMVC">Voltar</a></center>
   		   	
        <script type="text/javascript">
        	
    	</script>  	
    </body>
</html>
