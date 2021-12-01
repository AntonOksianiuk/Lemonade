<#import "parts/common.ftlh" as c>

<@c.page>
    ${message?if_exists}
    <h5>${username}</h5>
    <!-- Если убрать action то форма будет отправляться на тот же адрес, откуда и пришла-->
    <form method="post">

        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password"/>
            <label for="floatingPassword">Password</label>
        </div>
            <div class="form-floating">
                <input type="email" name="email" class="form-control" id="floatingPassword" placeholder="Some@some.com" value="${email!''}"/>
                <label for="floatingPassword">Email</label>
            </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</@c.page>