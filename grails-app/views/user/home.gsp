<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 19/4/14
  Time: 7:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

    <g:javascript>

    function markreadunread(checkBox){
        var markRead = checkBox.checked ? true:false;
        var id = checkBox.value;
        var link = "${createLink(controller: 'userResource', action: 'markReadUnread')}";
        $.ajax({
            url:link+'?id='+id+'&markread='+markRead,
            success:function(data){
                    $(function () {
                        $("#dialog").dialog();
                    });
            }
        });
    }
    </g:javascript>
</head>

<body>
<div id="dialog" title="Basic dialog" style="display: none">
    <p>Your resource has been updated</p></div>
%{--<g:render template="showReadingItems"></g:render>--}%
%{--<table><caption>Subscribed topics</caption><tr><th>Topic</th><th>Owner By Me</th></tr>
    <g:each in="${topics}" var="topic">
        <tr>
            <td>${topic.name}</td>
            <td>${topic.createdBy.email.equals(session.user) ? "Yes" : "No"}</td></tr>
    </g:each>
</table>--}%
<ls:unreadItems resources="${resources}" countt="5"/>
%{--<ls:subscribedTopics topics="${topics}"/>
<ls:ownedTopics topic="${topics}"></ls:ownedTopics>--}%

</body>
</html>