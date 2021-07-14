<#-- $This file is distributed under the terms of the license in LICENSE$ -->
<#-- Data from ORCID Data Getter 
orcidInfo = map {
        authorizedToConfirm: boolean
        orcidUrl: link to the orcid controller
        orcids: map of String to boolean [
            orcid: String (full URI)
            confirmed: boolean
        ]
    } -->


<#assign orcid = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#orcidId")!>
    
    <#if orcidInfo?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    
        <#--<#if !editable && individual.person() >
            <ul style="font-size:0.9em;padding-bottom:4px"><li><strong>ORCID</strong></li></ul>
        </#if> -->
        <ul id="individual-orcid" class="property-list-uos" role="list">
        <#list orcidInfo.orcids?keys as key>
            <li>    
                <img width="17" src="${urls.images}/individual/orcid_logo.png" style="vertical-align: text-top;">
                <a href="${key}" target="_blank">ORCID</a>
            </li>
        </#list>

        <#-- <@p.addLinkWithLabel orcid editable i18n().websites/>
        <#assign localName = orcid.localName>
        <ul id="individual-${localName}" class="individual-urls-uos" role="list" <#if individual.organization() && !editable>style="font-size:1.15em"</#if>>
            <@p.objectProperty orcid editable /> -->
        </ul>

    </#if>

