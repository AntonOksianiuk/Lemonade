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

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Enter the message"/>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tag">
                </div>
                <div class="form-group">
                    <input type="file" class="form-control" name="file">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary"> Add</button>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>
            <div class="col">
                <div class="card">
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top">
                    </#if>

                    <div class="m-2">
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>

                    <div class="card-footer text-muted">
                        ${message.authorName}
                    </div>
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>

</@c.page>