<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Message Editor
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

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>


            <br>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save message</button>

            </div>
        </form>
    </div>
</div>