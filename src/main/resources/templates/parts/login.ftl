<#macro login>
    <form action="/login" method="post">
        <div><label> Username : <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Sign In"/></div>
    </form>
    <a href="/registration">Add new user</a>
</#macro>

<#macro logout>
      <div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="submit" value="Sign Out"/>
        </form>
    </div>
    <div>
</#macro>

<#macro registration>
    <body>
    Add new user
    <form action="/registration" method="post">
        <div><label> First name : <input type="text" name="firstname"/> </label></div>
        <div><label> Surname : <input type="text" name="surname"/> </label></div>
        <div><label> Email : <input type="email" name="email"/> </label></div>
        <div>
            <label> Gender :
                <select name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </label>
        </div>
        <div><label> User Name : <input type="text" name="username"/> </label></div>
        <div><label> Password : <input type="password" name="password"/> </label></div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Sign Up"/></div>
    </form>
    </body>
</#macro>