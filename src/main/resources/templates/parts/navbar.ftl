<#include "security.ftl">
<#import "login.ftl" as l>
<#import "cards.ftl" as c>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <#if name != "">
                <li class="nav-item active">
                    <a class="nav-link" href="/account"> Account <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/setting"> Setting <span class="sr-only">(current)</span></a>
                </li>
            </#if>
        </ul>
        <#if name != "">
            <div class="navbar-text">${first_name} ${second_name}</div>
        </#if>

        <@l.logout />
    </div>
</nav>
