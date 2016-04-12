{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_left_bg = page.data.content_left_bg %}
  {% assign content_left_bg_image = page.data.content_left_bg.image %}
  {% assign content_left_bg_image_sizes = page.data.content_left_bg.imageSizes %}
  {% assign content_left_bg_color = page.data.content_left_bg.color %}
  {% assign content_left_bg_color_data = page.data.content_left_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_left_bg %}
    {% if content_left_bg_color_data.a >= 0.2 %}
      {% if content_left_bg_color_data.lightness >= 0.5 %}
        {% assign content_left_bg_type = 'light-background' %}
      {% else %}
        {% assign content_left_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_left_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_left_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_left_bg_image == nil %}
    {% assign content_left_bg_image_original = images_path | append: '/front-page-left-bg.jpg' %}
    {% assign content_left_bg_image = images_path | append: '/front-page-left-bg_block.jpg' %}
  {% endif %}

  {% if content_left_bg_image_sizes == nil %}
    {% assign content_left_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-left-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-left-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_left_bg_image_sizes_str = content_left_bg_image_sizes | json %}
  {% endif %}

  {% if content_left_bg_color == nil %}
    {% assign content_left_bg_color = 'rgba(249,205,0,0.1)' %}
  {% endif %}

  {% if content_left_bg_color_data == nil %}
    {% assign content_left_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_left_bg_color_data_str = content_left_bg_color_data | json %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_right_bg = page.data.content_right_bg %}
  {% assign content_right_bg_image = page.data.content_right_bg.image %}
  {% assign content_right_bg_image_sizes = page.data.content_right_bg.imageSizes %}
  {% assign content_right_bg_color = page.data.content_right_bg.color %}
  {% assign content_right_bg_color_data = page.data.content_right_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_right_bg %}
    {% if content_right_bg_color_data.a >= 0.2 %}
      {% if content_right_bg_color_data.lightness >= 0.5 %}
        {% assign content_right_bg_type = 'light-background' %}
      {% else %}
        {% assign content_right_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_right_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_right_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_right_bg_image_sizes == nil %}
    {% assign content_right_bg_image_sizes_str = '' %}
  {% else %}
    {% assign content_right_bg_image_sizes_str = content_right_bg_image_sizes | json %}
  {% endif %}

  {% if content_right_bg_color == nil %}
    {% assign content_right_bg_color = 'rgba(255,78,0,1)' %}
  {% endif %}

  {% if content_right_bg_color_data == nil %}
    {% assign content_right_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_right_bg_color_data_str = content_right_bg_color_data | json %}
  {% endif %}

  {% comment %}
  ===================================================================
  || Design editor variables.
  ===============================================================
  {% endcomment %}
  {% capture base_font_set %}
  [
    {
      "type": "group",
      "title": "Sans Serif",
      "list": [
        {
          "title": "Avenir Next",
          "value": "\"Avenir Next\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
        },
        {
          "title": "Fira Sans",
          "value": "\"Fira Sans\", sans-serif"
        },
        {
          "title": "Lato",
          "value": "\"Lato\", sans-serif"
        },
        {
          "title": "Montserrat",
          "value": "\"Montserrat\", Helvetica, Arial, sans-serif"
        },
        {
          "title": "Open Sans",
          "value": "\"Open Sans\", sans-serif"
        },
        {
          "title": "Roboto",
          "value": "\"Roboto\", sans-serif"
        },
        {
          "title": "Source Sans Pro",
          "value": "\"Source Sans Pro\", sans-serif"
        },
        {
          "title": "Ubuntu",
          "value": "\"Ubuntu\", sans-serif"
        }
      ]
    },
    {
      "type": "group",
      "title": "Serif",
      "list": [
        {
          "title": "Arvo",
          "value": "\"Arvo\", sans-serif"
        },
        {
          "title": "Crimson Text",
          "value": "\"Crimson Text\", sans-serif"
        },
        {
          "title": "Lora",
          "value": "\"Lora\", sans-serif"
        },
        {
          "title": "Noto Serif",
          "value": "\"Noto Serif\", sans-serif"
        },
        {
          "title": "Playfair Display",
          "value": "\"Playfair Display\", sans-serif"
        },
        {
          "title": "PT Serif",
          "value": "\"PT Serif\", sans-serif"
        },
        {
          "title": "Roboto Slab",
          "value": "\"Roboto Slab\", sans-serif"
        }
      ]
    },
    {
      "type": "group",
      "title": "Monospace",
      "list": [
        {
          "title": "Anonymous Pro",
          "value": "\"Anonymous Pro\", monospace"
        },
        {
          "title": "Cousine",
          "value": "\"Cousine\", monospace"
        },
        {
          "title": "Roboto Mono",
          "value": "\"Roboto Mono\", monospace"
        },
        {
          "title": "Ubuntu Mono",
          "value": "\"Ubuntu Mono\", monospace"
        }
      ]
    }
  ]
  {% endcapture %}

  {% capture base_alignment_horizontal_set %}
    [
      {
        "title": "Left",
        "value": "left"
      },
      {
        "title": "Center",
        "value": "center"
      },
      {
        "title": "Right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_alignment_vertical_set %}
    [
      {
        "title": "Top",
        "value": "top"
      },
      {
        "title": "Center",
        "value": "center"
      },
      {
        "title": "Bottom",
        "value": "bottom"
      }
    ]
  {% endcapture %}
{% endcapture %}
