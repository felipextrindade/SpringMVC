<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
    	<link href="layout/styles/contact.css" rel="stylesheet" type="text/css" media="all">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="layout/styles/remodal.css" rel="stylesheet" type="text/css" media="all">
	    <link rel="stylesheet" href="layout/styles/remodal-default-theme.css" rel="stylesheet" type="text/css" media="all">
	       <title>Contact Manager Home</title>
    </head>
    <body>
    <script src="layout/scripts/jquery.min.js"></script>
    <script src="layout/scripts/remodal.js"></script>
    	<div class="mainDiv"align="center">
	        <h1>Contact List</h1>
	        <h3 id="CreateContact"><a href="newContact">New Contact</a></h3>
	        <table id="mainTable">
	        <thead>
	        	<tr>
		        	<th>No</th>
		        	<th>Name</th>
		        	<th>Email</th>
		        	<th>Address</th>
		        	<th>Telephone</th>
		        	<th>Action</th>
	        	</tr>
	        </thead>	        	
				<c:forEach var="contact" items="${listContact}" varStatus="status">
	        	<tr>
	        		<td>${status.index + 1}</td>
					<td>${contact.name}</td>
					<td>${contact.email}</td>
					<td>${contact.address}</td>
					<td>${contact.telephone}</td>
					<td>
						<a class=" button edit"  href="deleteContact?id=${contact.id}">Edit</a>
						<a class="button delete" href="deleteContact?id=${contact.id}">Delete</a>
						<!-- href="deleteContact?id=${contact.id}"
								  "editContact?id=${contact.id}" --->
					</td>
							
	        	</tr>
				</c:forEach>	        	
			</table>
			<form:form method="get" modelAttribute="contact" action="search">
			    <form:input path="name" id="search" placeholder="Digite sua pesquisa aqui" />
			    <br />			
			    <input type="submit" value="Submit" />
			</form:form>
			<br />	<br />	
    	</div>
    	
    	<div class="remodal" data-remodal-id="modalNewContact" title="New Contact">
			  			
		</div>
			  
		</div>
		<br/><br/>
    	<center><a class=" button edit" href="/SpringMVC">Voltar</a></center>
   		   	
        <script type="text/javascript">
        $(document).ready(function() {
            $('#modalNew').on('click', function() {
                   $.get("newContactModal", function(retorno) { 
                	   $('#modalNewContact]').html(retorno);
                	   $('[data-remodal-id=modalNewContact]').remodal().open();  
                   });
            });

     });
    	</script>  	
    	 
    </body>
</html>
