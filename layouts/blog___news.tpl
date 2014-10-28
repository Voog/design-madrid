<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>

<body class="blog-page content-page{% if editmode or site.has_many_languages? %} multilingual{% endif %}">
  <div class="loader js-loader hidden">
    <div class="loader-cube loader-cube-1"></div>
    <div class="loader-cube loader-cube-2"></div>
  </div>

  <div class="container">
    {% include "header" %}
    {% include "tags-blog" %}

    <main class="content" role="main">
      <div class="wrap{% if editmode or with_submenu == true %} with-submenu{% endif %}">
        {% if editmode %}<div class="post-add-btn">{% addbutton %}</div>{% endif %}

        <section class="blog-articles js-blog-articles">
          {% for article in articles limit: 3 %}
            {% include "post-box" %}
          {% endfor %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  <script>var langCode ='{% if page.language_code == 'zh'%}zh-cn{% else %}{{ page.language_code }}{% endif %}';</script>
  <script src="{{ javascripts_path }}/blog-and-news.js"></script>

  <script type="text/html" id="article-template">
    <article class="post">
      <header class="post-header">
        <div class="post-header-top">
          <h2 class="post-title"><a href="[[url]]">[[title]]</a></h2>
          <time class="post-date" datetime="[[dateAttr]]">[[date]]</time>
        </div>
      </header>

      <div class="post-content">
        <div class="post-excerpt content-formatted">[[excerpt]]</div>
      </div>
    </article>
  </script>

  <script>
    $('.js-blog-articles').on({
      'articles.loading': function() {
        $('.js-blog-articles').hide();
        $('.js-loader').removeClass('hidden');
      },
      'articles.loaded': function() {
        $('.js-blog-articles').show();
        $('.js-loader').addClass('hidden');
      }
    });

    $('.js-blog-articles').articlePages({
        articles_count: {{ articles.size }},
        older: '{{ 'next' | lc }}',
        newer: '{{ 'previous' | lc }}',
        page_id: {{ page.id }}{% if tags %},
        tags: ['{{ tags.first.name }}']{% endif %}
    });

    $(document).ready(function() {
      $('.js-menu-pagination-wrap').append($('.js-blog-articles').articlePages('getPageLinks'));

      currentUrl = window.location.href;
      blogUrl = '{{ site.url }}{{ page.path }}';
      if (currentUrl === blogUrl) {
        $('.js-tags-all').addClass('active');
      };
    });

    site.initBlogPage();
  </script>
</body>
</html>
