<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Template for core:webpage.

     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->
<#import "lib-meta-tags.ftl" as lmt>

<@showStatement statement property />

<#macro showStatement statement property>
    <#assign url = (statement.value!)>
    <a class="uos_style" href="${url}" title="URL" target="_blank">${i18n().external_project_site}</a>
    <@lmt.addCitationMetaTag uri=(property.uri!) content=(url) />
</#macro>