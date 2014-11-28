<script src="{{ javascripts_path }}/application.min.js"></script>
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

          // contentHalf background image and color preview logic function.
          var contentHalfBgPreview = function(data, contentHalf) {
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
            $(contentHalf).find('.js-background-type').removeClass('light-background dark-background');
            // Checks the opacity of the contentHalf background color and sets the lightness class depending on it's value.
            if (contentHalfBgColorOpacity >= 0.2) {
              $(contentHalf).find('.js-background-type').addClass(contentHalfBgColorLightness >= 0.5 ? 'light-background' : 'dark-background');
            } else {
              $(contentHalf).find('.js-background-type').addClass('light-background');
            };

            // Updates the contentHalf background image and background color.
            $(contentHalf).css({'background-image' : contentHalfBgImage});
            $(contentHalf).find('.background-color').css({'background-color' : contentHalfBgColor});
          };

          // contentHalf background image and color save logic function.
          var contentHalfBgCommit = function(data, dataName) {
            var commitData = $.extend(true, {}, data);
            commitData.image = data.image || '';
            commitData.imageSizes = data.imageSizes || '';
            commitData.color = data.color || 'transparent';
            pageData.set(dataName, commitData);
          }

          // Front page left content area background picker.
          var contentHalfLeftBg = new Edicy.BgPicker($('.content-left .js-background-settings'), {
              picture: true,
              target_width: 600,
              color: true,
              showAlpha: true,

            preview: function(data) {
              contentHalfBgPreview(data, '.js-content-left');
            },

            commit: function(data) {
              contentHalfBgCommit(data, 'content_left_bg');
            }
          });

          // Front page left content area background picker.
          var contentHalfLeftBg = new Edicy.BgPicker($('.content-right .js-background-settings'), {
              picture: true,
              target_width: 600,
              color: true,
              showAlpha: true,

            preview: function(data) {
              contentHalfBgPreview(data, '.js-content-right');
            },

            commit: function(data) {
              contentHalfBgCommit(data, 'content_right_bg');
            }
          });
        {% endif %}
      });
    })(jQuery);
  </script>
{% endeditorjsblock %}
