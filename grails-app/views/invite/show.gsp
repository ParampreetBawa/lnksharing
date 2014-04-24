
<%@ page import="com.ig.linksharing.Invite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'invite.label', default: 'Invite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-invite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-invite" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list invite">
			
				<g:if test="${inviteInstance?.isAccepted}">
				<li class="fieldcontain">
					<span id="isAccepted-label" class="property-label"><g:message code="invite.isAccepted.label" default="Is Accepted" /></span>
					
						<span class="property-value" aria-labelledby="isAccepted-label"><g:formatBoolean boolean="${inviteInstance?.isAccepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inviteInstance?.sentBy}">
				<li class="fieldcontain">
					<span id="sentBy-label" class="property-label"><g:message code="invite.sentBy.label" default="Sent By" /></span>
					
						<span class="property-value" aria-labelledby="sentBy-label"><g:link controller="user" action="show" id="${inviteInstance?.sentBy?.id}">${inviteInstance?.sentBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inviteInstance?.sentTo}">
				<li class="fieldcontain">
					<span id="sentTo-label" class="property-label"><g:message code="invite.sentTo.label" default="Sent To" /></span>
					
						<span class="property-value" aria-labelledby="sentTo-label"><g:link controller="user" action="show" id="${inviteInstance?.sentTo?.id}">${inviteInstance?.sentTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:inviteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${inviteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
