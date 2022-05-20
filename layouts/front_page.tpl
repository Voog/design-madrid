<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="front-page height-calculation {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" front_page: true %}
  {% include "edicy-tools-styles" %}
</head>
<body class="main-menu-not-fitting{% if site.search.enabled %} search-enabled{% endif %}">
  <div class="holder">

    {% include "header" %}
    {%- assign content_default_title = "content" | lce -%}
    {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <div class="content-half content-left js-bg-picker-area">
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_left_bg_image }}" data-bg-image-sizes="{{ content_left_bg_image_sizes_str | escape }}" data-bg-color="{{ content_left_bg_color }}" data-bg-color-data="{{ content_left_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="background-color js-background-color"></div>
          <div class="inner js-background-type {{ content_left_bg_type }}">
            <div class="align-middle">

              <div class="content formatted cfx">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</div>
            </div>
          </div>
        </div>

        <div class="content-half content-right js-bg-picker-area">
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="background-color js-background-color"></div>
          <div class="inner js-background-type {{ content_right_bg_type }}">
            <div class="align-middle">
              <div class="content formatted cfx">{% content name="default" title=content_default_title title_tooltip=content_default_title_tooltip %}</div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>

  {% include "footer" %}
  {% include "langmenu-mobile" %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" with "front_page" %}
</body>
</html>
