<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Storage Service</title>
	<style>
		table.blueTable {
			border: 1px solid #1C6EA4;
			background-color: #EEEEEE;
			width: 100%;
			text-align: left;
			border-collapse: collapse;
		}
		table.blueTable td, table.blueTable th {
			border: 1px solid #AAAAAA;
			padding: 3px 2px;
		}
		table.blueTable tbody td {
			font-size: 13px;
		}
		table.blueTable tr:nth-child(even) {
			background: #D0E4F5;
		}
		table.blueTable thead {
			background: #1C6EA4;
			background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
			border-bottom: 2px solid #444444;
		}
		table.blueTable thead th {
			font-size: 15px;
			font-weight: bold;
			color: #FFFFFF;
			border-left: 2px solid #D0E4F5;
		}
		table.blueTable thead th:first-child {
			border-left: none;
		}

		table.blueTable tfoot {
			font-size: 14px;
			font-weight: bold;
			color: #FFFFFF;
			background: #D0E4F5;
			background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
			border-top: 2px solid #444444;
		}
		table.blueTable tfoot td {
			font-size: 14px;
		}
		table.blueTable tfoot .links {
			text-align: right;
		}
		table.blueTable tfoot .links a{
			display: inline-block;
			background: #1C6EA4;
			color: #FFFFFF;
			padding: 2px 8px;
			border-radius: 5px;
		}
		tr:hover {background-color: #f5f5f5;}

	</style>
</head>
<body>
	<div align="center">
		<h1>Employee Storage Service</h1>
		<h2>List of all employees</h2>
		<table class="blueTable">

			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Salary</th>
			<th>Company</th>
			<th>Action</th>

			<c:forEach var="employee" items="${listEmployee}">
				<tr>

					<td>${employee.fname}</td>
					<td>${employee.lname}</td>
					<td>${employee.email}</td>
					<td>${employee.address}</td>
					<td>${employee.salary}</td>
					<td>${employee.comid}</td>

					<td><a href="editEmployee?id=${employee.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="deleteEmployee?id=${employee.id}">Remove</a></td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			<a href="newEmployee">Create New Employee Record </a>
		</h4>
	</div>
</body>
</html>