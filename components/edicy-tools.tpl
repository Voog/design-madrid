{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Front page header image and color data preview and save logic.
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerHeader = new Edicy.BgPicker($('.js-bgpicker-header-settings'), {
      picture: true,
      color: true,
      showAlpha: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url(' + data.image + ')' : 'none',
            oldImg = $('.js-bgpicker-header-image').css('background-image'),
            col = (data.color && data.color !== '') ? data.color : 'transparent',
            opacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
            colorData = (data.colorData && data.colorData !== '') ? data.colorData : 'none',
            lightness = colorData && colorData !== '' && colorData.lightness ? colorData.lightness : 0;

        // removes the current lightness class.
        $('.js-header-bottom').removeClass('light-background dark-background');
        // Checks the opacity of the header background color and sets the lightness class depending on it's value.
        if (opacity >= 0.16) {
          $('.js-header-bottom').addClass(lightness >= 0.2 ? 'light-background' : 'dark-background');
        } else {
          $('.js-header-bottom').addClass('light-background');
        }

        // Updades the header image only if it has been changed.
        if (oldImg !== img) {
          $('.js-bgpicker-header-image').css({'background-image' : img});
        }

        // Updates the header background color.
        $('.js-bgpicker-header-color').css({'background-color' : col});

      },

      commit: function(data) {
        pageData.set({
          'header_image': data.image || '',
          'header_color': data.color || '',
          'header_colorData' : data.colorData || '',
          'header_lightness' : data.colorData && data.colorData != '' && data.colorData.lightness ? data.colorData.lightness : 0
        });
      }
    });
  </script>
{% endeditorjsblock %}
