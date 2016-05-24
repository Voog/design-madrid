  {% if editmode or site.has_many_languages? %}
  <div class="lang-menu-holder">
    <a href="#close" class="mobile-dialog-close js-mobile-lang-menu-close"></a>
    <div class="lang-menu-wrap">
      <div class="lang-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
        <ul>
          {% for language in site.languages %}
            <li>
              <a class="{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a>
            </li>
          {% endfor %}
          {% if editmode %}
            <li>{% languageadd %}</li>
            <li class="lang-options-holder">
              <div class="lang-options">
                <a href="#" class="option-btn js-option-toggle-flags{% if flags_state %} js-flags-enabled{% endif %}">
                    <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
                    <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
                  </a>
              </div>
            </li>
          {% endif %}
        </ul>
      </div>
    </div>
  </div>
  {% endif %}
