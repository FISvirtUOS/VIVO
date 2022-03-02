<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Template for core:webpage.

     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.
 -->
<script src="https://kit.fontawesome.com/865186bfb2.js" crossorigin="anonymous"></script>
<#import "lib-meta-tags.ftl" as lmt>
<#assign individualURI = (individual.uri)!"unknownProfile" >

<@showStatement statement property />

<#macro showStatement statement property>
    <#assign url = (statement.value!)>
    <a class="uos_style" href="${url}" title="URL" target="_blank">${i18n().external_project_site}</a>
    <a href="${urls.contact}?broken_link=${url}&profile=${individualURI}" title="${i18n().report_broken_link}" style="padding-left: 0px; margin-left: 10px; background-image: initial;"> <i class="fas fa-unlink"></i></a>
    <@lmt.addCitationMetaTag uri=(property.uri!) content=(url) />
</#macro>