<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение"/>
            <input type="text" name="tag" placeholder="Тэг">
            <input type="file" name="file" required placeholder="">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists}">
        <button type="submit">Найти</button>
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