<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Detalles</title>
</head>
<body>
	<h1>Titulo: ${cancion.titulo}</h1>
	<p>Artista: ${cancion.artista}</p>
	<p>Rating: ${cancion.rating}</p>
	<a href="/dashboard">Dashboard</a>
	<form action="/borrar/${cancion.id}" method="POST">
		<input type="hidden" name="_method" value="DELETE">
		<input type="submit" value="Borrar" class="btn btn-danger">
	</form>
</body>
</html>