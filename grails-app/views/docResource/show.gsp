
<%@ page import="com.ig.linksharing.DocResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docResource.label', default: 'DocResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-docResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-docResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list docResource">
			
				<g:if test="${docResourceInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="docResource.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${docResourceInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docResourceInstance?.file}">
				<li class="fieldcontain">
					<span id="file-label" class="property-label"><g:message code="docResource.file.label" default="File" /></span>
					
						<span class="property-value" aria-labelledby="file-label"><g:fieldValue bean="${docResourceInstance}" field="file"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docResourceInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="docResource.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${docResourceInstance?.createdBy?.id}">${docResourceInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docResourceInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="docResource.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${docResourceInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:docResourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${docResourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
