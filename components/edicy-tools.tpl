{% if editmode %}
  <script>
    ;(function($) {
      $(function() {
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
      });
    })(jQuery);
  </script>
{% endif %}
