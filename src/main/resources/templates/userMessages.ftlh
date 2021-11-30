<#import "parts/common.ftlh" as c>

<@c.page>

    <h3>${userChannel.username}</h3>
    <#if !isCurrentUser>
        <#if isSubscriber>
            <a class="btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
        <#else>
            <a class="btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
        </#if>
    </#if>
    <div class="container">
        <div class="card">
            <div class="card-header">Subscriptions</div>
            <h3 class="card-body">
                <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
            </h3>
        </div>

        <div class="card">
            <div class="card-header">Subscribers</div>
            <h3 class="card-body">
                <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
            </h3>
        </div>
    </div>

    <#if isCurrentUser>
        <#include "parts/messageEdit.ftlh" />
    </#if>
    <#include "parts/messageList.ftlh"/>
</@c.page>