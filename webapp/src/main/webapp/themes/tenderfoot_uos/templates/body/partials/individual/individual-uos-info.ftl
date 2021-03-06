<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- List of additional informations for individuals of the University of Osnabrueck -->
<#assign denominationen = propertyGroups.pullProperty("https://fis.uos.de/vivouos/ontology/uoscore/Denomination")!>
<#assign professur = propertyGroups.pullProperty("http://kerndatensatz-forschung.de/owl/Basis#BezeichnungDerProfessur")!>
<#assign fach = propertyGroups.pullProperty("http://kerndatensatz-forschung.de/owl/Basis#hatFach")!>
<#assign institute = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0000053")!>
<#assign keywords = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#freetextKeyword")!>

<div class="col-md-8 uos_info_table_cell">
    <#if denominationen?has_content>
        <ul class="property-list-uos-inline" role="list" id="${denominationen.localName}">
            <#if professur?has_content>
                <@p.dataPropertyList professur editable /> für
            </#if>
            <@p.dataPropertyList denominationen editable />
        </ul>
    </#if>
    <#if institute?has_content>
        <#assign localName = institute.localName>
        <@p.verboseDisplay institute />
        <ul class="property-list-uos" id="individual-${institute.localName}" role="list" >
            <@p.objectProperty institute editable />
        </ul>
    </#if> 
    <#if fach?has_content>
        <#assign localName = fach.localName>
        <@p.verboseDisplay fach />
        <ul class="property-list-uos" id="individual-${fach.localName}" role="list" >
            <@p.objectProperty fach editable />
        </ul>
    </#if>
    <#if keywords?has_content>
        <h2 class="profile_research_priorities">
            ${i18n().research_priorities}
        </h2>
        <ul class="property-list-uos" role="list" id="${keywords.localName}">
            <@p.dataPropertyList keywords editable />
        </ul>
    </#if>
    <!-- ORCID -->
	<#include "individual-orcid-vcard-uos.ftl">
    <!-- Positions -->
	<#include "individual-positions.ftl">
	<!-- Research Areas -->
	<#include "individual-researchAreas.ftl">
</div>
<div class="col-md-4 uos_info_table_cell">
    <div>
        <!-- Contact Info -->
    	<#include "individual-contactInfo.ftl">
    </div>
    <div id="uos_info_table_cell_links">
        
        <!-- Websites -->
    	<#include "individual-webpage.ftl">

    </div>
</div>
