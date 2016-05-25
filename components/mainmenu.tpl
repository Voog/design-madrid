<nav class="main-menu">

  {% if editmode or site.has_many_languages? %}
    <div class="lang-menu-btn-holder js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
      <button role="button" class="lang-menu-btn js-mobile-lang-menu-btn lang-flag lang-flag-{{ page.language_code }}" data-lang-code="{{ page.language_code }}">
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
          <li>
            <a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}>{{ item.title }}</a>
          </li>
        {% endfor %}

        {% if editmode %}
          {% if site.hidden_menuitems.size > 0 %}
            <li>{% menubtn site.hidden_menuitems %}</li>
          {% endif %}

          <li>{% menuadd %}</li>
        {% endif %}
      </ul>
    </div>
  </div>
</nav>
