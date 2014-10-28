<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>
<body class="front-page{% if site.search.enabled %} search-enabled{% endif %}">
 
{% include "mobilemenu" %}
{% include "javascripts" %}
</body>
</html>
