<#import "parts/common.ftl" as c>
<@c.page>


    <body>
    <form enctype="multipart/form-data" action="/setting" method="post">

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div> firstname</div>
                    <input required type="text" class="form-control" value="${currentUser.firstname}"
                           name="firstname">
                </div>
                <div class="col">
                    <div> surname</div>
                    <input required type="text" class="form-control" value=${currentUser.surname} name="surname">
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div> email</div>
                    <input required type="email" class="form-control" value="${currentUser.email}" name="email">
                </div>
                <div class="col">
                    <div> gender</div>
                    <select required name="gender" class="form-control">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <div> username</div>
                    <input required type="text" class="form-control" value=${currentUser.username} name="username">
                </div>
                <div class="col">
                    <div> password</div>
                    <input required type="password" class="form-control" value=${currentUser.password} name="password">
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </div>

        <div class="form-group">
        <div class="row">
            <div class="col">
                <div> avatar</div>
            <input  type="file" class="form-control" name="file">
            </div>
        </div>
        </div>

        <div class="form-group">
            <button class="btn btn-primary" type="submit">Сhange</button>
        </div>

    </form>
    </body>


</@c.page>