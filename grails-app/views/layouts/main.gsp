<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="jquery"></g:javascript>
    <g:javascript library="jquery-ui"></g:javascript>
    <r:layoutResources/>
</head>

<body>
<div id="grailsLogo" role="banner"><a href="http://grails.org"><img
        src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
<g:unless test="${session.isNew()}">
    <g:if test="${session.user}">
        <table>
            <tr style="width: 100%;">
                <td style="margin-left: 0px;position: relative">
                    <g:link controller="user" action="home">Home</g:link>
                </td>
                <td style="margin-right: 0px;position: relative">
                    <span style="">Welcome ${session.user}!!!</span>
                </td>
                <td style="margin-right: 0px;position: relative">
                    <g:link controller="login" action="logout">Logout</g:link>
                </td>
                <td>
                    <ls:formattedDate format="dd/MMM/yyyy"></ls:formattedDate>
                </td>
            </tr>
        </table>
    </g:if>
</g:unless>
%{--<g:render template="/user/showReadingItems"></g:render>--}%
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources/>

</body>
</html>
