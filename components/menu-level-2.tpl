{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    {% assign with_submenu = true %}
    <nav class="menu-sub">
      <div class="wrap">
        <ul class="menu">
          {% if editmode or item.children? %}
            {% for subitem in item.visible_children %}
              <li class="menu-item">
                <a class="menu-link{% if subitem.selected? %} active{% endif %}{% unless subitem.translated? %} untranslated fci-editor-menuadd{% endunless %}" href="{{ subitem.url }}">{{ subitem.title }}</a>
              </li>
            {% endfor %}
          {% endif %}
          {% if item.hidden_children.size > 0 %}<li>{% menubtn item.hidden_children %}</li>{% endif %}
          {% if editmode %}<li class="edit-btn">{% menuadd parent="item" %}</li>{% endif %}
        </ul>
      </div>
    </nav>
  {% endif %}
{% endfor %}
