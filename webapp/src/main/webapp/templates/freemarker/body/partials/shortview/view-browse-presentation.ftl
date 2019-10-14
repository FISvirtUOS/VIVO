<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- Default individual browse view -->

<#import "lib-properties.ftl" as p>

<li class="individual" role="listitem" role="navigation">

<#if (presentationdate[0].video)??>
<#assign vid = presentationdate[0].video?replace("youtube-nocookie", "img.youtube") >
<#assign vid = vid?replace("embed", "vi") >
<#assign vid = vid?replace("www.", "") >
<#assign vid = vid + "/default.jpg" >
    <img src="${vid}" width="90" alt="${individual.name}" />
    <h1>
        <a href="${individual.profileUrl}" title="${i18n().view_profile_page_for} ${individual.name}">${individual.name}</a>
    </h1>
<#else>
    <h1>
        <a href="${individual.profileUrl}" title="${i18n().view_profile_page_for} ${individual.name}">${individual.name}</a>
    </h1>
</#if>


<#if (presentationdate[0].date)?? >
    <span class="title">${presentationdate[0].date}</span>
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