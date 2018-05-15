<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js" integrity="sha256-jnOjDTXIPqall8M0MyTSt98JetJuZ7Yu+1Jm7hLTF7U=" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/application.min.js"></script>
{% sitejs_include %}

{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>site.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}', '{{ 'search_noresults' | lc | escape }}');</script>
{% endif %}

{% if editmode %}
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
    edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale | escape }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  </script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
