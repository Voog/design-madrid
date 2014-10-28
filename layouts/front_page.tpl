<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>

  <body class="front-page">
    <div class="container js-container">
      {% include "header" with "content" %}

      <main class="content" role="main">
        {% comment %}Set variables to detect if "feature content areas" have content{% endcomment %}
        {% capture feature_left_html %}{% unless editmode %}{% content name="feature_left" %}{% endunless %}{% endcapture %}
        {% capture feature_left_size %}{{ feature_left_html | size | minus : 1 }}{% endcapture %}
        {% capture feature_right_html %}{% unless editmode %}{% content name="feature_right" %}{% endunless %}{% endcapture %}
        {% capture feature_right_size %}{{ feature_right_html | size | minus : 1 }}{% endcapture %}

        <div class="main-feature">
          <div class="wrap">
            <div class="feature-left inner inner-left content-formatted{% if editmode %} narrow-feature{% else %}{% unless feature_right_size contains '-' %} narrow-feature{% endunless %}{% endif %}">{% content name="feature_left" %}</div>
            <div class="feature-right inner inner-right content-formatted{% if editmode %} narrow-feature{% else %}{% unless feature_left_size contains '-' %} narrow-feature{% endunless %}{% endif %}">{% content name="feature_right" %}</div>
          </div>
        </div>

        <div class="summary dark-background">
          <div class="wrap">
            {% if site.latest_articles.size > 0 %}
              <section class="blog inner inner-left">
                <h1 class="blog-title">{{ "latest_news" | lc }}</h1>
                {% for article in site.latest_articles limit: 3 %}
                  <article class="post">
                    <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
                    <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%B %d, %Y" }}</time>
                  </article>
                {% endfor %}
              </section>
            {% endif %}

            <section class="quotation inner inner-right">
              <div class="content-formatted">{% content name="quotation" %}</div>
            </section>
          </div>
        </div>

        <div class="contacts">
          <div class="wrap content-formatted js-custom-content-formatted">{% content name="contacts" %}</div>
        </div>

        <div class="map">
          <section class="content-formatted">
            {% content name="map" %}
          </section>
        </div>
      </main>

      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    <script>site.initFrontPage();</script>
    {% include "edicy-tools" %}
  </body>
</html>
