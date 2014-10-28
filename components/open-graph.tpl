{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}


  {% unless page.data.cover_image == '' %}
    {% if page.data.cover_image == nil %}
      <meta property="og:image" content="{{ site.url }}{{ cover_image | remove_first: '/' }}">
    {% else %}
      <meta property="og:image" content="{{ cover_image }}">
    {% endif %}
  {% endunless %}
{% else %}
  {% if article and article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
{% endif %}

{% if article %}
  {% assign page_data = article.data %}
{else }
  {% assign page_data = page.data %}
{% endif %}


{% comment %}Open Graph description{% endcomment %}
{% if blog and article == nil and (page.description == nil or page.description == "") %}
  {% assign excerpt_description = articles.first.excerpt | strip_html | escape | strip_newlines | truncatewords: 200, '...' %}
  <meta property="og:description" content="{{ excerpt_description }}">
  <meta name="description" content="{{ excerpt_description }}">
{% else %}
    <meta property="og:description" content="{% if article %}{{ article.description }}{% else %}{{ page.description }}{% endif %}">
    <meta name="description" content="{% if article %}{{ article.description }}{% else %}{{ page.description }}{% endif %}">
{% endif %}
