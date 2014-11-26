<script src="{{ javascripts_path }}/application.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/latest/picturefill.min.js"></script>

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>
    $(function() {
      var search = new VoogSearch($('.js-search-form').get(0), {
        per_page: 3,
        lang: '{{ page.language_code }}',
        resultsContainer: null,
        sideclick: true,
        mobileModeWidth: 480,
        updateOnKeypress: false,
        resultsContainer: $('.search-results').get(0)
      });
    });
  </script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}

{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    ;(function($) {

      $(function() {
        var siteData = new Edicy.CustomData({
          type: 'site'
        });

        $('.js-option-toggle-flags').on('click', function(event) {
          event.preventDefault();

          var flagsState = !$(this).hasClass('js-flags-enabled');
          siteData.set("flags_state", flagsState);

          $('.js-option-toggle-flags').toggleClass('js-flags-enabled');
          $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');
        });

        {% if javascripts == "front_page" %}
          var pageData = new Edicy.CustomData({
            type: 'page',
            id: '{{ page.id }}'
          });

          // contentHalf BACKGROUND PICKER LOGIC.
          var contentHalfLeftBg = new Edicy.BgPicker($('.content-half .js-background-settings'), {
              picture: true,
              target_width: 600,
              color: true,
              showAlpha: true,

            // contentHalf background image and color preview logic (runs after changing the background image or color).
            preview: function(data) {
              // Returns the suitable version of the image depending on the viewport width.
              var getImageByWidth = function(sizes, targetWidth) {
                var prevImage;

                for (var i = sizes.length; i--;) {
                  if (sizes[i].width > targetWidth) {
                    return prevImage || sizes[i];
                  }
                }
                // Makes sure that smallest is returned if all images bigger than targetWidth.
                return sizes[sizes.length - 1]
              };

              // Defines the suitable image based on the viewport width.
              var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

              var contentHalfBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
                  contentHalfBgColor = (data.color && data.color !== '') ? data.color : 'transparent',
                  contentHalfBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
                  contentHalfBgColorLightness = (data.colorData && data.colorData !== '' && data.colorData.lightness) ? data.colorData.lightness : 'none';

              // Removes the current lightness class.
              $('.js-content-left.js-background-type').removeClass('light-background dark-background');
              // Checks the opacity of the contentHalf background color and sets the lightness class depending on it's value.
              if (contentHalfBgColorOpacity >= 0.2) {
                $('.js-content-left.js-background-type').addClass(contentHalfBgColorLightness >= 0.5 ? 'light-background' : 'dark-background');
              } else {
                $('.js-content-left.js-background-type').addClass('light-background');
              };

              // Updates the contentHalf background image and background color.
              $('.js-content-left').css({'background-image' : contentHalfBgImage});
              $('.js-content-left .background-color').css({'background-color' : contentHalfBgColor});
            },

            // contentHalf background image and color save logic (runs after closing the background picker).
            commit: function(data) {
              var commitData = $.extend(true, {}, data);
              commitData.image = data.image || '';
              commitData.imageSizes = data.imageSizes || '';
              commitData.color = data.color || 'transparent';
              pageData.set("content_left_bg", commitData);
            }
          });
        {% endif %}
      });
    })(jQuery);
  </script>
{% endeditorjsblock %}
