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

    <a href="#" class="main-menu-toggler{% unless site.visible_menuitems != blank or editmode %} hidden-tablet{% endunless %}{% unless show_menu_btn or editmode %} hidden-mobile{% endunless %} js-main-menu-toggler"><span>{{ "menu" | lc }}</span></a>
    <a href="#" class="main-menu-toggler main-menu-toggler-mobile{% unless site.visible_menuitems != blank or editmode %} hidden-tablet{% endunless %}{% unless show_menu_btn or editmode %} hidden-mobile{% endunless %} js-mobile-main-menu-toggler"><span>{{ "menu" | lc }}</span></a>
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
