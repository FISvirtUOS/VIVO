<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->
<footer role="contentinfo">
<script src="https://kit.fontawesome.com/865186bfb2.js"></script>
    <div class="row">
        <div class="col-md-12">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <p class="copyright">
                        <#if copyright??>
                            <small>&copy;${copyright.year?c}
                                <#if copyright.url??>
                                    <a href="${copyright.url}" title="${i18n().menu_copyright}">${copyright.text}</a>
                                <#else>
                                ${copyright.text}
                                </#if>
                                | <#--<a class="terms" href="${urls.termsOfUse}" title="${i18n().menu_termuse}">${i18n().menu_termuse}</a></small> | -->
                        </#if>

                        <a href="${urls.privacypolicy}" title="${i18n().menu_privacy_policy}">${i18n().menu_privacy_policy}</a></small>

                        | <a href="${urls.imprint}" title="${i18n().menu_imprint}">${i18n().menu_imprint}</a></small> |

                        ${i18n().menu_powered} <a class="powered-by-vivo" href="http://vivoweb.org" target="_blank" title="${i18n().menu_powered} VIVO"><strong>VIVO</strong></a>
                        and
                        <a class="powered-by-vivo" href="https://www.uni-osnabrueck.de" target="_blank" title="Universität Osnabrück"><strong>UOS</strong></a>
                        <#if user.hasRevisionInfoAccess>
                            | ${i18n().menu_version} <a href="${version.moreInfoUrl}" title="${i18n().menu_version}">${version.label}</a>
                        </#if>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <nav role="navigation">
                            <ul id="footer-nav" role="list">
                                <#-- social media buttons -->
                                <li role="listitem"><a href="https://www.youtube.com/user/uniosnabrueck1/" title="Youtube UOS" target="_blank"><i class="fab fa-youtube"></i></a></li>
                                <li role="listitem"><a href="https://www.instagram.com/uniosnabrueck/" title="Instagram UOS" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                <li role="listitem"><a href="https://www.facebook.com/uniosnabrueck" title="Facebook UOS" target="_blank"><i class="fab fa-facebook-square"></i></a></li>
                                <li role="listitem"><a href="https://twitter.com/UniOsnabrueck" title="Twitter UOS" target="_blank"><i class="fab fa-twitter"></i></a></li>

                                <li role="listitem"><a href="${urls.about}" title="${i18n().menu_about}">${i18n().menu_about}</a></li>
                            <#if urls.contact??>
                                <li role="listitem"><a href="${urls.contact}" title="${i18n().menu_contactus}">${i18n().menu_contactus}</a></li>
                            </#if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<#include "scripts.ftl">