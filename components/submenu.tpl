{% for item in site.menuitems %}
  {% if item.selected? %}
    {% if editmode or item.children? %}
      <nav class="sub-menu" data-search-indexing-allowed="false">
        <ul>
          {% for level2 in item.visible_children %}
            <li><a href="{{level2.url}}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level2.title}}</a></li>
          {% endfor %}
          {% if editmode %}
            {% if item.hidden_children.size > 0 %}<li class="edy-btn">{% menubtn item.hidden_children %}</li>{% endif %}
            <li class="edy-btn">{% menuadd parent="item"%}</li>
          {% endif %}
        </ul>
      </nav>
    {% endif%}
  {% endif %}
{% endfor %}
