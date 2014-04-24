<%@ page import="com.ig.linksharing.UserResource" %>



<div class="fieldcontain ${hasErrors(bean: userResourceInstance, field: 'isRead', 'error')} ">
	<label for="isRead">
		<g:message code="userResource.isRead.label" default="Is Read" />
		
	</label>
	<g:checkBox name="isRead" value="${userResourceInstance?.isRead}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userResourceInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="userResource.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${com.ig.linksharing.Resource.list()}" optionKey="id" required="" value="${userResourceInstance?.resource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userResourceInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userResource.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${userResourceInstance?.user?.id}" class="many-to-one"/>

</div>

