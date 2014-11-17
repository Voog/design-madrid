<script src="{{ javascripts_path }}/application.min.js?5"></script>
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
      });
      
    })(jQuery);
  </script>
{% endeditorjsblock %}
