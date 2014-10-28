<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>

<body class="common-page content-page{% if editmode or site.has_many_languages? %} multilingual{% endif %}">
  <div class="container">
    {% include "header" %}
    {% include "menu-level-2" %}

    <main class="content" role="main">
      <div class="wrap{% if editmode or with_sumbenu == true %} with-submenu{% endif %}">
        <section class="content-body content-formatted">{% content %}</section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
    <script type="text/javascript">site.initCommonPage();</script>
</body>
</html>
