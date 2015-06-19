{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% comment %}{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">{% endcomment %}

{% comment %}Open Graph image{% endcomment %}
{% comment %}{% if front_page %}
  {% if content_left_bg.image == nil and content_right_bg.image == nil %}
    <meta property="og:image" content="{% if images_path contains "http://" or images_path contains "https://" %}{{ content_left_bg_image_original }}{% else %}{{ site.url }}{{ content_left_bg_image_original | remove_first: '/' }}{% endif %}">
  {% elsif content_left_bg.image != nil and content_left_bg.image != "" %}
    <meta property="og:image" content="{{ content_left_bg_image }}">
  {% elsif content_right_bg.image != nil and content_right_bg.image != "" %}
    <meta property="og:image" content="{{ content_right_bg_image }}">
  {% endif %}

{% else %}
  {% if article and article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif article and article.data.background.image != nil and article.data.background.image != "" %}
    <meta property="og:image" content="{{ article.data.background.image }}">
  {% elsif blog_page %}
    {% for article in articles %}
      {% if article.data.background.image != nil and article.data.background.image != "" %}
        <meta property="og:image" content="{{ article.data.background.image }}">
        {% break %}
      {% endif %}
    {% endfor %}
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
{% endif %}{% endcomment %}

{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if page.image == nil and front_page %}
  {% if content_left_bg_image_sizes != nil and content_left_bg_image_sizes != '' %}
    {% assign og_image = content_left_bg_image_sizes[0] %}
  {% elsif content_right_bg_image_sizes != nil and content_right_bg_image_sizes != '' %}
    {% assign og_image = content_right_bg_image_sizes[0] %}
  {% endif %}
{% else %}
  {% if article %}
    {% if article.image? %}
      {% assign og_image = article.image %}
    {% endif %}
  {% elsif page.image? %}
    {% assign og_image = page.image %}
  {% endif %}
{% endif %}

{% if og_image %}
  {% if og_image.url %}<meta property="og:image" content="{{ og_image.url }}">{% endif %}
  {% if og_image.content_type %}<meta property="og:image:type" content="{{ og_image.content_type }}">{% endif %}
  {% if og_image.width %}<meta property="og:image:width" content="{{ og_image.width }}">{% endif %}
  {% if og_image.height %}<meta property="og:image:height" content="{{ og_image.height }}">{% endif %}
{% endif %}

{% comment %}Open Graph description{% endcomment %}
{% if article %}{% assign description = article.description %}{% else %}{% assign description = page.description %}{% endif %}
{% if description != nil and description != '' %}
  <meta property="og:description" content="{{ description }}">
  <meta name="description" content="{{ description }}">
{% endif %}
