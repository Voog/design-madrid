<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="content-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" common_page: true %}
</head>
<body class="main-menu-not-fitting{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">
    {% include "header" %}

    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <div class="content-wrap">
          {% include "submenu" exclude_products: true %}
          <div class="wrap">

            <div class="content formatted cfx">
              <div class="content-header">{% contentblock name="content_header" publish_default_content="true" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
              {% include "submenu" exclude_products: true %}
              <div class="content-body" {{ edy_intro_edit_text }}>{% content %}</div>
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
  {% include "edicy-tools" %}
</body>
</html>
