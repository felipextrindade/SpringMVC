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
						<a class=" button edit" href="editContact?id=${contact.id}">Edit</a>
						<a class="button delete" href="#modal" id="${contact.id}">Delete</a>
						<!-- href=deleteContact?id=${contact.id} --->
					</td>
							
	        	</tr>
				</c:forEach>	        	
			</table>
    	</div>
    	<div class="remodal" data-remodal-id="modal">
			  <button data-remodal-action="close" class="remodal-close"></button>
			  <h1>Confirm delete?</h1>
			  <p>
			  </p>
			  <br>
			  <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
			  <button data-remodal-action="confirm" class="remodal-confirm">OK</button>
		</div>
    	<br><br>
    	<center><a class=" button edit" href="http://localhost:8090/SpringMVC/">Voltar</a></center>
   		   	
    	<script type="text/javascript">
	    	$(document).on('confirmation', '.remodal', function () {
	    		  var id = ${contact.id};
	    		  location.href("editContact?id=id");
	    		});
    	</script>    	
    	 
    </body>
</html>
