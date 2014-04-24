<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 19/4/14
  Time: 5:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<span>${errors}</span>

<div id="login-user" class="content scaffold-create" role="main">
    <g:form controller="login" action="loginHandler">
        <fieldset class="form">
            <div class="fieldcontain">
                UserName : <g:textField name="username"></g:textField></div>

            <div class="fieldcontain">Password : <g:passwordField name="password"></g:passwordField></div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="Login" class="save"></g:submitButton>
            <g:link controller="user" action="register"><g:message code="user.new.register.label"></g:message></g:link>
        </fieldset>
    </g:form>

    <div id="create-user" class="content scaffold-create" role="main">
</body>
</html>