<%@ page import="com.ig.linksharing.DocResource" %>



<div class="fieldcontain ${hasErrors(bean: docResourceInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="docResource.summary.label" default="Summary" />
		
	</label>
	<g:textField name="summary" value="${docResourceInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: docResourceInstance, field: 'file', 'error')} required">
	<label for="file">
		<g:message code="docResource.file.label" default="File" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: docResourceInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="docResource.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${docResourceInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: docResourceInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="docResource.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${docResourceInstance?.title}"/>

</div>

