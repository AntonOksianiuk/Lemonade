<#include  "security.ftlh">
<div class="row row-cols-1 row-cols-md-3 g-4" id="message-list">

    <#list messages as message>
        <div class="col">
            <div class="card">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top"/>
                </#if>

                <div class="m-2">
                    <span>${message.text}</span><br/>
                    <i>#${message.tag}</i>
                </div>

                <div class="card-footer text-muted">
                    <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <#if message.author.id = currentUserId>
                        <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                            Edit
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</div>
