<#-- $This file is distributed under the terms of the license in /doc/license.txt$  -->

<@widget name="login" include="assets" />

<#-- 
        With release 1.6, the home page no longer uses the "browse by" class group/classes display. 
        If you prefer to use the "browse by" display, replace the import statement below with the
        following include statement:
        
            <#include "browse-classgroups.ftl">
            
        Also ensure that the homePage.geoFocusMaps flag in the runtime.properties file is commented
        out.
-->
<#import "lib-home-page.ftl" as lh>

<!DOCTYPE html>
<html lang="en">
    <head>
        <#include "head.ftl">
        <#if geoFocusMapsEnabled >
            <#include "geoFocusMapScripts.ftl">
        </#if>
        <script async type="text/javascript" src="${urls.base}/js/homePageUtils.js?version=x"></script>
    </head>
    
    <body class="${bodyClasses!}" onload="${bodyOnload!}">
        <#-- supplies the faculty count to the js function that generates a random row number for the search query -->
        <@lh.facultyMemberCount  vClassGroups! />
		<header id="branding" role="banner">
			<#include "identity.ftl">
		</header>
        <#include "developer.ftl">
        <#include "menu.ftl">
        <#include "message.ftl">
        <div class="row hero">
            <div class="theme-showcase">
                <div class="col-md-12">
                    <div class="container" role="main">
                        <div class="jumbotron">
                            <h1>${i18n().intro_title + "@UOS"}</h1>
                        </div>
                        <form id="search-homepage" action="${urls.search}" name="search-home" role="search" method="post" class="form-horizontal">
                            <fieldset>
                                <div class="form-group pull-left" style="margin-right: 5px;">
                                    <select class="form-control" id="classgroup" name="classgroup">
                                        <option value="">${i18n().all_capitalized}</option>
                                        <#list vClassGroups as group>
                                            <#if (group.individualCount > 0)>
                                                <option value="${group.uri}">${group.displayName?capitalize}</option>
                                            </#if>
                                        </#list>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" name="querytext" class="form-control" value="" placeholder="${i18n().search_form}" autocapitalize="off" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <span class="icon-search">${i18n().search_button}</span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="container">
                        <div class="jumbotron">
                            <p>${i18n().intro_para1}</p>
                            <p>${i18n().intro_para2}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row faculty-home">
            <div class="container">
                <div class="col-md-4">
                    <!-- List of research classes: e.g., articles, books, collections, conference papers -->
                    <@lh.researchClasses />
                </div>
                <div class="col-md-4">
                    <!-- List of four randomly selected faculty members -->
                    <@lh.facultyMbrHtml />
                </div>
                <div class="col-md-4">
                    <!-- List of randomly selected academic departments -->
                    <@lh.academicDeptsHtml />
                </div>
            </div>
        </div>

        <#if geoFocusMapsEnabled >
            <div class="row geo-focus">
                <div class="container">
                    <div class="col-md-12">
                        <!-- Map display of researchers' areas of geographic focus. Must be enabled in runtime.properties -->
                        <@lh.geographicFocusHtml />
                    </div>
                </div>
            </div>
        </#if>

        <!-- List of research classes: e.g., articles, books, collections, conference papers -->
        <div class="row research-count">
            <div class="container">
                <!-- div class="col-md-6">
                </div -->
                <div class="col-md-12">
                    <!-- Statistical information relating to property groups and their classes; displayed horizontally, not vertically-->
                    <@lh.allClassGroups vClassGroups! />
                </div>
            </div>
        </div>

        <!-- Profillinien UOS -->
        <div class="row research-count">
            <div class="container">
                <div class="col-md-12">
                    <h2 class="h1">Explore our key research areas</h2>
                    <p>Explore by Subject Area</p>
                </div>
            </div>
            <div class="container">
                <div class="col-md-4">
                    <a class="listimage" id="leli1" title="P1: Digitale Gesellschaft - Innovation - Regulierung" href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/digitale_gesellschaft_innovation_regulierung.html"><span>${"P1: Digitale Gesellschaft - Innovation - Regulierung"}</span></a>
                </div>
                <div class="col-md-4">
                    <a class="listimage" id="leli2" title='P2: Integrated Science: Vom Einzelmolekül zum System' href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/integrated_science.html"><span>${"P2: Integrated Science: Vom Einzelmolek&uuml;l zum System"}</span></a>
                </div>
                <div class="col-md-4">
                    <a class="listimage" id="leli3" title="P3: Kognition: Mensch - Technik - Interaktion" href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/kognition.html"><span>${"P3: Kognition: Mensch ? Technik ? Interaktion"}</span></a>
                </div>
            </div>
            <div class="container">
                <div class="col-md-4">
                    <a class="listimage" id="leli4" title="P4: Mathematische Strukturen und Modelle" href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/mathematische_strukturen_und_modelle.html"><span>${"P4: Mathematische Strukturen und Modelle"}</span></a>
                </div>
                <div class="col-md-4">
                        <a class="listimage" id="leli5" title="P5: Mensch-Umwelt-Netzwerke" href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/mensch_umwelt_netzwerke.html"><span>${"P5: Mensch-Umwelt-Netzwerke"}</span></a>
                </div>
                <div class="col-md-4">
                    <a class="listimage" id="leli6" title="P6: Migrationsgesellschaften" href="https://www.uni-osnabrueck.de/universitaet/profil/profillinien/migrationsgesellschaften.html"><span>${"P6: Migrationsgesellschaften"}</span></a>
                </div>
            </div>
        </div>


        <#include "footer.ftl">
        <#-- builds a json object that is used by js to render the academic departments section -->
        <@lh.listAcademicDepartments />
    <script>       
        var i18nStrings = {
            researcherString: '${i18n().researcher}',
            researchersString: '${i18n().researchers}',
            currentlyNoResearchers: '${i18n().currently_no_researchers}',
            countriesAndRegions: '${i18n().countries_and_regions}',
            countriesString: '${i18n().countries}',
            regionsString: '${i18n().regions}',
            statesString: '${i18n().map_states_string}',
            stateString: '${i18n().map_state_string}',
            statewideLocations: '${i18n().statewide_locations}',
            researchersInString: '${i18n().researchers_in}',
            inString: '${i18n().in}',
            noFacultyFound: '${i18n().no_faculty_found}',
            placeholderImage: '${i18n().placeholder_image}',
            viewAllFaculty: '${i18n().view_all_faculty}',
            viewAllString: '${i18n().view_all}',
            viewAllDepartments: '${i18n().view_all_departments}',
            noDepartmentsFound: '${i18n().no_departments_found}'
        };
        // set the 'limmit search' text and alignment
        if  ( $('input.search-homepage').css('text-align') == "right" ) {       
             $('input.search-homepage').attr("value","${i18n().limit_search} \u2192");
        }  
    </script>
    </body>
</html>