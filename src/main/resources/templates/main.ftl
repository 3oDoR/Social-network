<#import "parts/common.ftl" as c>
<#import "parts/cards.ftl" as ca>
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

    <@ca.cards>
    </@ca.cards>
</@c.page>