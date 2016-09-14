{% if editmode or site.has_many_languages? %}
  <nav class="lang-menu js-popup-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}" {{ edy_intro_add_lang }}>
    <button role="button" class="lang-menu-btn js-popup-menu-btn lang-flag lang-flag-{{ page.language_code }}" data-lang-code="{{ page.language_code }}">

      {% if editmode or flags_state == nil or flags_state == false %}
      <span class="lang-title">
        {% for language in site.languages %}{% if language.selected? %}{{ language.title }}{% endif %}{% endfor %}
        <span class="ico-popover-toggle">▼</span>
      </span>
      {% endif %}
    </button>

    <div class="lang-menu-popover js-popup-menu-popover">
      {% if editmode or site.has_many_languages? %}
        <ul class="menu">
          {% for language in site.languages %}
            <li><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.code }}">{{ language.title }}</a></li>
          {% endfor %}

          {% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
        </ul>

        {% if editmode %}
          <div class="lang-options">
            <a href="#" class="option-btn js-option-toggle-flags{% if flags_state %} js-flags-enabled{% endif %}">
              <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
              <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
            </a>
          </div>
        {% endif %}
      {% endif %}
    </div>
  </nav>
{% endif %}
