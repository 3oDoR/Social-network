<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<#import "parts/login.ftl" as l>
<#import "parts/cards.ftl" as ca>


<@c.page>



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
                            <input type="file" name="file" required placeholder="">
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



    <div class="card my-1 text-light bg-secondary">
        <div class="page-heading">
            <div class="media clearfix">
                <div class="media-left pr15">
                    <img class="media-object mw150 img-fluid img-responsive" src="/img/${currentUser.avatar}"
                         value="/img/${currentUser.avatar}"
                         width="300px" height="300px">
                </div>
                <div class="media-body va-m">
                    <h2 class="media-heading pl-3">${currentUser.firstname} ${currentUser.surname}
                        <small> - Profile</small>
                    </h2>
                    <h6 class="pl-3">Email: ${currentUser.email}</h6>
                    <h6 class="pl-3">Gender: ${currentUser.gender}</h6>
                    <h6 class="pl-3">Id: ${currentUser.id}</h6>
                </div>
            </div>
        </div>
    </div>



    <@ca.cards>
    </@ca.cards>
</@c.page>