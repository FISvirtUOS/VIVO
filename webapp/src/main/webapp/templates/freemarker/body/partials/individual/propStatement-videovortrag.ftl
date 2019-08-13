<#-- $This file is distributed under the terms of the license in LICENSE$ -->

<#-- VIVO-specific default data property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
<#import "lib-datetime.ftl" as dt>
<#import "lib-meta-tags.ftl" as lmt>
<#if property.rangeDatatypeURI?? && property.rangeDatatypeURI?contains("#")>
	<#assign datatype = property.rangeDatatypeURI?substring(property.rangeDatatypeURI?last_index_of("#")+1) />
<#else>
	<#assign datatype = "none" />
</#if>
<@showStatement statement property datatype />

<#macro showStatement statement property datatype>
    <#assign theValue = statement.value />

		<div style="float: right; clear: right"><iframe width="560" height="315" src="${theValue}"  frameborder="0" 
                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>


	<@lmt.addCitationMetaTag uri=(property.uri!) content=(theValue!) />
</#macro>


