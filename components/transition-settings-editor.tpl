{% if editmode %}
<div class="transition-settings">
  <button></button>
</div>
{% endif %}

{% editorjsblock %}
  <!-- Settings popover javascript. -->
  <script
    src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"
  ></script>

  <!-- Setings popover initiation. -->
  <script>
    var pageData = new Edicy.CustomData({
      type: "page",
      id: {{ page.id }}
    });

    {% if page.data.transition_settings %}
      var valuesObj = {{ page.data.transition_settings | json }};
    {% else %}
      var valuesObj = {};
    {% endif %};

    var productDescrptionBtn = document.querySelector('.transition-settings');

    var SettingsEditor = new Edicy.SettingsEditor(productDescrptionBtn, {
      menuItems: [
        {
          "title": "Transition settings",
          "type": "select",
          "key": "page_transition",
          "list": [
            {
              "title": "No transiton",
              "value": ""
            },
            {
              "title": "Transiton from right",
              "value": "anim-trans"
            },
            {
              "title": "Transiton from left",
              "value": "fadeinleft"
            },
            {
              "title": "Transiton from top",
              "value": "fadedown"
            },
            {
              "title": "Transiton from bottom",
              "value": "fadeup"
            },
            {
              "title": "TV on transition",
              "value": "animate_content"
            },
            {
              "title": "50/50 right",
              "value": "fadeinfiftyright"
            },
            {
              "title": "50/50 left",
              "value": "fadeinfiftyleft"
            },
          ],

        },
      ],

      // Binded data object which should contain custom data object.
      values: valuesObj,

      // Style type the button.
      buttonStyle: 'default',
      // Title for the button.
      buttonTitle: 'Transition',
      // Class for the button while Settings Editor is visible.
      buttonActiveClass: 'settings-popover-open',

      commit: function(data) {
        pageData.set('transition_settings', data);
      }
    });
  </script>
{% endeditorjsblock %}