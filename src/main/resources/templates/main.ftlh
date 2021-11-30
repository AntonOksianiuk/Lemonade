<#import "parts/common.ftlh" as c>
<@c.page>
    <form method="post" action="filter" class="row row-cols-lg-auto g-3 align-items-center">
        <div class="col-12">
            <input class="form-control" type="text" name="filter" value="${filter!""}" placeholder="Search by tag"/>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

    <#include "parts/messageEdit.ftlh" />
    <#include "parts/messageList.ftlh"/>
</@c.page>