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
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">

                <input type="text" class="form-control ${(textError??)?string('is-invalid','')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Enter the message"
                       id="validationCustom03"/>
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
                <br>
                <!-- Нужно добавить класс is-invalid к поле, которое мы валидируем-->
                <!-- Если сообщение присутствует то мы помечаем поле как некорректное-->
                <input type="text" class="form-control ${(tagError??)?string('is-invalid','')}"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Tag" id="validationCustom03"/>
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>

                <br>
                <div class="form-group">
                    <input type="file" class="form-control" name="file">
                </div>
                <br>
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