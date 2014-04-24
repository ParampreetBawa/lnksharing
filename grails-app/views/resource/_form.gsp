<%@ page import="com.ig.linksharing.Resource" %>


<script type="text/javascript">
    function documentType(type){
        if(type == "doc"){
            document.getElementById('documentDiv').removeAttribute('style');
            document.getElementById('linkDiv').setAttribute('style','display:none');
        }
        else{
            document.getElementById('linkDiv').removeAttribute('style');
            document.getElementById('documentDiv').setAttribute('style','display:none');
        }
    }
</script>
<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'summary', 'error')} ">
    <label for="summary">
        <g:message code="resource.summary.label" default="Summary"/>

    </label>
    <g:textArea name="summary" value="${resourceInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'createdBy', 'error')} required">
    <label for="createdBy">
        <g:message code="resource.createdBy.label" default="Created By"/>
        <span class="required-indicator">*</span>
    </label>
    %{--<g:select id="createdBy" name="createdBy.id" from="${com.ig.linksharing.User.list()}" optionKey="id" required="" value="${resourceInstance?.createdBy?.id}" class="many-to-one"/>--}%
    <g:textField name="createdBy" readonly="true" value="${session.user}" size="30"></g:textField>

</div>
<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="resource.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${resourceInstance?.title}"/>

</div>

<div class="fieldcontain">
    <label for="resourceType">
        <g:message code="resource.type.label" default="Select Resource Type"/>
    </label>
    <g:radio name="resourceType" value="document" onclick="documentType('doc');"></g:radio>Document
    <g:radio name="resourceType" value="link" onclick="documentType('link');"></g:radio>Link
</div>
<div class="fieldcontain" id="documentDiv">
    <label for="resourceType">
        <g:message code="resource.document.label" default="Select Document"/>
    </label>
    <g:field type="file" name="file"/>
</div>
<div class="fieldcontain" id="linkDiv" style="display: none">
    <label for="resourceType">
        <g:message code="resource.document.label" default="Type url"/>
    </label>
    <g:textField name="link"></g:textField>
</div>

