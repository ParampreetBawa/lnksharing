<table>
    <caption>Reading Items</caption>
    <th>Id</th>
    <th>Title</th>
    <th>Summary</th>
    <th>Owner</th>
    <th>Read Link</th>
<g:each in="${resources}" var="resource">
    <tr>
        <td>${resource.id}</td>
        <td>${resource.title}</td>
        <td>${resource.summary}</td>
        <td>${resource.createdBy}</td>
        <td><g:checkBox name="readLink" value="${resource.id}" onclick="markreadunread(this);"></g:checkBox></td>
    </tr>
</g:each>
</table>