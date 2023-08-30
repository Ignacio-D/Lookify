<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Lookify-Dashboard</title>
</head>
<body>
	<div class="container">
		<header>
			<a href="/canciones/nuevo">Agregar</a>
			<a href="/buscar/top10">Top Canciones</a>
			<form action="/busqueda" method="POST">
				<div>
					<input type="text" name="palabra" class="form-control" placeholder="Ej: Chayanne">
				</div>
				<input type="submit" value="Buscar Artistas" class="btn btn-primary col-2">
			</form>
		</header>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Titulo</th>
					<th>Rating</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					usuarios = LIST {obj(elena), obj(juana), obj(pablo)}
					usuario = obj(elena) -> nombre = "Elena" apellido = "De Troya"
					usuario = obj(juana) 
				 -->
				<c:forEach items="${canciones}" var="cancion">
					<tr>
						<td><a href="/canciones/${cancion.id}">${cancion.titulo}</a></td>
						<td>${cancion.rating}</td>
						<td class="d-flex">
							<form action="/borrar/${cancion.id}" method="POST">
								<input type="hidden" name="_method" value="DELETE">
								<input type="submit" value="Borrar" class="btn btn-danger">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>