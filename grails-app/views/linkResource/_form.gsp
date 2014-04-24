<%@ page import="com.ig.linksharing.LinkResource" %>



<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="linkResource.summary.label" default="Summary" />
		
	</label>
	<g:textField name="summary" value="${linkResourceInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="linkResource.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${linkResourceInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="linkResource.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${linkResourceInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="linkResource.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${linkResourceInstance?.url}"/>

</div>

