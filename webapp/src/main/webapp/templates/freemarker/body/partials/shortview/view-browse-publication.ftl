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
    <h1>
        <a href="${individual.profileUrl}" title="${i18n().view_profile_page_for} ${individual.name}">${individual.name}</a>
    </h1>
</#if>

<#assign cleanTypes = 'edu.cornell.mannlib.vitro.webapp.web.TemplateUtils$DropFromSequence'?new()(individual.mostSpecificTypes, vclass) />
<#if cleanTypes?size == 1>
    <#if (publicationdate[0].publicationdatelabel)?? >
        <span class="title">${cleanTypes[0]} - ${publicationdate[0].publicationdatelabel}</span>
    </#if>
<#elseif (cleanTypes?size > 1) >
    <span class="title">
        <ul>
            <#list cleanTypes as type>
            <li>${type}</li>
            </#list>
        </ul>
        <#if (publicationdate[0].publicationdatelabel)?? >
            - ${publicationdate[0].publicationdatelabel}
        </#if>
    </span>
</#if>

<#if (staff[0].stafflabel)?? >
    <span class="title">
    <#list staff as item>
        <#if item?has_next>
            <#if item.isvcard == "false">
                <a href="${profileUrl(item.staffuri)}" title="${i18n().view_profile_page_for} ${item.stafflabel}">${item.stafflabel}</a>;
            <#else>
                ${item.stafflabel}; 
            </#if>
        <#else>
            <#if item.isvcard == "false">
                <a href="${profileUrl(item.staffuri)}" title="${i18n().view_profile_page_for} ${item.stafflabel}">${item.stafflabel}</a>
            <#else>
                ${item.stafflabel}
            </#if>
        </#if>
    </#list>
    </span>
</#if>
</li>

