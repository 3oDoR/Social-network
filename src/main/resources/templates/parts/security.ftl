<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    first_name = user.getFirstname()
    second_name = user.getSurname()
    id = user.getId()
    >
<#else>
    <#assign
    name = ""
    id = 0
    >
</#if>