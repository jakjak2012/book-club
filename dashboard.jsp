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
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
	   <div style="padding: 20px;">
		   <h1>Welcome! <c:out value="${userName }"/></h1>
		   <h3>Books from everyone's shelves:</h3>
	   </div>
	   <div style="padding: 20px;">
		   <p><a href="/logout">Logout</a> </p>
		   <p><a href="/books/new">+Add a book to my shelf!</a></p>
	   </div>
	</div>
	<div class="table">
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${bookList}">
					<tr>
						<td> ${book.id }</td>
						<td><a href="/books/${book.id}"><c:out value="${book.bookName}"/></a></td>
						<td><c:out value = "${book.authorName}"/></td>
						<td><c:out value = "${book.user.userName}"/></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</body>
</html>