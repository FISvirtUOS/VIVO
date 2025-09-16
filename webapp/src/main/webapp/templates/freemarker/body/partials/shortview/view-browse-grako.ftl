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

<#if (grako_funding[0].funding)?? >
    <span class="title">Finanzierung durch <a href="${profileUrl(grako_funding[0].mittelgeber_uri)}" title="${i18n().view_profile_page_for} ${grako_funding[0].funding}">${grako_funding[0].funding}</a></span>
</#if>

</li>

