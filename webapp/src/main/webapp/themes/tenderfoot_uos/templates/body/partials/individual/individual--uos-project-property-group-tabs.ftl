<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for property listing on individual profile page -->

<#import "lib-properties.ftl" as p>
<#assign subjectUri = individual.controlPanelUrl()?split("=") >
<#assign tabCount = 1 >
<#assign sectionCount = 1 >


<#assign externalProjectSite = propertyGroups.pullProperty("https://fis.uos.de/vivouos/ontology/uoscore/hatexterneprojektseite")!>
<#assign projectTeam = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/BFO_0000055")!>
<#assign projectOutput = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/RO_0002234")!>

<div class="row">
    <div class="col-md-12 tab-content">
		<#if ProjectLeader?has_content>
			<div class="col-md-12 uos_table_div" role="article">
				<div class="col-md-3">
					<h3 id="project_leader" title="Leader of the project">Projektleitung</h3>
				</div>
				<div class="col-md-9">
        			<ul class="property-list" role="list" id="projectleader-ul" displayLimit="5">
						<#list ProjectLeader as leader>
							<li role="listitem">
								<span>
									<a href="${profileUrl(leader.leaderuri)}" title="Projektleiter">
									${leader.leaderlabel}
									</a>
									${leader.leaderrolelabel}
								</span>
							</li>
						</#list>
					</ul>
				</div>
			</div>			
		</#if>

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

<div class="row">
	<div class="col-md-12" >
		<div class="col-md-6">
			<div class="col-md-12 uos-project-div">
				<#if externalProjectSite?has_content >
					<span>
						<img class="uos_project_icons" alt="Image Projekt-Links" src="${urls.images}/individual/bookmark-solid.svg" >
						<h2 class="uos-project-h2">Projektlinks</h3>
					</span>
					<ul class="property-list uos-project-list-ul" role="list" id="${externalProjectSite.localName}-List" displayLimit="5">
						<@p.dataPropertyList externalProjectSite editable />
					</ul>
				</#if>
			</div>
			<br>
			<div class="col-md-12 uos-project-div">
				<#if projectTeam?has_content >
					<span>
						<img class="uos_project_icons" alt="Image Projekt-Team" src="${urls.images}/individual/user-solid.svg" >
						<h2 class="uos-project-h2">Projektteam</h3>
					</span>
					<ul class="property-list uos-project-list-ul" role="list" id="${projectTeam.localName}-List" displayLimit="10">
						<@p.objectProperty projectTeam editable />
					</ul>
				</#if>
			</div>
		</div>
		<div class="col-md-6 uos-project-div">
			<#if projectOutput?has_content >
				<span>
					<img class="uos_project_icons" alt="Image Projekt-Output" src="${urls.images}/individual/book-open-solid.svg" >
					<h2 class="uos-project-h2">Projektergebnisse</h3>
				</span>
				<ul class="property-list uos-project-list-ul" role="list" id="${projectOutput.localName}-List" displayLimit="10">
					<@p.objectProperty projectOutput editable /> 
				</ul>
			</#if>
		</div>
	</div>
</div>

<script>
    var individualLocalName = "${individual.localName}";
</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual-property-groups.css" />')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/amplify/amplify.store.min.js"></script>')}
${scripts.add('<script src="${urls.theme}/js/propertyGroupControls-bootstrap.js"></script>')}
