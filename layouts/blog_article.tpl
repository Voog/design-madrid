<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="main-menu-fits{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">
    {% include "header" %}
  
    <main class="main" data-search-indexing-allowed="true">
      <div class="main-inner">
        <div class="content-wrap">
          {% include "submenu" %}
          <div class="wrap">
            <div class="content cfx">
          
              <header class="post-header ">
                <h1>{% editable article.title %}<time class="post-date" datetime="{{ article.created_at | date : "%Y %m %d" }}">{{ article.created_at | format_date: "long" }}</time></h1>
              </header>
              <section class="post-content">
                <div class="post-excerpt cfx formatted">{% editable article.excerpt %}</div>
                <div class="post-body cfx formatted">{% editable article.body %}</div>

                {% if editmode or article.tags.size > 0 %}
                <div class="post-tags">
                  {% if editmode %}
                    {% editable article.tags %}
                  {% else %}
                    <ul>
                    {% for tag in article.tags %}
                      <li><a href="{{ page.url }}/tagged/{{ tag.path }}" class="post-tag">{{ tag.name }}</a></li>
                    {% endfor %}
                    </ul>
                  {% endif %}
                </div>
                {% endif %}
              </section>
          
              <section class="post-bottom formatted cfx">
                {% include "comment-form" %}
                {% include "comments" %}
              </section>
          
            </div>
          </div>
        </div>
      </div>
      {% include "footer" %}
    </main>
  </div>
  
  {% include "langmenu-mobile" %}
  {% include "javascripts" %}
  {% include "bg-picker" with 'article' %}
  
  <script>
  $(function() {
    
    var langCode ='{% if page.language_code == 'zh'%}zh-cn{% else %}{{ page.language_code }}{% endif %}';
       
    $('.comment-created').each(function() {
      var $el = $(this);
      $el.text(moment($el.data('date'), "YYYY-MM-DD HH:mm:ss Z").locale(langCode).fromNow())
    });
  });
  </script>
</body>
</html>