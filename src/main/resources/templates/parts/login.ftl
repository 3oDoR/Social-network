<#macro login>

    <form action="/login" method="post" xmlns="http://www.w3.org/1999/html">

        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Username : </label>
            <input type="text" name="username" class="form-control" aria-describedby="usernameHelp"
                   placeholder="Enter username "/>
        </div>

        <div class="form-group">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                   placeholder="Password"/>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Submit</button>
        <a href="/registration" class="ml-3">Add new user</a>

    </form>

</#macro>


<#macro logout>

    <form action="/logout" method="post">

        <div class="form-group">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">Sign Out</button>
        </div>

    </form>

</#macro>

<#macro registration>

    <body>
    <form action="/registration" method="post">

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="First name">
                </div>
                <div class="col">
                    <input type="text" class="form-control" placeholder="Last name">
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Email">
                </div>
                <div class="col">
                    <select name="gender" class="form-control">
                        <option selected>Choose gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Username" name="username">
                </div>
                <div class="col">
                    <input type="text" class="form-control" placeholder="Password" name="password">
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </div>

        <div class="form-group">
            <button class="btn btn-primary" type="submit">Sign Up</button>
        </div>

    </form>
    </body>

</#macro>


<#macro logout>

    <#assign
    known = Session.SPRING_SECURITY_CONTEXT??
    >

    <#if known>
        <form action="/logout" method="post" class="pl-4">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button class="btn btn-primary" type="submit">Sign Out</button>
        </form>
    </#if>

</#macro>