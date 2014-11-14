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
        
        new Edicy.BgPicker($button.get(0), {
          picture: true,
          target_width: 800,
          color: true,
          showAlpha: true,
        
          // Body background image and color preview logic (runs after changing the background image or color).
          preview: function(data) {
            if (data.image && data.image !== '') {
              $article.find('a').css('background-image', 'url("' + data.image + '")');
            }
            var bg_color = (data.color && data.color !== '') ? data.color : 'transparent';
            $article.find('.article-bg-color').css('background-color', data.color);
          },
          
      
          // Body background image and color save logic (runs after closing the background picker).
          commit: function(data) {
            var commitData = $.extend(true, {}, data);
            commitData.image = commitData.image || '';
            commitData.color = commitData.color || '';
            articleData.set("background", commitData);
          }
        });
      });
    });
  
  })(jQuery);  
</script>
{% endif %}

