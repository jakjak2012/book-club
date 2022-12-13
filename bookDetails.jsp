<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/details.css">
</head>
<body>
	<div style="padding: 70px;">
		<a href="/books">Dashboard</a>
		<h1>${book.bookName}</h1>
		
		
		<h2>${userName} read ${book.bookName} by: ${book.authorName}</h2>
		<h2>Here are ${userName}'s thoughts:</h2>
		
		<div  class="thoughts"><p>${book.myThoughts}</p></div>
		
		<c:if test="${sessionScope.userId == book.user.id}">
			<a href="/books/edit/${book.id}" class="btn btn-success">Edit Book</a>
			<form action="/books/delete/${book.id}" method="POST">
				<input type="hidden" name="_method" value="delete">
			<button type="submit" class="btn btn-danger">Delete</button>
			</form>
		</c:if>
	</div>
	
	
	
</body>
</html>