<%@ page import="com.ig.linksharing.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" class="required email" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:passwordField name="password" class="required" value="${userInstance?.password}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'confirmPassword', 'error')} ">
    <label for="confirmPassword">
        <g:message code="user.confirmassword.label" default="Password" />

    </label>
    <g:passwordField name="confirmPassword"  class="required" value="${userInstance?.confirmPassword}"/>

</div>
<div class="fieldcontain"} ">
    <label for="confirmPassword">
        <g:message code="user.date.label" default="Date" />

    </label>
    <g:textField name="dateString" id="date" class="required" value="${userInstance?.confirmPassword}"/>

</div>

