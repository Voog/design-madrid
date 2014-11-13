{% if article.comments_count > 0%}
  <div class="right">
    <section class="comments formatted">
      <h2 class="comment-title">{{ 'replies' | lcc : article.comments_count }}</h2>
      {% for comment in article.comments reversed %}
        <div class="comment edy-site-blog-comment">
          <div class="comment-body">{{ comment.body_html }}</div>
          <div class="comment-info">{{ comment.author }}, <span class="comment-created" data-date="{{ comment.created_at }}">{{ comment.created_at | format_date: "long" }}</span> {% removebutton %}</div>
        </div>
      {% endfor %}
    </section>
  </div>
{% endif %}