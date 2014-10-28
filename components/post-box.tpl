<article class="post">
  {% if post-box == "article" %}<div class="wrap{% if editmode or with_submenu == true %} with-submenu{% endif %}">{% endif %}
    <header class="post-header">
      {% if post-box == "article" %}
        <h1 class="post-title">{% editable article.title %}</h1>
      {% else %}
        <h2 class="post-title">
          <a href="{{ article.url }}">{{ article.title }}</a>
        </h2>
      {% endif %}
      <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "long" }}</time>
    </header>

    <div class="post-content">
      <div class="post-excerpt content-formatted">{% if post-box == "article" %}{% editable article.excerpt %}{% else %}{{ article.excerpt }}{% endif %}</div>
      {% if post-box == "article" %}
        <div class="post-body content-formatted">{% editable article.body %}</div>
      {% endif %}
    </div>
  {% if post-box == "article" %}</div>{% endif %}
</article>
