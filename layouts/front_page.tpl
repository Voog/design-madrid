<!DOCTYPE html>
<html class="front-page blog-list-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="main-menu-fits{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">

    {% include "header" %}

    <main class="main" data-search-indexing-allowed="true">
      <a href="#" class="scroller-arrow "><span class="animated-bounce"></span></a>
      <div class="main-inner">
        {% if editmode %}
          {% for item in site.menuitems_with_hidden %}
            {% if item.blog? %}
              <div class="new-article link" data-href="{{ item.url }}?new">
                <div class="tbl">
                  <div class="tbl-row">
                    <div class="tbl-cell">
                      <div class="new-article-inner">
                        <svg xmlns="http://www.w3.org/2000/svg" width="72px" height="57px" viewBox="-21 -13.5 72 57">
                          <g>
                            <path fill="none" stroke="currentColor" stroke-width="5" d="M-6,32V-10H47v50H-6C-12,40-17,37-17,31V5h11"></path>
                            <path fill="currentColor" d="M23,8h16v5H23V8z"></path>
                            <path fill="currentColor" d="M23-2h16v5H23V-2z"></path>
                            <path fill="currentColor" d="M23,17h16v5H23V17z"></path>
                            <path fill="currentColor" d="M2,27h37v5H2V27z"></path>
                            <path fill="currentColor" d="M2-2h16v25H2V-2z"></path>
                          </g>
                        </svg>
                        <h3 class="new-article-title">{{ "add_new_post" | lc }}</h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              {% break %}
            {% endif %}
          {% endfor %}
        {% endif %}

        Welcome to Madrid
      </div>
    </main>
  </div>

  {% include "footer" %}
  {% include "langmenu-mobile" %}
  {% include "javascripts" %}
  {% include "bg-picker" %}

  <script>
    $(window).load(function() {
      $('.main').lazyLoad({
        className: '--lazy',
        urlData: 'article-image',
        distance: 300
      });
    });
  </script>
</body>
</html>
