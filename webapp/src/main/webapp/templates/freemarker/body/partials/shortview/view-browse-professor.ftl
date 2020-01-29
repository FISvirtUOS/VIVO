<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Default individual browse view -->

<#import "lib-properties.ftl" as p>

<li class="individual" role="listitem" role="navigation">

<#if (individual.thumbUrl)??>
    <img src="${individual.thumbUrl}" width="90" alt="${individual.name}" />
    <h1 class="thumb">
        <a href="${individual.profileUrl}" title="${i18n().view_profile_page_for} ${individual.name}">${individual.name}</a>
    </h1>
<#else>
    <img src="${urls.base}/images/placeholders/person.thumbnail.jpg" title="Platzhalter" alt="${individual.name}" width="90">
    <h1>
        <a href="${individual.profileUrl}" title="${i18n().view_profile_page_for} ${individual.name}">${individual.name}</a>
    </h1>
</#if>

<#if (denom[0].profdenom)?? >
    <#if (professur[0].bezeichnung)?? >
        <span class="title">${professur[0].bezeichnung?trim}, ${denom[0].profdenom}</span>
    <#else>
        <span class="title">${denom[0].profdenom}</span>
    </#if>
<#else>
    <#if (professur[0].bezeichnung)?? >
        <span class="title">${professur[0].bezeichnung}</span>
    </#if>
</#if>

</li>

