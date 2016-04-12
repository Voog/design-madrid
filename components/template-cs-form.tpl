:root {
  /* VoogStyle
    "pathI18n": ["custom_styles.form"],
    "titleI18n": "custom_styles.background_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --form-background-color: transparent;
  /* VoogStyle
     "pathI18n": ["custom_styles.form"],
     "titleI18n": "custom_styles.padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 100,
     "unit": "px",
     "scope": "global"
  */
  --form-padding: 0;
  /* VoogStyle
    "pathI18n": ["custom_styles.form"],
    "titleI18n": "custom_styles.field_bg_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --form-field-background-color: white;
  /* VoogStyle
    "pathI18n": ["custom_styles.form"],
    "titleI18n": "custom_styles.field_border_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --form-field-border-color: black;
  /* VoogStyle
     "pathI18n": ["custom_styles.form"],
     "titleI18n": "custom_styles.field_border_thickness",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --form-field-border-width: 0;
  /* VoogStyle
     "pathI18n": ["custom_styles.form"],
     "titleI18n": "custom_styles.field_padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 100,
     "unit": "px",
     "scope": "global"
  */
  --form-field-padding: 10px;
  /* VoogStyle
     "pathI18n": ["custom_styles.form", "custom_styles.text"],
     "titleI18n": "custom_styles.field_font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --form-field-text-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "pathI18n": ["custom_styles.form", "custom_styles.text"],
     "titleI18n": "custom_styles.line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --form-field-text-line-height: 1.45 #em;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --form-field-text-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --form-field-text-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --form-field-text-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --form-field-text-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --form-field-text-text-transform: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.form", "custom_styles.text"],
    "titleI18n": "custom_styles.color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --form-field-text-color: #333;
}
