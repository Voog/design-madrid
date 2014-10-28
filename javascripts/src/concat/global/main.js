;(function($) {
  var editmode = $('html').hasClass('editmode');

  // Handles mouse clicks on different buttons and sections of the web page.
  var handleElementsClick = function() {
    // Hides opened popups and modals if clicked on any other element.
    $('html').click(function() {
      if ($('.js-popover').hasClass('expanded')) {
        $('.js-popover').removeClass('expanded');
      }

      if ($('.js-search-close-btn').hasClass('open') && $('.voog-search-modal').length === 0) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover main menu (visible on smalles screens).
    $('.js-menu-btn').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('.js-menu-main').toggleClass('expanded');

      if ($('.js-search-close-btn').hasClass('open')) {
        $('.js-search-close-btn').trigger('click');
      }
    });

    // Toggles the popover language menu.
    $('.js-menu-lang-btn').click(function(event) {
      event.stopPropagation();
      $('.js-menu-lang-popover').toggleClass('expanded');
    });

    // Opens the search modal.
    $('.js-search-open-btn').click(function(event) {
      event.stopPropagation();
      if ($('.js-menu-main').hasClass('expanded')) {
        $('.js-menu-main').removeClass('expanded');
        $('.js-menu-btn').removeClass('open');
      }

      $(this).addClass('open');
      $('body').addClass('search-open');
      $('.js-search-close-btn').addClass('open');
      $('.js-search').addClass('active');
      $('.js-search-inner').css({'margin-top': '-25px'});
      $('.js-search-input').val('').focus();
    });

    // Closes the search modal.
    $('.js-search-close-btn').click(function(event) {
      $(this).removeClass('open');
      $('body').removeClass('search-open');
      $('.js-search-open-btn').removeClass('open');
      $('.js-search').removeClass('active');
    });

    // Prevents search modal closing on click
    $('.js-search').click(function(event) {
      event.stopPropagation();
    });
  };

  // Switches the search input and menu button location in DOM for mobile view.
  var handleSearchPositionChange = function() {
    var windowWidth = $(window).width(),
        search = $('.js-search'),
        menuBtn = $('.js-menu-btn');

    if (windowWidth <= 640) {
      if (search.next().is(menuBtn)) {
        search.before(menuBtn);
      }
    } else {
      if (search.prev().is(menuBtn)) {
        search.after(menuBtn);
      }
    }
  };

  // Closes the soft keyboards on mobile devices on search submit.
  var handleSearchSubmit = function() {
    $('.js-search-submit').on('click', function() {
      $('.js-search-input').parent().blur();
    });
  };

  // Reduces opacity of the gallery images that are not under the cursor.
  var handleGalleryHover = function() {
    $('.edys-gallery').mouseover(function() {
      $(this).find('.edys-gallery-item').addClass('inactive');
    });

    $('.edys-gallery').mouseout(function() {
      $(this).find('.edys-gallery-item').removeClass('inactive');
    });
  };

  // scrolls to the comment-form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    if (!editmode) {
      $.each($('.content-formatted:not(".js-custom-content-formatted") table'), function() {
          $(this).wrap('<div class="table-container overthrow"></div>');
      });
    }
  };

  // Sets the position of the footer to the bottom of the page
  var handleFooterPositioning = function() {
    $(document).ready(function() {
      footerHeight = $('.js-footer').height();
      $('.js-footer-positioner').css({'height' : footerHeight});
    });
  };

  var handleFooterContentEdit = function() {
    $('.js-footer').find('.text_partial').keydown(function() {
      handleFooterPositioning();
    });
  };

  // Checks the presence of the table scrollbar.
  var checkScrollBar = function() {
    jQuery.fn.hasScrollBar = function(direction) {
      if (direction == 'vertical') {
        return this.get(0).scrollHeight > this.innerHeight();
      } else if (direction == 'horizontal') {
        return this.get(0).scrollWidth > this.innerWidth();
      }
      return false;
    }
  };

  // Adds horizontal scroll to tables that don't fit into the content area
  var handleTableHorizontalScrolling = function() {
    $.each($('.table-container'), function() {
      if ($(this).hasScrollBar('horizontal') === true) {
        $(this).addClass('horizontal-scroll');
      } else {
        $(this).removeClass('horizontal-scroll');
      }
    });
  };

  // Initiates the table horisontal scroll function when window is resized
  var handleWindowResize = function() {
    $(window).resize(function() {
      handleTableHorizontalScrolling();
      handleFooterPositioning();
      handleSearchPositionChange();
    });
  };

  // Initiations
  var initBlogPage = function() {
    // ADD BLOG LISTING layout specific FUNCTIONS HERE
  };

  var initArticlePage = function() {
    // ADD SINGLE POST layout specific FUNCTIONS HERE
  };

  var initCommonPage = function() {
    // ADD COMMON PAGE SPECIFIC FUNCTIONS HER
  };

  var initFrontPage = function() {
    // ADD COMMON PAGE SPECIFIC FUNCTIONS HER
  };

  var init = function() {
    // ADD SITE WIDE FUNCTIONS HERE
    handleElementsClick();
    handleFooterContentEdit();
    handleSearchPositionChange();
    handleSearchSubmit();
    handleGalleryHover();
    focusFormWithErrors();
    handleWindowResize();
    wrapTables();

    if ($('.table-container').length > 0) {
      checkScrollBar();
      handleTableHorizontalScrolling();
    }

    $(document).ready(function() {
      handleFooterPositioning();
    });
  };

  // Enables the usage of the initiations outside this file
  window.site = $.extend(window.site || {}, {
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    initCommonPage: initCommonPage,
    initFrontPage: initFrontPage
  });

  init();
})(jQuery);
