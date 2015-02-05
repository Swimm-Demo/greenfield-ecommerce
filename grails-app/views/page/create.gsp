<%@ page import="org.greenfield.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
			
		<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
		<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>
		
	</head>
	<body>

		<div id="create-page" class="content scaffold-create" role="main">
		
			<h1>Create Page</h1>
			
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${pageInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pageInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="save" >
				<g:render template="form"/>
				
				<div class="form-group">
					<g:submitButton name="save" class="btn btn-primary" value="Create" />
				</div>
			</g:form>
		</div>
	</body>
</html>
