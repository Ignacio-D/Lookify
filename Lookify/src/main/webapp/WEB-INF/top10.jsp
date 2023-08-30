<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top 10</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
			<h1>Top 10 Canciones</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Rating</th>
					<th>Titulo</th>
					<th>Artista</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${canciones}" var="cancion">
					<tr>
						<td>${cancion.rating}</td>
						<td>${cancion.titulo}</td>
						<td>${cancion.artista}</td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/dashboard" class="btn btn-primary">Regresar a Dashboard</a>
	</div>
</body>
</html>