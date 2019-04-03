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

        <div class="container">
            <div class="col-md-12" id="frontimage">
                <a class="listimage" id="frontpage" title="Vivo UOS"></a>
                <p class="citeimage">Foto: Kathrin Schnieders</p>
            </div>
        </div>

        <div class="container">
            <div class="jumbotron">
                <h1>${i18n().intro_title + "@UOS"}</h1>
            </div>
        </div>

        <div class="row hero">
            <div class="container" role="main" id="theme-showcase">
                    <div class="col-md-12">
                
                        <div class="jumbotron">
                            <p>${i18n().intro_para1}</p>
                            <p>${i18n().intro_para2}</p>
                        </div>
                    
                    </div>
            </div>
        </div>

        <div class="row faculty-home">
            <div class="container">
                <div class="col-md-4" id="listsections">
                    <!-- List of four randomly selected faculty members -->
                    <@lh.facultyMbrHtml />
                </div>
                <div class="col-md-4" id="listsections">
                    <!-- List of research classes: e.g., articles, books, collections, conference papers -->
                    <@lh.researchprojectsHtmlUos />
                </div>
                <div class="col-md-4" id="listsections">
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

        <#include "footer.ftl">
        <#-- builds a json object that is used by js to render the academic departments section -->
        <@lh.listAcademicDepartments />
        <@lh.listResearchProjects />
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
