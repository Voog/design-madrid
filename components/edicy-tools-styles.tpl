<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if content_left_bg.imageSizes != nil %}
    {% if content_left_bg.imageSizes == "" %}
      .content-left {
        background-image: none;
      }
    {% else %}
      /* is not nill*/
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
    /* is nill*/

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

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_left_bg.color %}
    .content-left .background-color {
      background-color: {{ page.data.content_left_bg.color }};
    }
  {% else %}
    .content-left .background-color {
      background-color: {{ content_left_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_right_bg.imageSizes != nil %}
    {% if content_right_bg.imageSizes == "" %}
      .content-right {
        background-image: none;
      }
    {% else %}
      /* is not nill*/
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

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_right_bg.color %}
    .content-right .background-color {
      background-color: {{ page.data.content_right_bg.color }};
    }
  {% else %}
    .content-right .background-color {
      background-color: {{ content_right_bg_color }};
    }
  {% endif %}
</style>
