  <footer class="footer" data-search-indexing-allowed="false">
    <div class="wrap">
      <div class="inner">
        <div class="row">
          <div class="footer-content">
            <div class="tbl">
              <div class="tbl-row">
                <div class="tbl-cell lang-menu-wrap">
                  {% include "langmenu" %}
                </div>
                <div class="tbl-cell">
                  {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
                  <div class="formatted">{% xcontent name="footer" title_tooltip=footer_content_title_tooltip %}</div>

                  {% if site.branding.enabled and page.path == blank -%}
                    <div class="voog-reference">
                      {% loginblock %}
                        {{ "footer_login_link" | lc }}
                      {% endloginblock %}
                    </div>
                  {% endif -%}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
