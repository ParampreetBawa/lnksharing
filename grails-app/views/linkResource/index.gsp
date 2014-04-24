
<%@ page import="com.ig.linksharing.LinkResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-linkResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-linkResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="summary" title="${message(code: 'linkResource.summary.label', default: 'Summary')}" />
					
						<th><g:message code="linkResource.createdBy.label" default="Created By" /></th>
					
						<g:sortableColumn property="title" title="${message(code: 'linkResource.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'linkResource.url.label', default: 'Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${linkResourceInstanceList}" status="i" var="linkResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "summary")}</g:link></td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "url")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${linkResourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
