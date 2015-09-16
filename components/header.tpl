<header class="header">
  <div class="header-inner">
    {% if site.search.enabled %}
      <div class="search-holder">
        <a href="#" class="search-toggler js-search-toggler">
          {% include "search-svg" %}
        </a>
        {% include "search" %}
      </div>
    {% endif %}

    <a href="#" class="main-menu-toggler js-main-menu-toggler"><span>{{ "menu" | lc }}</span></a>
    <a href="#" class="main-menu-toggler main-menu-toggler-mobile js-mobile-main-menu-toggler"><span>{{ "menu" | lc }}</span></a>
  </div>

  <div class="site-title">
    <div class="site-title-wrap">
      <div class="site-title-inner">
        {% editable site.header %}
      </div>
    </div>
  </div>

  {% include "mainmenu" %}
</header>
