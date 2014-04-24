
<%@ page import="com.ig.linksharing.UserResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userResource.label', default: 'UserResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="isRead" title="${message(code: 'userResource.isRead.label', default: 'Is Read')}" />
					
						<th><g:message code="userResource.resource.label" default="Resource" /></th>
					
						<th><g:message code="userResource.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userResourceInstanceList}" status="i" var="userResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userResourceInstance.id}">${fieldValue(bean: userResourceInstance, field: "isRead")}</g:link></td>
					
						<td>${fieldValue(bean: userResourceInstance, field: "resource")}</td>
					
						<td>${fieldValue(bean: userResourceInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userResourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
