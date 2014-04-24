<%@ page import="com.ig.linksharing.Invite" %>



<div class="fieldcontain ${hasErrors(bean: inviteInstance, field: 'isAccepted', 'error')} ">
	<label for="isAccepted">
		<g:message code="invite.isAccepted.label" default="Is Accepted" />
		
	</label>
	<g:checkBox name="isAccepted" value="${inviteInstance?.isAccepted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: inviteInstance, field: 'sentBy', 'error')} required">
	<label for="sentBy">
		<g:message code="invite.sentBy.label" default="Sent By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sentBy" name="sentBy.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${inviteInstance?.sentBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: inviteInstance, field: 'sentTo', 'error')} required">
	<label for="sentTo">
		<g:message code="invite.sentTo.label" default="Sent To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sentTo" name="sentTo.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${inviteInstance?.sentTo?.id}" class="many-to-one"/>

</div>

