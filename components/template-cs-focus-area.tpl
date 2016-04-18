:root {
  /* VoogStyle
     "pathI18n": ["custom_styles.focus_area"],
     "titleI18n": "custom_styles.alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_horizontal_set }},
     "scope": "global"
  */
  --focus-area-alignment: left;
  /* VoogStyle
     "pathI18n": ["custom_styles.focus_area"],
     "titleI18n": "custom_styles.position",
     "editor": "listPicker",
     "list": {{ base_alignment_vertical_set }},
     "scope": "global"
  */
  --focus-area-vertical-alignment: middle;
  /* VoogStyle
     "pathI18n": ["custom_styles.focus_area"],
     "titleI18n": "custom_styles.padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 99,
     "unit": "px",
     "scope": "global"
  */
  --focus-area-padding: 45px;
  /* VoogStyle
     "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
     "titleI18n": "custom_styles.line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --focus-area-line-height: 1.45;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --focus-area-font-size: 24px;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
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
  --focus-area-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
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
  --focus-area-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
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
  --focus-area-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
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
  --focus-area-text-transform: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.focus_area", "custom_styles.text"],
    "titleI18n": "custom_styles.color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--focus-area-date-color"
     ]
  */
  --focus-area-color: white;
}
