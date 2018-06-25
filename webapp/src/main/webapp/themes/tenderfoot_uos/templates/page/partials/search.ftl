<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#--Breaking this out so this can be utilized by other pages such as the jsp advanced tools pages-->

 <#-- $This file is distributed under the terms of the license in LICENSE$ -->
 
<section id="search" role="region">
    <fieldset>
        <legend>${i18n().search_form}</legend>

        <form id="search-form" action="${urls.search}" name="search" role="search" accept-charset="UTF-8" method="POST"> 
            <div class="input-group">
                <input id="search-field-box" type="text" class="form-control" placeholder='${i18n().find_expert}'>
                <span class="input-group-btn">
                    <button id="search-field-box-button" class="btn btn-default" type="button">
                        <svg id="search-icon" class="search-icon">
                                <path d="m 4.8495 7.8226 c 0.82666 0 1.5262 -0.29146 2.0985 -0.87438 c 0.57232 -0.58292 0.86378 -1.2877 0.87438 -2.1144 c 0.010599 -0.82666 -0.28086 -1.5262 -0.87438 -2.0985 c -0.59352 -0.57232 -1.293 -0.86378 -2.0985 -0.87438 c -0.8055 -0.010599 -1.5103 0.28086 -2.1144 0.87438 c -0.60414 0.59352 -0.8956 1.293 -0.87438 2.0985 c 0.021197 0.8055 0.31266 1.5103 0.87438 2.1144 c 0.56172 0.60414 1.2665 0.8956 2.1144 0.87438 Z m 4.4695 0.2115 l 3.681 3.6819 l -1.259 1.284 l -3.6817 -3.7 l 0.0019784 -0.69479 l -0.090043 -0.098846 c -0.87973 0.76087 -1.92 1.1413 -3.1207 1.1413 c -1.3553 0 -2.5025 -0.46363 -3.4417 -1.3909 s -1.4088 -2.0686 -1.4088 -3.4239 c 0 -1.3553 0.4696 -2.4966 1.4088 -3.4239 c 0.9392 -0.92727 2.0864 -1.3969 3.4417 -1.4088 c 1.3553 -0.011889 2.4906 0.45771 3.406 1.4088 c 0.9154 0.95107 1.379 2.0924 1.3909 3.4239 c 0 1.2126 -0.38043 2.2588 -1.1413 3.1385 l 0.098834 0.090049 Z" />
                        </svg>
                    </button>
                </span>
            </div>
        </form>
    </fieldset>
</section>
        