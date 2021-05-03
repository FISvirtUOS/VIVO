<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for property listing on individual profile page -->

<#import "lib-properties.ftl" as p>
<#assign subjectUri = individual.controlPanelUrl()?split("=") >
<#assign tabCount = 1 >
<#assign sectionCount = 1 >

<#-- external site über website gelöst, wenn auch eigenes Feld haben soll muss das umgebaut werden -->
<#--  <#assign externalSite = propertyGroups.pullProperty("https://fis.uos.de/vivouos/ontology/uoscore/hatexterneprojektseite")!>  -->
<#if !editable>
	<#assign employees = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#contributingRole")!>
</#if>

<div class="row">
    <div class="col-md-12 tab-content">
		<#list propertyGroups.all as group>
			<#if (group.properties?size > 0)>
				<#assign groupName = group.getName(nameForOtherGroup)>
				<#assign groupNameHtmlId = p.createPropertyGroupHtmlId(groupName) >
				<#assign verbose = (verbosePropertySwitch.currentValue)!false>

                <div id="${groupNameHtmlId?replace("/","-")}Group"
                     class="tab-pane <#if (sectionCount == 1) >active</#if>"
                     role="tabpanel">
					<#-- Display the group heading -->
					<#if groupName?has_content>
						<#--the function replaces spaces in the name with underscores, also called for the property group menu-->
						<#assign groupNameHtmlId = p.createPropertyGroupHtmlId(groupName) >
                        <h2 id="${groupNameHtmlId?replace("/","-")}" pgroup="tabs" class="hidden">${groupName?capitalize}</h2>
					<#else>
                        <h2 id="properties" pgroup="tabs" class="hidden">${i18n().properties_capitalized}</h2>
					</#if>
					<#-- List the properties in the group   -->
					<#if editable>
						<#include "individual-properties.ftl">
					<#else>
						<#include "individual--uos-project-properties.ftl">
					</#if>
                </div>
				<#assign sectionCount = 2 >
			</#if>
		</#list>
    </div>
</div>

<#if employees?has_content >
	<div class="row">
		<#--  <div class="col-md-12" >  -->
			<div class="col-md-6">
				<#--  <div class="col-md-12 uos-project-div">
					<#if externalSite?has_content >
						<span>
							<img class="uos_project_icons" alt="Image Projekt-Links" src="${urls.images}/individual/bookmark-solid.svg" >
							<h2 class="uos-project-h2">Projektlinks</h3>
						</span>
						<ul class="property-list uos-project-list-ul" role="list" id="${externalSite.localName}-List" displayLimit="5">
							<@p.dataPropertyList externalSite editable />
						</ul>
					</#if>
				</div>
				<br>  -->
				<div class="col-md-12 uos-project-div">
					<span>
						<img class="uos_project_icons" alt="Image employees" src="${urls.images}/individual/user-solid.svg" >
						<h2 class="uos-project-h2">${i18n().employees}</h3>
					</span>
					<ul class="property-list uos-project-list-ul" role="list" id="${employees.localName}-List" displayLimit="10">
						<@p.objectProperty employees editable />
					</ul>
				</div>
			<#--  </div>  -->
		</div>
	</div>
</#if>

<script>
    var individualLocalName = "${individual.localName}";
</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual-property-groups.css" />')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/amplify/amplify.store.min.js"></script>')}
${scripts.add('<script src="${urls.theme}/js/propertyGroupControls-bootstrap.js"></script>')}
