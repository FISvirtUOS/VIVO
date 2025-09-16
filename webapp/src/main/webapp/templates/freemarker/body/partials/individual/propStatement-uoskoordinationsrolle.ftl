<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- VIVO-specific default data property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
<#import "lib-meta-tags.ftl" as lmt>

<@showStatement statement property />

<#macro showStatement statement property>
    <#assign role = (statement.value!)>

    <#if role == "true">
        ${i18n().yes}
    <#else>
        ${i18n().no}
    </#if>
    <@lmt.addCitationMetaTag uri=(property.uri!) content=(url) />
</#macro>





