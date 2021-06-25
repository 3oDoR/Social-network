<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>


    <form method="get" action="/main">
        <div class="input-group mb-3">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Enter hashtag"
                   class="form-control">
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary" type="submit">Find</button>
            </div>
        </div>
    </form>




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

                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>