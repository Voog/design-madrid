{% capture dont_render %}
  {% if site.visible_menuitems == blank and site.root_item.hidden? %}
    {% assign show_menu_btn = false %}
  {% else %}
    {% assign show_menu_btn = true %}
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
          "value": "\"Arvo\", serif"
        },
        {
          "title": "Crimson Text",
          "value": "\"Crimson Text\", serif"
        },
        {
          "title": "Lora",
          "value": "\"Lora\", serif"
        },
        {
          "title": "Noto Serif",
          "value": "\"Noto Serif\", serif"
        },
        {
          "title": "Playfair Display",
          "value": "\"Playfair Display\", serif"
        },
        {
          "title": "PT Serif",
          "value": "\"PT Serif\", serif"
        },
        {
          "title": "Roboto Slab",
          "value": "\"Roboto Slab\", serif"
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
        "titleI18n": "left",
        "value": "left"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_alignment_vertical_set %}
    [
      {
        "titleI18n": "top",
        "value": "top"
      },
      {
        "titleI18n": "middle",
        "value": "middle"
      },
      {
        "titleI18n": "bottom",
        "value": "bottom"
      }
    ]
  {% endcapture %}

  {% capture base_border_style_set %}
    [
      {
        "titleI18n": "solid",
        "value": "solid"
      },
      {
        "titleI18n": "none",
        "value": "hidden"
      }
    ]
  {% endcapture %}

{% endcapture %}
