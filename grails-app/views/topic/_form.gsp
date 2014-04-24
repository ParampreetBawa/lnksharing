<%@ page import="com.ig.linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="topic.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="createdBy" name="createdBy.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${topicInstance?.createdBy?.id}" class="many-to-one"/>--}%
    <g:textField name="createdBy.id" readonly="true" value="${session.user}"></g:textField>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'isPrivate', 'error')} ">
	<label for="isPrivate">
		<g:message code="topic.isPrivate.label" default="Is Private" />
		
	</label>
	<g:checkBox name="isPrivate" value="${topicInstance?.isPrivate}" />

</div>

%{--<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'resources', 'error')} ">
	<label for="resources">
		<g:message code="topic.resources.label" default="Resources" />
		
	</label>
	--}%%{--<g:select name="resources" from="${com.ig.linksharing.Resource.list()}" multiple="multiple" optionKey="id" size="5" value="${topicInstance?.resources*.id}" class="many-to-many"/>--}%%{--

</div>--}%

