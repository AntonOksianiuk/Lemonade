<#include  "security.ftlh">
<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-floating mb-3">
            <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   id="floatingInput" placeholder="username" value="<#if user??>${user.username}</#if>"/>
            <label for="floatingInput">Username</label>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-floating">
            <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   id="floatingPassword" placeholder="Password"/>
            <label for="floatingPassword">Password</label>

            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>

        </div>

        <#if isRegisterForm>
            <br/>
            <div class="form-floating">
                <input type="password" name="password2"
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       id="floatingPassword" placeholder="Retype password"/>
                <label for="floatingPassword">Password</label>

                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>

            </div>
            <br/>
            <div class="form-floating">
                <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       id="floatingPassword" placeholder="Some@some.com" value="<#if user??>${user.email}</#if>"/>
                <label for="floatingPassword">Email</label>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <br/>
            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6LfftlAdAAAAAJlPat9UaIZT5eOfOZxbDVe9fExD"></div>
                <#if captchError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchError}
                    </div>
                </#if>
            </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <div class="col-12">
            <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign in</#if></button>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary"><#if user??>Sign out<#else>log in</#if></button>
    </form>
</#macro>