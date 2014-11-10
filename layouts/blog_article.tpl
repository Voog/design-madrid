<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
</head>
<body class="{% if site.search.enabled %} search-enabled{% endif %}">

  <div class="holder">
    {% include "header" %}
  
    <main class="main" data-search-indexing-allowed="true">
      <div class="content-wrap">
        {% include "submenu" %}
        <div class="wrap">
          <div class="content cfx">
          
            <header class="post-header">
              <h1>{% editable article.title %}<time class="post-date" datetime="{{ article.created_at | date : "%Y %m %d" }}">{{ article.created_at | date : "%d.%m" }}</time></h1>
            </header>
            <section class="post-content">
              <div class="post-excerpt cfx formatted">{% editable article.excerpt %}</div>
              <div class="post-body cfx formatted">{% editable article.body %}</div>

              {% if editmode %}
              <div class="post-tags">
              {% editable article.tags %}
              </div>
              {% endif %}
            </section>
          
            <section class="post-bottom cfx">
              <div class="left">
                {% if editmode %}
                  {% include "article-image" %}
                {% else %}
                  {% include "comment-form" %}
                {% endif %}
              </div>
            
              <div class="right">
                {% include "comments" %}
              </div>
            </section>
          
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
      $el.text(moment($el.data('date'), "YYYY MM DD").locale(langCode).fromNow())
    });
  });
  </script>
</body>
</html>