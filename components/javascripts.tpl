<script src="{{ javascripts_path }}/application.min.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/latest/picturefill.min.js"></script>

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>

    $(function() {
      var search = new VoogSearch($('.js-search-form').get(0), {
                      per_page: 3,
                      lang: '{{ page.language_code }}',
                      resultsContainer: null, // if given an element results are rendered inside that element instead of modal (with scroll lazy load support)
                      sideclick: true, // if modal should close on sideclick
                      mobileModeWidth: 480, // mobile checkpoint (adds class "voog-search-mobile-mode" if <=)
                      updateOnKeypress: false, // updates results on every keypress
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
