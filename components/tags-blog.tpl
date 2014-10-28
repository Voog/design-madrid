{% if site.has_language_tags? %}
  {% assign with_submenu = true %}
  <nav class="menu-sub">
    <div class="wrap">
      <ul class="menu">
        <li class="menu-item">
          <a class="menu-link js-tags-all" href="/{{ page.path }}">{{ 'all_posts' | lc }}</a>
        </li>
        {% for tag in site.language_tags %}
          {% assign activestr = " " %}
          {% for tmptag in tags %}
            {% if tmptag.name == tag.name %}
              {% assign activestr = " active" %}
            {% endif %}
          {% endfor %}
          <li class="menu-item">
            <a class="menu-link{{ activestr }}" href="/{{ page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
          </li>
        {% endfor %}
      </ul>
    </div>
  </nav>
{% endif %}
