<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<#import "parts/login.ftl" as l>


<@c.page>

    <div>Welcome, ${first_name} ${second_name}.</div>


        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <div class="m-2">
                    <div class="row">
                        <div class="col">
                            <input required type="text" name="text" placeholder="Enter message" class="form-control">
                        </div>
                        <div class="col">
                            <input required type="text" name="tag" class="form-control" placeholder="Enter tag">
                        </div>
                        <div class="col">
                            <div class=" btn-sm float-left">
                                <input  type="file" name="file" required placeholder="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="m-2">
                    <div class="row">
                        <div class="col">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button class="form-control form-control-sm-btn btn-primary" type="submit">Добавить</button>
                        </div>
                    </div>
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