<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Agrega una Cancion</title>
</head>
<body>
	<h1>Agrega una Cancion</h1>
	<a href="/dashboard">Dashboard</a>
	<form:form action="/canciones" method="POST" modelAttribute="cancion">
		<div>
			<form:label path="titulo">Titulo</form:label>
			<form:input path="titulo"></form:input>
			<form:errors path="titulo"></form:errors>
		</div>
		<div>
			<form:label path="artista">Artista</form:label>
			<form:input path="artista"></form:input>
			<form:errors path="artista"></form:errors>
		</div>
		<div>
    		<form:label path="rating">Rating</form:label>
    		<form:input type="number" min="1" max="10" path="rating"/>
    		<form:errors path="rating"/>
		</div>
		<input type="submit" value="Agregar Cancion">
	</form:form>
</body>
</html>