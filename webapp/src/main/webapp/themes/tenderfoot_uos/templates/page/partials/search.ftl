<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#--Breaking this out so this can be utilized by other pages such as the jsp advanced tools pages-->

 <#-- $This file is distributed under the terms of the license in LICENSE$ -->
 
<section id="search" role="region">
    <fieldset>
        <legend>${i18n().search_form}</legend>

        <form id="search-form" action="${urls.search}" name="search" role="search" accept-charset="UTF-8" method="POST"> 
            <div class="input-group">
                <input id="search-field-box" type="text" class="form-control" name="querytext" value="${querytext!}" placeholder='${i18n().find_expert}' autocapitalize="off">
                <span class="input-group-btn">
                    <button id="search-field-box-button" class="btn btn-default" type="submit"></button>
                </span>
            </div>
        </form>
    </fieldset>
</section>
        