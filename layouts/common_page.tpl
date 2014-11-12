<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">
    {% include "header" %}
  
    <main class="main" data-search-indexing-allowed="true">
      <div class="content-wrap">
        {% include "submenu" %}
        <div class="wrap">
          
          <div class="content formatted cfx">
            <div class="content-header">{% contentblock name="content_header" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
            {% include "submenu" %}
            {% content %}
          </div>
        </div>
      </div>
      {% include "footer" %}
    </main>
  </div>
  
  {% include "langmenu-mobile" %}
  {% include "javascripts" %}
  
</body>
</html>
