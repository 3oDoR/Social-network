<#include "security.ftl">
<#macro cards >

<div class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <img src="/img/${message.filename}" class="card-img-top">
            <div class="m-2">

            </div>
            <div class="card-footer">
                <div> Author: ${message.authorName}</div>
                <div> Message: ${message.text}</div>
                <div> Hashtag:${message.tag}</div>
                <#if message.authorName == name>
                <div><a href="/edit?id=${message.id}">Edit</a></div>
                <div><a href="/delete?id=${message.id}">Delete</a></div>
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>

</#macro>