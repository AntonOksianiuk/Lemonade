<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div>
    <@l.logout/>
    <span><a href="/user">User list</a></span>
</div>

<form method="post" enctype="multipart/form-data">
    <input type="text" name="text" placeholder="Enter the message"/>
    <input type="text" name="tag" placeholder="Tag">
    <input type="file" name="file">
    <button type="submit"> Add </button>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
</form>



    <form method="post" action="filter">
        <input type="text" name="filter" value="${filter!""}"/>
        <button type="submit">Find</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

<div> Список сообщений </div>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </#if>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</@c.page>