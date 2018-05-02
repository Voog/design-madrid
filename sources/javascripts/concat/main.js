;(function($) {
  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-search-results').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 500,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var bgPickerImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var bgPickerContentLightnessClass = function(bgPickerArea) {
    if (bgPickerCombinedLightness >= 0.5) {
      $(bgPickerArea).find('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).css('background-image'),
        bgPickerImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + bgPickerImageSuitable.url + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious)) {
        bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea);
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.bgPickerImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPickerCombinedLightness = getCombinedLightness(bgPicker.bgPickerImageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea);
          });
        });
      };
    } else {
      bgPickerCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea);
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').css({'background-color' : bgPickerColor});
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataKey, data) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = bgPickerCombinedLightness;
    pageData.set(dataKey, commitData);
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  var articleBgPreview = function(data, article) {
      var $link = article.find('.link');

      if (data.image && data.image !== '') {
          $link.css('background-image', 'url("' + data.image + '")');
      }
      else {
          $link.css('background-image', 'none');
      }
      var bg_color = (data.color && data.color !== '') ? data.color : 'transparent';
      article.find('.article-bg-color').css('background-color', bg_color);
  };

  var articleBgCommit = function(data, articleData, key) {
      var commitData = $.extend(true, {}, data);
      commitData.image = commitData.image || '';
      commitData.color = commitData.color || '';
      articleData.set(key, commitData);
  };

  window.site = $.extend(window.site || {}, {
      articleBgPreview: articleBgPreview,
      articleBgCommit: articleBgCommit,
      bgPickerPreview: bgPickerPreview,
      bgPickerCommit: bgPickerCommit,
      bgPickerColorScheme: bgPickerColorScheme,
      bindSiteSearch: bindSiteSearch
  });

  var debounce = function( func, wait, immediate ) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if ( !immediate ) func.apply( context, args );
      };
      var callNow = immediate && !timeout;
      clearTimeout( timeout );
      timeout = setTimeout( later, wait );
      if ( callNow ) func.apply( context, args );
    };
  };

  $(function() {

    (new Headroom($('.header').get(0), {
      offset : 200,
      tolerance : 0
    })).init();


    $('.js-popup-menu').jsPopupMenu();

    $('.js-main-menu-toggler').click(function(e) {
      if (e) { e.preventDefault(); }

      $('body').addClass('main-menu-open');

      setTimeout(function() {
        $(document).on('click.js-main-menu-toggler-click', function(event) {
          var c = $('.header .main-menu').get(0);
          if (!$.contains(c, event.target) && event.target !== c) {
            $('body').removeClass('mobile-main-menu-open main-menu-open');
            $(this).off('.js-main-menu-toggler-click');
          }
        });
      },0);
    });

    $('.js-mobile-main-menu-toggler').click(function(event) {
      event.preventDefault();
      $('body').addClass('mobile-main-menu-open');
    });

    $('.js-mobile-main-menu-close').click(function(event) {
      event.preventDefault();
      $('body').removeClass('mobile-main-menu-open');
    });

    $('.js-mobile-lang-menu-btn').click(function(event) {
      event.preventDefault();
      $('body').removeClass('mobile-main-menu-open').addClass('mobile-lang-menu-open');
    });

    $('.js-mobile-lang-menu-close').click(function(event) {
      event.preventDefault();
      $('body').removeClass('mobile-lang-menu-open').addClass('mobile-main-menu-open');
    });

    $('.js-search-toggler').click(function(e) {
      e.preventDefault();

      if (!$('body').hasClass('search-visible')) {
        $('body').addClass('search-visible');

        var $c = $('.header .search-holder');

        $c.find('.search-input').get(0).focus();

        setTimeout(function() {
          $(document).on('click.js-search-toggler-click', function(event) {
            var c = $c.get(0);
            if (!$.contains(c, event.target) && event.target !== c) {
              $('body').removeClass('search-visible');
              $(this).off('.js-search-toggler-click');
              checkMainmenuFitting();
            }
          });
        },0);
      }
      else {
        $('body').removeClass('search-visible');
        $(document).off('.js-search-toggler-click');
      }

      checkMainmenuFitting();
    });

    $('.js-search-input')
    .focus(function() {
      $(this).addClass('search-input-focus');
    })
    .blur(function() {
      $(this).removeClass('search-input-focus');
    });

    $('.js-search-reset').click(function(e) {
      e.preventDefault();
      $('.js-search-form').removeClass('not-empty').find('.search-input').val('');
      var $c = $('.header .search-holder');
      $c.find('.search-input').get(0).focus();
    });

    $('.js-search-results').click(function(event) {
      event.preventDefault();
    });

    $('.js-comment-form-toggler').click(function(event) {
      event.preventDefault();
      $(this).hide();
      $('.comment-form-inner').show();
      $(".js-autogrow").autoGrow();
    });

    $(".js-autogrow").autoGrow();

    if ($('html').hasClass('no-placeholder')) {
      $('input[type="text"],textarea').each(function() {
        if ($(this).attr('placeholder') && !$(this).val()) {
          $(this).val($(this).attr('placeholder'));
        }
        $(this).focus(function() {
          if ($(this).val() == $(this).attr('placeholder')) {
            $(this).val('');
          }
        }).blur(function() {
          if (!$(this).val() && $(this).attr('placeholder')) {
            $(this).val($(this).attr('placeholder'));
          }
        });
      });
    }

    $('.form_fields:not(.edy-fe-fields) select, .custom-select').jqSelect();

    var $form_error = $('.form_field_with_errors');
    if ($form_error.length) {
      $('.js-comment-form-toggler').hide();
      $('.comment-form-inner').show();
      $(".js-autogrow").autoGrow();
      $(window).scrollTop($form_error.eq(0).offset().top);
    }


    $('html:not(.editmode) table').each(function() {
      $(this).wrap('<div class="table-holder" />');
    });


    if ($('.blog-list-page .main').length > 0) {
      $('.article .link').click(function() {
        window.location = $(this).attr('data-href');
      });
    }

    $('.voog-bg-picker-btn').click(function(e) { e.stopPropagation(); });

    initMobileSwipe();
    initScrollOverride();

    checkMainmenuFitting();
    setLayout();

    document.addEventListener('voog:checkoutbutton:show', function() {
      setLayout(true);
    }, false);

    document.addEventListener('voog:checkoutbutton:hide', function() {
      setLayout();
    }, false);

    $(window).on('resize', function() {
      debounce(checkMainmenuFitting(), 50);
      debounce(setLayout(), 50);
    });

    $('body', '.site-title-inner, .footer').contentMutations({
      debounceTime: 50,
      callback: function() {
        checkMainmenuFitting();
        setLayout();
      }
    });

    if ($('.scroller-arrow').length) {
      setScrollerArrow();
      $('.main').on('scroll', debounce(setScrollerArrow, 100));
    }

  });

var setScrollerArrow = function() {
  var $arrow = $('.scroller-arrow'),
  $main = $('.main'),
  main = $main.get(0);

  if ($arrow.length && main.scrollWidth && (main.scrollLeft || main.scrollLeft === 0)) {
    if (main.scrollWidth > main.scrollLeft + $main.width()) {
      $arrow.show().css('display', 'block');
    }
    else {
      setTimeout(function() { $arrow.fadeOut('slow'); }, 1500);
    }
  }
};

var initMobileSwipe = function() {
  if ($('html').hasClass('touch') && $('.blog-list-page .main').length > 0 && $(window).width() <= 500) {

    var swipeindex = 0,
    max = $('.main-inner').children().length;

    if (max <= 10 ) {
      var html = '<div class="slider-counter">';
      for (var i = 0; i<max; i++) {
        html += '<div class="slider-dot"></div>';
      }
      html += '</div>';


      $('.main').prepend(html);
    }
    $('.main').scrollLeft(0);

    $('.slider-counter .slider-dot').removeClass('slider-dot-active').eq(swipeindex).addClass('slider-dot-active');

    $('.article .link, .new-article').swipe( {
                //Default is 75px, set to 0 for demo so any distance triggers swipe
                swipeLeft: function() {
                  $('.main').animate({ scrollLeft: "+=" + $(window).width() + "px" }, 200, 'swing', function() {
                    swipeindex ++;
                    if (swipeindex > max-1) { swipeindex = max - 1; }
                    $('.slider-counter .slider-dot').removeClass('slider-dot-active').eq(swipeindex).addClass('slider-dot-active');
                  });
                },
                swipeRight: function() {
                  $('.main').animate({ scrollLeft: "-=" + $(window).width() + "px" }, 200, 'swing', function() {
                    swipeindex--;
                    if (swipeindex < 0) { swipeindex = 0; }
                    $('.slider-counter .slider-dot').removeClass('slider-dot-active').eq(swipeindex).addClass('slider-dot-active');
                  });

                },
                threshold: 30
              });

    $('.scroller-arrow').click(function(e) {
      e.preventDefault();
      var $main = $('.main'),
      w = $(window).width();

      $main.animate({ scrollLeft: "+=" + w + "px" }, 200, 'swing', function() {
        swipeindex ++;
        if (swipeindex > max-1) { swipeindex = max - 1; }
        $('.slider-counter .slider-dot').removeClass('slider-dot-active').eq(swipeindex).addClass('slider-dot-active');
      });
    });
  }
  else {
    $('.scroller-arrow').click(function(e) {
      e.preventDefault();
      var $main = $('.main'),
      w = $main.width();

      $main.animate({ scrollLeft: "+=" + w + "px" });
    });
  }
};

var editmode = function () {
  return $('html').hasClass('editmode');
};

var bindCustomTexteditorStyles = function(buttonTranslation) {
  window.edy = window.edy || [];
  edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
};

// Enables the usage of the initiations outside this file
window.template = $.extend(window.template || {}, {
  bindCustomTexteditorStyles: bindCustomTexteditorStyles
});

var setLayout = function(withShoppingCart) {
    var $m = $('.main-inner'),
    $bm = $('.height-calculation .main-inner'),
    $h = $('.header'),
    mh;

  if (withShoppingCart == true || $('body').hasClass('edy-checkout-button-visible')) {
    mh = $(window).height() - $h.height() - ($('.footer').is(':hidden') ? 0 : $('.footer').innerHeight()) - ($('html').hasClass('editmode') ? 40 : 0) - 41;  // 41 is the height of the checkout button.
  } else {
    mh = $(window).height() - $h.height() - ($('.footer').is(':hidden') ? 0 : $('.footer').innerHeight()) - ($('html').hasClass('editmode') ? 40 : 0);
  }

  $m.css({'padding-top': $h.height(), 'min-height': mh});
  $bm.css('padding-bottom', ($('.footer').is(':hidden') ? 0 : $('.footer').innerHeight() + ($('html').hasClass('editmode') ? 40 : 0))).height(mh);
  $('.header').css('position', ($('.header').height()>150 ? 'absolute' : 'fixed'));

  if (withShoppingCart == true || $('body').hasClass('edy-checkout-button-visible')) {
    $('.scroller-arrow').css('top', $('.header').height() + 41); // 41 is the height of the checkout button.
  } else {
    $('.scroller-arrow').css('top', $('.header').height());
  }

  if ($(window).width() > 500) {
    $('.content-half').css('min-height', 0);
    $('.content-half .inner').css('height', 'auto');
  } else {
    var contentHalfHeight = ($(window).height() - $h.height() - $('.footer').innerHeight() - ($('html').hasClass('editmode') ? 40 : 0)) / 2;
    $('.content-half').css('min-height', contentHalfHeight);
    $('.content-half .inner').css('height', contentHalfHeight);
  }
};

var checkMainmenuFitting = function() {
  var $site_title_inner = $('.site-title-inner'),
  $body = $('body'),
  $mainMenuToggler = $('.js-main-menu-toggler'),
  ww = $(window).width(),
  mw = $('.main-menu').width(),
  tw = $site_title_inner.width() + $site_title_inner.offset().left;

  if (ww > mw + tw) {
    $body.removeClass('main-menu-not-fitting');
    $mainMenuToggler.removeClass('menu-not-visible');
  }
  else {
    $body.addClass('main-menu-not-fitting');
    $mainMenuToggler.addClass('menu-not-visible');
  }
};


var scrollTimeout = null,
isMobile = ((document.body.clientWidth || window.innerWidth) <= 600);
isScrolling = false,
oldie = window.oldie || false;


// Stream
var initScrollOverride = function() {
  if ($('html').hasClass('no-touchevents') && $('.blog-list-page .main').length > 0 && $.fn.mousewheel) {

    if (oldie) {
      $('.blog-list-page .main').mousewheel(handleMouseWheel);
    }
    else {
      $('.blog-list-page .main').mousewheel(handleMouseWheel);
    }


    $('.blog-list-page .main').on("scroll", function(event) {
      event.preventDefault();
    });
  }
};

var handleMouseWheel = function(event, delta, x, y) {
  event.preventDefault();

  var dir, dx;
  isScrolling = true;


  if (typeof x != "undefined" && typeof y  != "undefined" && !isNaN(x) && !isNaN(y)) {
            var nx = x *-1, // reverse axis
            d = nx+y;

            dir = (d >> 31) + (d > 0 ? 1 : 0); // fast sign operation

            if (navigator.appVersion && navigator.appVersion.indexOf("Mac") > -1) {
              dx = Math.round(Math.sqrt(x*x + y*y) * dir * 1.3);
            }
            else {
              dx = Math.abs(delta) * dir;
            }
          }
          else {
            dir = (delta >> 31) + (delta > 0 ? 1 : 0); // fast sign operation
            dx = Math.abs(delta) * dir;
          }
          if (navigator.appVersion && navigator.appVersion.indexOf("Mac") == -1) {
            dx = dx * 30;
          } else {
            if (Math.abs(dx) > 100) {
              dx = dx / (Math.log(Math.abs(dx)/3)) ;
            }
          }

          $('.blog-list-page .main').scrollLeft($('.blog-list-page .main').scrollLeft() - (dx * 3));
          $('.blog-list-page .main').addClass("is-scrolling");

          if (scrollTimeout) {
            clearTimeout(scrollTimeout);
          }
          scrollTimeout = setTimeout(function() {
            isScrolling = false;

            $('.blog-list-page .main').removeClass("is-scrolling");
          }, 200);
        };

      })(jQuery);


      (function($) {
        $.fn.extend({
          jsPopupMenu: function(options) {
            this.each(function() {
              var $menu = $(this),
              $btn = $menu.find('.js-popup-menu-btn'),
              $pop = $menu.find('.js-popup-menu-popover');

              $pop.hide();
              $btn.on('click', function(event) {
                event.preventDefault();
                if ($pop.is(':hidden')) {
                  $pop.show();
                  $btn.addClass('open');

                  setTimeout(function() {
                    $(document).on('click.js-popup-menu-click', function() {
                      $pop.hide();
                      $btn.removeClass('open');
                      $(this).off('.js-popup-menu-click');
                    });
                  },0);

                }
              });
            });
            return this;
          }
        });

      })(jQuery);

      (function($) {
        $.jquerySelect = function() {

          return {
            init: function($elem, settings) {
              $elem.wrap('<div class="jq-select" />');

              var $holder = $elem.parent(),
              $arrow = $('<div class="jq-select-arrow"></div>'),
              $content = $('<div class="jq-select-content" />'),
              $inner = $('<div class="jq-select-inner" />').text($elem.children(':selected').text());

              $content.append($inner);
              $holder.append($content);
              $holder.append($arrow);

              if ($elem.hasClass('form_field_size_large')) {
                $elem.removeClass('form_field_size_large');
                $holder.addClass('form_field_size_large');
              }

              else if ($elem.hasClass('form_field_size_medium')) {
                $elem.removeClass('form_field_size_medium');
                $holder.addClass('form_field_size_medium');
              }

              else if ($elem.hasClass('form_field_size_small')) {
                $elem.removeClass('form_field_size_small');
                $holder.addClass('form_field_size_small');
              }
              else {
                $holder.addClass('form_field_size_small');
              }

              $elem.change($.proxy(function() {
                $inner.text($elem.children(':selected').text());
              }, this));

              $elem.keyup($.proxy(function() {
                $inner.text($elem.children(':selected').text());
              }, this));

              $elem.bind('update', $.proxy(function() {
                $inner.text($elem.children(':selected').text());
              }, this));
            }
          };
        }();

        $.fn.extend({
          jqSelect: function(options) {
            this.each(function() {
              var settings = $.extend({}, options);
              $.jquerySelect.init($(this), settings);
            });
            return this;
          }
        });

      })(jQuery);


      ;(function ( $ ) {

        var pluginName = 'lazyLoad',
        defaults = {
          className: '--lazy',
          urlData: 'image',
            windowResize : true, // trigger on window resize
            loadOnInit: true, // trigger on init
            debounceTime: 100, // debounce time
            distance: 100, // load distance in pixels,
            stopIfAll: true // no more loading if all loaded, set false if adding items with ajax
          };

          function Plugin( element, options ) {

            this.element    = element;
            this.$element   = $(element);

            this.options    = $.extend( {}, defaults, options );
            this._defaults  = defaults;
            this._name      = pluginName;

            this.init();
          }


          var debounce = function( func, wait, immediate ) {
            var timeout;
            return function() {
              var context = this, args = arguments;
              var later = function() {
                timeout = null;
                if ( !immediate ) func.apply( context, args );
              };
              var callNow = immediate && !timeout;
              clearTimeout( timeout );
              timeout = setTimeout( later, wait );
              if ( callNow ) func.apply( context, args );
            };
          };


          Plugin.prototype.load = function () {

            var $parent = this.element === window ? $('body') : this.$element;

            var $objs = $parent.find( '.' + this.options.className ).filter(function( i, el ) {
              return !$(el).data( 'lazyLoaded' );
            }).each($.proxy(function( i, obj ) {

              var $obj = $(obj),
              left = $obj.offset().left,
              top = $obj.offset().top;


              var $parents = $obj.parentsUntil( 'body' ).each(function( i, e ) {
                left = left + e.scrollLeft;
                top = top + e.scrollTop;
              });

              var offset = {
                top: top,
                left: left
              };

              if ($( window ).scrollTop() + $( window ).height() + ( this.element !== window ? this.$element.scrollTop() : 0 ) + this.options.distance > offset.top &&
                $( window ).scrollLeft() + $( window ).width() + ( this.element !== window ? this.$element.scrollLeft() : 0 ) + this.options.distance > offset.left) {

                $obj.data( 'lazyLoaded', true );

              var urlData = $obj.data( this.options.urlData );

              if (urlData) {

                if ( $obj.get(0).tagName.toLowerCase() == 'img' ) {
                  $obj.attr( 'src', urlData );
                }
                else {
                  $obj.css( 'background-image', 'url("' + urlData + '")' );
                }
              }
            }
          }, this));

if ( !$objs.length && this.options.stopIfAll ) {
  this.destroy();
}

};


Plugin.prototype.init = function () {

  this.page = this.options.page;

  if ( this.options.loadOnInit ) {
    this.load();
  }

  this.$element.on( 'scroll.' + this._name, debounce( this.load.bind(this), this.options.debounceTime ));

  if ( this.element !== window ) {
    $( window ).on( 'scroll.' + this._name, debounce( this.load.bind(this), this.options.debounceTime ));
  }

  if ( this.options.windowResize ) {
    $( window ).on( 'resize.' + this._name, debounce( this.load.bind(this), this.options.debounceTime ));
  }
};


Plugin.prototype.destroy = function () {
  $.data( this.element, this._name, null );
  this.$element.off( '.' + this._name );
};

$.fn[ pluginName ] = function ( arg ) {

  var args = arguments;

  return this.each(function () {
    var d = $.data( this, pluginName );

    if ( !d && ( typeof arg === 'object' || typeof arg === 'undefined' )) {
      $.data( this, pluginName,
        new Plugin( this, arg ));
    }
    else if ( d && typeof arg === 'string' && typeof d[arg] === 'function' ) {
      d[ arg ].apply( d, Array.prototype.slice.call( args, 1 ));
    }

    return this;
  });
};

})( jQuery );


;(function ( $ ) {

  var pluginName = 'contentMutations',
  defaults = {
    attributes: false,
    childList: true,
    subtree: true,
    characterData: true,
    fallbackTimer: 1000,
    debounceTime: 50
  };

  function Plugin( element, options ) {

    this.element    = element;
    this.$element   = $(element);

    this.options    = $.extend( {}, defaults, options );
    this._defaults  = defaults;
    this._name      = pluginName;

    this.init();
  }


  var debounce = function( func, wait, immediate ) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if ( !immediate ) func.apply( context, args );
      };
      var callNow = immediate && !timeout;
      clearTimeout( timeout );
      timeout = setTimeout( later, wait );
      if ( callNow ) func.apply( context, args );
    };
  };


  Plugin.prototype.init = function () {

    this.MutationObserver = (function () {
      var prefixes = [ 'WebKit', 'Moz', 'O', 'Ms', '' ];

      for( var i=0; i < prefixes.length; i++ ) {
        if( prefixes[i] + 'MutationObserver' in window ) {
          return window[ prefixes[i] + 'MutationObserver' ];
        }
      }
      return false;
    }());


    if(this.MutationObserver) {
      this.observer = new this.MutationObserver($.proxy(function( mutations ) {
        mutations.forEach( debounce($.proxy(function( mutation ) {
          if ( typeof this.options.callback === 'function' ) {
            this.options.callback.call();
          }
        }, this )), this.options.debounceTime );
      }, this ));

      this.observer.observe( this.element, this.options );
    }
    else {
      setInterval( $.proxy(function() {
        if ( typeof this.options.callback === 'function' ) {
          this.options.callback.call();
        }
      }, this), this.options.fallbackTimer );
    }
  };


  Plugin.prototype.destroy = function () {
    this.observer.disconnect();
  };

  $.fn[ pluginName ] = function ( arg ) {

    var args = arguments;

    return this.each(function () {
      var d = $.data( this, pluginName );

      if ( !d && ( typeof arg === 'object' || typeof arg === 'undefined' )) {
        $.data( this, pluginName,
          new Plugin( this, arg ));
      }
      else if ( d && typeof arg === 'string' && typeof d[arg] === 'function' ) {
        d[ arg ].apply( d, Array.prototype.slice.call( args, 1 ));
      }

      return this;
    });
  };

})( jQuery );
