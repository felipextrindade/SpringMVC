<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<thead>
<tr>	        	<th>No</th>
		        	<th>Name</th>
		        	<th>Email</th>
		        	<th>Address</th>
		        	<th>Telephone</th>
		        	<th>Action</th>
	        	</tr>
	        </thead>	        	
				<c:forEach var="contact" items="${contactList}" varStatus="status">
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