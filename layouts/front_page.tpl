<!DOCTYPE html>
<html class="front-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="main-menu-fits{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">

    {% include "header" %}

    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <div class="content-half content-left">
          <div class="inner">
            <div class="content formatted cfx">{% content name="left" %}</div>
          </div>
        </div>
        <div class="content-half content-right">
          <div class="inner">
            <div class="content formatted cfx">{% content %}</div>
          </div>
        </div>
      </div>
    </main>
  </div>

  {% include "footer" %}
  {% include "langmenu-mobile" %}
  {% include "javascripts" %}
  {% include "bg-picker" %}
</body>
</html>
