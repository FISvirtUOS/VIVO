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
<h3> Hier beginnt das Detail-Template der vivo:Presentations <h3>
<section id="individual-intro" class="vcard" role="region" <@mf.sectionSchema individual/>>

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
        </header>

                
    <#if individualProductExtension??>
        ${individualProductExtension}
    <#else>
            </section> <!-- individual-info -->
        </section> <!-- individual-intro -->
    </#if>


<#assign description = propertyGroups.pullProperty("http://vivoweb.org/ontology/core#description")!>

    <div class="col-md-6" style="text-align: justify;">
        <#if description?has_content>
            <@p.dataPropertyList description editable />
        </#if>
    </div>

    <div class="col-md-6">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/qas_6jEkVBQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

<#assign nameForOtherGroup = "${i18n().other}"> 

<!-- Property group menu or tabs -->
<#-- 
    With release 1.6 there are now two types of property group displays: the original property group
     menu and the horizontal tab display, which is the default. If you prefer to use the property
     group menu, simply substitute the include statement below with the one that appears after this
     comment section.
     
     <#include "individual-property-group-menus.ftl">
-->
<#include "individual-property-group-tabs.ftl">
<div class="col-md-6" style="text-align: justify;">
    <div class="fb-page" data-href="https://www.facebook.com/uniosnabrueck/" data-tabs="timeline" data-width="500" data-height="1000" 
        data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
            <blockquote cite="https://www.facebook.com/uniosnabrueck/" class="fb-xfbml-parse-ignore">
                <a href="https://www.facebook.com/uniosnabrueck/">Universität Osnabrück</a>
            </blockquote>
    </div>
</div>
<div class="col-md-6" style="text-align: justify;">
    <a class="twitter-timeline" href="https://twitter.com/UniOsnabrueck?ref_src=twsrc%5Etfw">Tweets by UniOsnabrueck</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
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
