<#import "parts/common.ftlh" as c>

<@c.page>
    User Editor

    <form action="/user" method="post">

        <input type="text" value="${user.username}" name="username"/>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("cheched", "")}/>${role}</label>
                <!-- Проверяем активна ли роль методом freemarker-->
            </div>
        </#list>

        <input type="text" value="${user.id}" name="userId"/>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Save</button>
    </form>

</@c.page>
