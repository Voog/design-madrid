<!DOCTYPE html>
<html class="front-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>
<body class="main-menu-fits{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">

    {% include "header" %}

    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <script>console.log('{{ page.id }}');</script>
        <div class="content-half content-left js-content-left">
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_left_bg_image }}" data-bg-image-sizes="{{ content_left_bg_image_sizes_str | escape }}" data-bg-color="{{ content_left_bg_color }}" data-bg-color-data="{{ content_left_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="background-color"></div>
          <div class="inner js-background-type {{ content_left_bg_type }}">
            <div class="content formatted cfx">{% content name="left" %}</div>
          </div>
        </div>

        <div class="content-half content-right js-content-right">
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="background-color"></div>
          <div class="inner js-background-type {{ content_right_bg_type }}">
            <div class="content formatted cfx">{% content %}</div>
          </div>
        </div>
      </div>
    </main>
  </div>

  {% include "footer" %}
  {% include "langmenu-mobile" %}
  {% include "javascripts" with "front_page" %}

</body>
</html>
