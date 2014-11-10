{% if editmode %}
<script>
  ;(function($) {
    $(function() {
  
      var pictureDropArea = new Edicy.ImgDropArea($('.js-post-cover-inner'), {
        positionable: false,
        change: function(data) {
          Edicy.articles.currentArticle.setData({
            'post_image': data
          });
        }
      });
    });
  
  })(jQuery);  
</script>
{% endif %}

