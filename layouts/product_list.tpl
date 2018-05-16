<!DOCTYPE html>
{% include "template-variables" %}
<html class="content-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="item-list-page main-menu-not-fitting{% if site.search.enabled %} search-enabled{% endif %}">
  {% include "template-svg-spritesheet" %}

  <div class="holder">
    {% include "header" %}

    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <div class="content-wrap">
          {% if page.level != 0 %}
            {% include "submenu_for_current" exclude_products: true %}
          {% endif %}
          <div class="wrap">

            <div class="content formatted cfx" {{ edy_intro_edit_text }}>
              <div class="intro-content" data-search-indexing-allowed="true">{% content %}</div>

              {% include "menu-breadcrumbs" %}
              <section class="content-item-boxes">
                {% if site.root_item.selected? %}
                  {% for level_1 in site.visible_menuitems_with_data %}
                    {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                      {% include "product-list-item" menu_level: level_1 %}
                    {% endif %}
                  {% endfor %}
                {% else %}
                  {% include "product-list-loop" %}
                {% endif %}
              </section>
            </div>
          </div>
        </div>
      </div>
      {% include "footer" %}
    </main>
  </div>

  {% include "langmenu-mobile" %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true  %}

</body>
</html>
