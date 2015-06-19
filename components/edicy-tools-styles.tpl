<style>
  {% comment %}/* Front page left content area background styles */{% endcomment %}
  {% if content_left_bg.imageSizes != nil %}
    {% if content_left_bg.imageSizes == "" %}
      .content-left {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_left_bg.imageSizes %}
        {% if forloop.first %}
          .content-left {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-left {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-page-left-bg" %}

    .content-left {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-left {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Front page left content area background color style */{% endcomment %}
  .content-left .background-color {
    {% if content_left_bg.color %}
      background-color: {{ page.data.content_left_bg.color }};
    {% else %}
      background-color: {{ content_left_bg_color }};
    {% endif %}
  }

  {% comment %}/* Front page right content area background styles */{% endcomment %}
  {% if content_right_bg.imageSizes != nil %}
    {% if content_right_bg.imageSizes == "" %}
      .content-right {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_right_bg.imageSizes %}
        {% if forloop.first %}
          .content-right {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-right {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Front page right content area background color style */{% endcomment %}
  .content-right .background-color {
    {% if content_right_bg.color %}
      background-color: {{ page.data.content_right_bg.color }};
    {% else %}
      background-color: {{ content_right_bg_color }};
    {% endif %}
  }
</style>
