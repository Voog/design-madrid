{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    $('.js-option-toggle-flags').on('click', function(event) {
      event.preventDefault();

      var flagsState = !$(this).hasClass('js-flags-enabled');
      siteData.set("flags_state", flagsState);

      $('.js-option-toggle-flags').toggleClass('js-flags-enabled');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');
    });

    {% if edicy-tools == "blog_list_page" %}
      $('.article').each(function(i, article) {
        var $article = $(article),
            articleData = new Edicy.CustomData({
              type: 'article',
              id: $article.data('articleId')
            }),
            $button = $article.find('.js-bg-picker-settings');

        var articleBgPicker = new Edicy.BgPicker($button.get(0), {
          picture: true,
          target_width: 1280,
          color: true,
          showAlpha: true,

          // Body background image and color preview logic (runs after changing the background image or color).
          preview: function(data) {
            site.articleBgPreview(data, $article);
          },

          // Body background image and color save logic (runs after closing the background picker).
          commit: function(data) {
            site.articleBgCommit(data, articleData, 'background');
          }
        });
      });
    {% elsif edicy-tools == "front_page" %}

    {% endif %}

    var oddEvenIndex = 1;
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var dataKey = (index % 2 === 0 ? 'content_left_bg' : 'content_right_bg') + (index > 1 ? '_' + oddEvenIndex : ''),
          oddEvenIndex = (index % 2 !== 0 ? oddEvenIndex + 1 : oddEvenIndex);

      var bgPicker = new Edicy.BgPicker($(bgPickerArea).find('.js-background-settings'), {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker);
        },

        commit: function(data) {
          site.bgPickerCommit(dataKey, data);
        }
      });
    });

    template.bindCustomTexteditorStyles('{{ "button" | lc: editor_locale }}');
  </script>
{% endeditorjsblock %}
