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
              {%- assign page_title_content_title = "title" | lce -%}
              {%- assign page_title_content_title_tooltip = "content_tooltip_current_page_title" | lce -%}
              <div class="content-header">{% contentblock name="content_header" publish_default_content="true" title=page_title_content_title title_tooltip=page_title_content_title_tooltip %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
              {% include "submenu" exclude_products: true %}
              {%- assign content_default_title = "content" | lce -%}
              <div class="content-body" {{ edy_intro_edit_text }}>{% content title=content_default_title %}</div>
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
