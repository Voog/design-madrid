;(function($) {

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
      $('.article .link, .new-article').click(function() {
        window.location = $(this).attr('data-href');
      });
    }

    $('.voog-bg-picker-btn').click(function(e) { e.stopPropagation(); });

    initMobileSwipe();
    initScrollOverride();

    checkMainmenuFitting();
    setLayout();

    $(window).on('resize', function() {
      debounce(checkMainmenuFitting(), 50);
      debounce(setLayout(), 50);
    });

    $('.site-title-inner, .footer').contentMutations({
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

var setLayout = function() {
    var $m = $('.main-inner'),
    $bm = $('.height-calculation .main-inner'),
    $h = $('.header'),
    mh = $(window).height() - $h.height() - ($('.footer').is(':hidden') ? 0 : $('.footer').height());

    $m.css({'padding-top': $h.height(), 'min-height': mh});
    $bm.css('padding-bottom', ($('.footer').is(':hidden') ? 0 : $('.footer').height() + ($('html').hasClass('editmode') ? 40 : 0))).height(mh - ($('html').hasClass('editmode') ? 40 : 0));
    $('.header').css('position', ($('.header').height()>150 ? 'absolute' : 'fixed'));
    $('.scroller-arrow').css('top', $('.header').height());

  if ($(window).width() > 500) {
    console.log('doit');
    $('.content-half').css('min-height', 0);
  } else {
    console.log('dontdoit');
    var contentHalfHeight = ($(window).height() - $h.height() - $('.footer').height() - ($('html').hasClass('editmode') ? 40 : 0)) / 2;
    $('.content-half').css('min-height', contentHalfHeight);
    console.log(contentHalfHeight);
  }
};

var checkMainmenuFitting = function() {
  var $site_title_inner = $('.site-title-inner'),
  $body = $('body'),
  ww = $(window).width(),
  mw = $('.main-menu').width(),
  tw = $site_title_inner.width() + $site_title_inner.offset().left;

  if (ww > mw + tw) {
    $body.addClass('main-menu-fits');
  }
  else {
    $body.removeClass('main-menu-fits');
  }
};


var scrollTimeout = null,
isMobile = ((document.body.clientWidth || window.innerWidth) <= 600);
isScrolling = false,
oldie = window.oldie || false;


// Stream
var initScrollOverride = function() {
  if ($('html').hasClass('no-touch') && $('.blog-list-page .main').length > 0 && $.fn.mousewheel) {

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
