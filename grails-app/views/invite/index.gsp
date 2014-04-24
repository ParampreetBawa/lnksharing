
<%@ page import="com.ig.linksharing.Invite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invite.label', default: 'Invite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-invite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-invite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="isAccepted" title="${message(code: 'invite.isAccepted.label', default: 'Is Accepted')}" />
					
						<th><g:message code="invite.sentBy.label" default="Sent By" /></th>
					
						<th><g:message code="invite.sentTo.label" default="Sent To" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inviteInstanceList}" status="i" var="inviteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inviteInstance.id}">${fieldValue(bean: inviteInstance, field: "isAccepted")}</g:link></td>
					
						<td>${fieldValue(bean: inviteInstance, field: "sentBy")}</td>
					
						<td>${fieldValue(bean: inviteInstance, field: "sentTo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inviteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
