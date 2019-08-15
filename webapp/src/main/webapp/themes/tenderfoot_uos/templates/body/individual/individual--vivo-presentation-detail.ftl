<#-- $This file is distributed under the terms of the license in LICENSE$ -->
<#import "lib-microformats.ftl" as mf>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/de_DE/sdk.js#xfbml=1&version=v3.3"></script>

<#--Number of labels present-->
<#if !labelCount??>
    <#assign labelCount = 0 >
</#if>
<#--Number of available locales-->
<#if !localesCount??>
	<#assign localesCount = 1>
</#if>
<#--Number of distinct languages represented, with no language tag counting as a language, across labels-->
<#if !languageCount??>
	<#assign languageCount = 1>
</#if>	

<#-- Default individual profile page template -->
<#--@dumpAll /-->
<#include "individual-adminPanel.ftl">

<section id="individual-intro" class="vcard" role="region" <@mf.sectionSchema individual/>>

<div class="row uos_profile_headline">
    <section id="share-contact" role="region">
        <#-- Image -->
        <#assign individualImage>
        <@p.image individual=individual
            propertyGroups=propertyGroups
            namespaces=namespaces
            editable=editable
            showPlaceholder="with_add_link" />
        </#assign>

        <#if ( individualImage?contains('<img class="individual-photo"') )>
            <#assign infoClass = 'class="withThumb"'/>
        </#if>
        <div id="photo-wrapper">${individualImage}</div>
    </section>

    <!-- start section individual-info -->
    <section id="individual-info" ${infoClass!} role="region">

        <#if individualProductExtensionPreHeader??>
            ${individualProductExtensionPreHeader}
        </#if>
        
            <header>
                <#if relatedSubject??>
                    <h2>${relatedSubject.relatingPredicateDomainPublic} for ${relatedSubject.name}</h2>
                    <p><a href="${relatedSubject.url}" title="${i18n().return_to(relatedSubject.name)}">&larr; ${i18n().return_to(relatedSubject.name)}</a></p>                
                <#else>                
                    <h1 class="fn" itemprop="name">
                        <#-- Label -->
                        <@p.label individual editable labelCount localesCount languageCount/>

                        <span id="iconControlsVitro"><img id="uriIcon" title="${individual.uri}" class="middle" src="${urls.images}/individual/uriIcon.gif" alt="uri icon"/></span>
                        <br/>
                    </h1>
                    <@p.findautoruospresentation AutorAndRole />
                </#if>

                <#if !editable>
                    <#assign orga_units = propertyGroups.pullProperty("http://kerndatensatz-forschung.de/owl/Basis#hatOrganisationseinheit")!>
                    <#assign field = propertyGroups.pullProperty("http://kerndatensatz-forschung.de/owl/Basis#hatFach")!>
                    <#assign date = propertyGroups.pullProperty("https://fis.uos.de/vivouos/ontology/uoscore/veranstaltungsdatum")!>

                    <#if orga_units?has_content>
                        <ul class="property-list" role="list" id="orga_units_presentation">
                            <@p.objectProperty orga_units editable />
                        </ul>
                    </#if>
                    <#if field?has_content>
                        <ul class="property-list" role="list" id="field_presentation">
                            <@p.objectProperty field editable />
                        </ul>
                    </#if>
                    <#if date?has_content>
                        <ul class="property-list" role="list" id="date_presentation">
                            <@p.dataPropertyList date editable />
                        </ul>
                    </#if>
                </#if>
            </header>
        </div>

    <#if individualProductExtension??>
        ${individualProductExtension}
    <#else>
            </section> <!-- individual-info -->
        </section> <!-- individual-intro -->
    </#if>

<#if !editable>
    <#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>
    <#assign video_url = propertyGroups.pullProperty("https://fis.uos.de/vivouos/ontology/uoscore/videovortrag")!>
    <#assign tmp_template = "propStatement-videovortrag.ftl">

    <div style="margin: 30px 10px 30px 10px;">
        <#if video_url?has_content>
            <ul id="individual-videovortrag_iframe" class="individual-urls-uos" role="list">
                <@p.dataPropertyList video_url editable tmp_template />
            </ul>
        </#if>
        <#if description?has_content>
            <ul>
                <@p.dataPropertyList description editable />
            </ul>
        </#if>
    </div>
</#if>

<#assign nameForOtherGroup = "${i18n().other}"> 

<!-- Property group menu or tabs -->
<#-- 
    With release 1.6 there are now two types of property group displays: the original property group
     menu and the horizontal tab display, which is the default. If you prefer to use the property
     group menu, simply substitute the include statement below with the one that appears after this
     comment section.
     
     <#include "individual-property-group-menus.ftl">
-->
<#if editable>
    <#include "individual-property-group-tabs.ftl">
</#if>

<div class="col-md-6" style="text-align: justify;">
    <div class="fb-page" data-href="https://www.facebook.com/uniosnabrueck/" data-tabs="timeline" data-width="500" data-height="1000" 
        data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
            <blockquote cite="https://www.facebook.com/uniosnabrueck/" class="fb-xfbml-parse-ignore">
                <a href="https://www.facebook.com/uniosnabrueck/">Universität Osnabrück</a>
            </blockquote>
    </div>
</div>
<div class="col-md-6" style="text-align: justify;">
    <a class="twitter-timeline" href="https://twitter.com/UniOsnabrueck?ref_src=twsrc%5Etfw"  data-height="1042">Tweets by Uni Osnabrueck</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</div>

<#assign rdfUrl = individual.rdfUrl>

<#if rdfUrl??>
    <script>
        var individualRdfUrl = '${rdfUrl}';
    </script>
</#if>
<script>
    var i18nStringsUriRdf = {
        shareProfileUri: '${i18n().share_profile_uri}',
        viewRDFProfile: '${i18n().view_profile_in_rdf}',
        closeString: '${i18n().close}'
    };
	var i18nStrings = {
	    displayLess: '${i18n().display_less}',
	    displayMoreEllipsis: '${i18n().display_more_ellipsis}',
	    showMoreContent: '${i18n().show_more_content}',
	};

</script>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
                  '<link rel="stylesheet" type="text/css" href="${urls.base}/css/jquery_plugins/qtip/jquery.qtip.min.css" />')}

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip.min.js"></script>',
                  '<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
	          '<script type="text/javascript" src="${urls.base}/js/individual/moreLessController.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/individual/individualUriRdf.js"></script>')}

<script type="text/javascript">
    i18n_confirmDelete = "${i18n().confirm_delete}";
</script>
