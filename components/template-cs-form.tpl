:root {
  /* VoogStyle
    "path": ["Forms"],
    "title": "Field background",
    "editor": "colorPicker",
    "scope": "global"
  */
  --form-field-background-color: white;
  /* VoogStyle
    "path": ["Forms"],
    "title": "Field border color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --form-field-border-color: black;
  /* VoogStyle
     "path": ["Forms"],
     "title": "Field border width",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --form-field-border-width: 0;
  /* VoogStyle
     "path": ["Forms"],
     "title": "Field padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 100,
     "unit": "px",
     "scope": "global"
  */
  --form-field-padding: 10px;
  /* VoogStyle
     "path": ["Forms", "Text"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --form-field-text-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Forms", "Text"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --form-field-text-line-height: 1.45 #em;
  /* VoogStyle
    "path": ["Forms", "Text"],
    "title": "Size",
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
    "path": ["Forms", "Text"],
    "title": "Font weight",
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
    "path": ["Forms", "Text"],
    "title": "Font style",
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
    "path": ["Forms", "Text"],
    "title": "Text decoration",
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
    "path": ["Forms", "Text"],
    "title": "Text transform",
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
    "path": ["Forms", "Text"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --form-field-text-color: #333;
}
