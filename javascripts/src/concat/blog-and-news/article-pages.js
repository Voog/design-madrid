(function($) {
  var defaults = {
    template: "#article-template",
    perPage: 3,
    dateFormat: function(date) {
      return moment(date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate(), 'YYYY-MM-DD').locale(langCode).format('LL');
    },
    dateAttrFormat: function(date) {
      return date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    },
    older: "older &gt;",
    newer: "&lt; newer"
  };

  var template = function(html, replacements) {
    var ret = html;
    $.each(replacements, function(key, repl) {
      ret = ret.replace(new RegExp("\\[\\[" + key + "\\]\\]", "g"), repl);
    });
    return ret;
  };

  var ArticlePages = function($el, options) {
    this.$el = $el;
    this.currentPage = 1;
    this.options = $.extend(defaults, options);
  };

  ArticlePages.prototype = {
    init: function() {
      this.showPage(this.currentPage);
    },

    fetch: function(page, f) {
      this.$el.trigger('articles.loading');
      var tag_txt = (this.options.tags) ? 'tag[]=' + this.options.tags.join('&tag[]=') +'&' : '',
      page_id_txt = (this.options.page_id) ? 'page_id=' + this.options.page_id : '',
      url = '/admin/api/articles.json?' + tag_txt + 'page='+ page + '&per_page=' + this.options.perPage + '&' + page_id_txt + '&include_details=true';
      $.ajax({
        url: url,
        dataType: 'json',
        success: $.proxy(function(articles) {
          this.$el.trigger('articles.loaded');
          if (articles.length == 0) {
            f(null);
          } else {
            f(articles);
          }
        }, this),
        error: $.proxy(function() {
          this.$el.trigger('articles.loaded');
          this.$el.trigger('articles.error');
          f(null);
        }, this)
      });
    },

    render: function(articles) {
      if (articles) {
        this.$el.html('');
        $.each(articles, $.proxy(function(idx, article) {
          this.$el.append(template($(this.options.template).html(), {
            "url": article.public_url,
            "title": article.title,
            "excerpt": article.excerpt,
            "date": this.options.dateFormat(new Date(article.created_at)),
            "dateAttr": this.options.dateAttrFormat(new Date(article.created_at)),
            "author": article.author,
            "body": article.body
          }));
        }, this));
        if(this.$pageLinks) {
          this.$pageLinks.find('.js-pagination-item.visible').removeClass('visible').addClass('hidden');
          this.$pageLinks.find('.js-pagination-item.active').removeClass('active').addClass('hidden');
          this.$pageLinks.find('.js-pagination-link[data-page="'+this.currentPage+'"]').parent().addClass('active').removeClass('hidden');

          for (var before = Math.max(this.currentPage - 3, 0); before < this.currentPage; before ++) {
            this.$pageLinks.find('.js-pagination-link[data-page="'+before+'"]').parent().addClass('visible').removeClass('hidden');
          }
          for (var after = this.currentPage + 1; after < this.currentPage + 5; after ++) {
            this.$pageLinks.find('.js-pagination-link[data-page="'+after+'"]').parent().addClass('visible').removeClass('hidden');
          }

          var paginationNr = $('.js-pagination-item');
          if (paginationNr.first().hasClass('active')) {
            $('.js-pagination-next').removeClass('disabled');
            $('.js-pagination-previous').addClass('disabled');
          } else if (paginationNr.last().hasClass('active')) {
            $('.js-pagination-previous').removeClass('disabled');
            $('.js-pagination-next').addClass('disabled');
          } else {
            $('.js-pagination-previous, .js-pagination-next').removeClass('disabled');
          }
        }
      }
    },

    next: function() {
      if (!this.options.articles_count || this.currentPage < Math.ceil(this.options.articles_count / this.options.perPage)) {
        this.fetch(this.currentPage + 1, $.proxy(function(articles) {
          if (articles) {
            this.currentPage += 1;
            this.render(articles);
          }
        }, this));
      }
    },

    prev: function() {
      if (this.currentPage > 1) {
        this.fetch(this.currentPage - 1, $.proxy(function(articles) {
          if (articles) {
            this.currentPage -= 1;
            this.render(articles);
          }
        }, this));
      }
    },

    showPage: function(nr) {
      this.fetch(nr, $.proxy(function(articles) {
        if (articles) {
          this.currentPage = nr;
          this.render(articles);
        }
      }, this));
    },

    getPageLinks: function() {
      if (!this.$pageLinks) {
        var $list = $('<nav class="menu-pagination js-menu-pagination"><div class="wrap"><ul class="menu js-menu"></ul></div></nav>');

        $list.find('.wrap').prepend($('<div class="menu-item pagination-previous js-pagination-btn js-pagination-previous disabled"><a class="menu-link" href="#">'+ this.options.newer +'</a></div>').click($.proxy(function(event) {
          event.preventDefault();
          this.prev();
        }, this)));

        if (this.options.articles_count) {
          var pages = Math.ceil(this.options.articles_count / this.options.perPage);
          for (var i=1; i <= pages; i++) {
            $list.find('.menu').append($('<li class="menu-item js-pagination-item hidden"><a class="menu-link js-pagination-link" href="#" data-page="'+i+'">'+i+'</a></li>').click($.proxy(function(event) {
              event.preventDefault();
              this.showPage(parseInt($(event.target).data('page'), 10));
            }, this)));
          }
        }

        $list.find('.wrap').append($('<div class="menu-item pagination-next js-pagination-btn js-pagination-next"><a class="menu-link" href="#">'+ this.options.older +'</a></div>').click($.proxy(function(event) {
          event.preventDefault();
          this.next();
        }, this)));

        this.$pageLinks = $list;
      }

      this.$pageLinks.find('.js-pagination-item.visible').removeClass('visible').addClass('hidden');
      this.$pageLinks.find('.js-pagination-item.active').removeClass('active').addClass('hidden');
      this.$pageLinks.find('.js-pagination-link[data-page="'+this.currentPage+'"]').parent().addClass('active').removeClass('hidden');

      for (var before = Math.max(this.currentPage - 3, 0); before < this.currentPage; before ++) {
        this.$pageLinks.find('.js-pagination-link[data-page="'+before+'"]').parent().addClass('visible').removeClass('hidden');
      }
      for (var after = this.currentPage + 1; after < this.currentPage + 5; after ++) {
        this.$pageLinks.find('.js-pagination-link[data-page="'+after+'"]').parent().addClass('visible').removeClass('hidden');
      }

      return this.$pageLinks;
    }
  };

  $.fn.articlePages = function(options, param) {
    if (options && typeof options == "string") {
      switch (options) {
        case "getObject":
        return $(this).data('article-pages');
        break;
        case "next":
        $(this).data('article-pages').next();
        break;
        case "prev":
        $(this).data('article-pages').prev();
        break;
        case "showPage":
        if (param) {
          $(this).data('article-pages').showPage(param);
        }
        break;
        case "getPageLinks":
        return $(this).data('article-pages').getPageLinks();
        break;
      }
    } else {
      return this.each(function() {
        if (!$(this).data('article-pages')) {
          var o = new ArticlePages($(this), options);
          $(this).data('article-pages', o);
        }
      });
    }
  };
})(jQuery);
