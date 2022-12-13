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
    <link rel="stylesheet" href="/css/edit.css" type="text/css">
</head>
<body>
	<div>
	   <div style="padding-left: 100px; padding-top: 20px;">
		   <h1>Change your Entry</h1>
		   <h3><a href= "/books">back to the shelves</a></h3>
	   </div>
	</div>
	<div style="padding-left: 100px; padding-right: 100px;">
		<form:form action="/books/edit/${foundBook.id}" method="POST" modelAttribute="foundBook">
			<input type="hidden" name="_method" value="PUT" />	
			<form:input type="hidden" path="user" value="${userId}"/>	
				<div>
	   				<form:label path="bookName">Title</form:label><br>
	   				<form:input path="bookName" class="form-control"/>
	   				<form:errors path="bookName"/>
	   			</div>
	   			<div>
	   				<form:label path="authorName">Author</form:label><br>
	   				<form:input path="authorName" class="form-control"/>
	   				<form:errors path="authorName"/>
	   			</div>
	   			<div>
	   				<form:label path="myThoughts">My thoughts</form:label><br>
	   				<form:textarea path="myThoughts" class="form-control"/>
	   				<form:errors path="myThoughts"/>
	   			</div>
	   			<div>
	   				
	   			</div>
	   			<div>
	   				<br><button type="submit" class="btn btn-primary">Edit</button>
	   			</div>
	   	</form:form>
   	</div>
</body>
</html>