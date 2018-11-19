<nav class="main-menu">

  {% if editmode or site.has_many_languages? %}
    <div class="lang-menu-btn-holder js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <button role="button" class="lang-menu-btn js-mobile-lang-menu-btn lang-flag lang-flag-{{ page.language_code }}" data-lang-code="{{ page.language_locale }}">
        <span class="lang-title">
          {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
          <span class="ico-popover-toggle">▼</span>
        </span>
      </button>
    </div>
  {% endif %}

  <a href="#close" class="mobile-dialog-close js-mobile-main-menu-close"></a>

  <div class="main-menu-wrap">
    <div class="main-menu-inner">
      <ul>
        {% unless site.root_item.hidden? %}
          <li>
            <a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>
          </li>
        {% endunless %}

        {% for item in site.visible_menuitems %}
          {% if site.root_item.layout_title == product_list_layout %}
            {% if editmode %}
              {% include "menu-level-1-link" render_hidden_categories: true %}
            {% else %}
              {% unless show_product_related_pages_in_main_menu %}
                {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
                  {% include "menu-level-1-link" %}
                {% endunless %}
              {% else %}
                {% include "menu-level-1-link" %}
              {% endunless %}
            {% endif %}
          {% else %}
            {% include "menu-level-1-link" %}
          {% endif %}
        {% endfor %}

        {% if editmode %}
          {% if site.hidden_menuitems.size > 0 %}
            <li>{% menubtn site.hidden_menuitems %}</li>
          {% endif %}

          <li {{ edy_intro_add_page }}>{% menuadd %}</li>
        {% endif %}
      </ul>
    </div>
  </div>
</nav>
