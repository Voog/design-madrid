{% comment %}
================================================================================
TEMPLATE DESIGN EDITOR STYLES.
Adds template design editor style overrides.
================================================================================
{% endcomment %}
<style data-voog-style>
:root {
  /* VoogStyle
     "path": ["Main Styles"],
     "title": "Font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global",
     "boundVariables": [
      "--site-title-font-family",
      "--main-menu-font-family",
      "--blog-list-headings-font-family",
      "--h1-font-family",
      "--h2-font-family",
      "--h3-font-family",
      "--content-font-family",
      "--footer-font-family"
     ]
  */
  --font-main: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Main Styles"],
     "title": "Background",
     "editor": "colorPicker",
     "scope": "global",
     "boundVariables": [
      "--header-background-color",
      "--footer-background-color"
    ]
  */
  --global-background-color: #f4f4f4;
  /* VoogStyle
     "path": ["Main Styles", "Colors"],
     "title": "Primary color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
        "--site-title-color",
        "--main-menu-hover-color",
        "--main-menu-active-color",
        "--submenu-hover-color",
        "--submenu-active-color",
        "--h1-color",
        "--h2-color",
        "--h3-color",
        "--content-links-hover-color"
     ]
  */
  --second-color: black;
  /* VoogStyle
     "path": ["Main Styles", "Colors"],
     "title": "Secondary color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
        "--content-color",
        "--form-field-text-color"
     ]
  */
  --main-color: #333;
  /* VoogStyle
     "path": ["Main Styles", "Colors"],
     "title": "Third color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
      "--main-menu-color",
      "--submenu-color",
      "--content-links-color",
      "--table-border-color"
     ]
  */
  --third-color: #818181;
  /* VoogStyle
     "path": ["Main Styles", "Colors"],
     "title": "Fourth color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
      "--blog-list-headings-color",
      "--form-field-background-color"
    ]
  */
  --fourth-color: white;
}

:root {
  /* VoogStyle
     "path": ["Header"],
     "title": "Background",
     "editor": "colorPicker",
     "scope": "global"
  */
  --header-background-color: #f4f4f4;
  /* VoogStyle
     "path": ["Header", "Site title"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --site-title-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Header", "Site title"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --site-title-letter-spacing: 0;
  /* VoogStyle
    "path": ["Header", "Site title"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --site-title-font-size: 24px;
  /* VoogStyle
    "path": ["Header", "Site title"],
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
  --site-title-font-weight: 400;
  /* VoogStyle
    "path": ["Header", "Site title"],
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
  --site-title-font-style: normal;
  /* VoogStyle
    "path": ["Header", "Site title"],
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
  --site-title-text-decoration: none;
  /* VoogStyle
    "path": ["Header", "Site title"],
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
  --site-title-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Site title"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --site-title-color: black;
  /* VoogStyle
     "path": ["Header", "Main menu links", "Normal"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --main-menu-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Header", "Main menu links", "Normal"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --main-menu-letter-spacing: 0;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--main-menu-hover-font-size",
      "--main-menu-active-font-size"
    ]
  */
  --main-menu-font-size: 16px;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Hover"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --main-menu-hover-font-size: 16px;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Active"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --main-menu-active-font-size: 16px;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Font weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--main-menu-hover-font-weight",
      "--main-menu-active-font-weight"
    ]
  */
  --main-menu-font-weight: 400;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Hover"],
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
  --main-menu-hover-font-weight: 400;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Active"],
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
  --main-menu-active-font-weight: 400;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Font style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--main-menu-hover-font-style",
      "--main-menu-active-font-style"
    ]
  */
  --main-menu-font-style: normal;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Hover"],
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
  --main-menu-hover-font-style: normal;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Active"],
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
  --main-menu-active-font-style: normal;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Text decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--main-menu-hover-text-decoration",
      "--main-menu-active-text-decoration"
    ]
  */
  --main-menu-text-decoration: none;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Hover"],
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
  --main-menu-hover-text-decoration: none;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Active"],
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
  --main-menu-active-text-decoration: none;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Text transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--main-menu-hover-text-transform",
      "--main-menu-active-text-transform"
    ]
  */
  --main-menu-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Hover"],
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
  --main-menu-hover-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Active"],
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
  --main-menu-active-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --main-menu-color: #818181;
 /* VoogStyle
  "path": ["Header", "Main menu links", "Hover"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --main-menu-hover-color: black;
 /* VoogStyle
  "path": ["Header", "Main menu links", "Active"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --main-menu-active-color: black;
}

:root {
  /* VoogStyle
     "path": ["Blog list"],
     "title": "Width",
     "editor": "rangePicker",
     "min": 200,
     "max": 600,
     "unit": "px",
     "scope": "global"
  */
  --blog-list-article-width: 300px;
  /* VoogStyle
     "path": ["Blog list"],
     "title": "Area alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --blog-list-alignment: left;
  /* VoogStyle
     "path": ["Blog list"],
     "title": "Padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 99,
     "unit": "px",
     "scope": "global"
  */
  --blog-list-padding: 30px;
  /* VoogStyle
     "path": ["Blog list", "Headings"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global",
     "boundVariables": [
     "--blog-list-date-font-family"
     ]
  */
  --blog-list-headings-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Blog list", "Headings"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --blog-list-headings-letter-spacing: 0;
  /* VoogStyle
     "path": ["Blog list", "Headings"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --blog-list-headings-line-height: 1.45em;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --blog-list-headings-font-size: 24px;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
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
  --blog-list-headings-font-weight: 600;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
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
  --blog-list-headings-font-style: normal;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
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
  --blog-list-headings-text-decoration: none;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
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
  --blog-list-headings-text-transform: none;
  /* VoogStyle
    "path": ["Blog list", "Headings"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--blog-list-date-color"
     ]
  */
  --blog-list-headings-color: white;
  /* VoogStyle
     "path": ["Blog list", "Date"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --blog-list-date-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Blog list", "Date"],
     "title": "Character spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --blog-list-date-letter-spacing: 0;
  /* VoogStyle
     "path": ["Blog list", "Date"],
     "title": "Padding top",
     "editor": "rangePicker",
     "min": 0,
     "max": 50,
     "step": 1,
     "unit": "px",
     "scope": "global"
  */
  --blog-list-date-padding-top: 8px;
  /* VoogStyle
    "path": ["Blog list", "Date"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --blog-list-date-font-size: 12px;
  /* VoogStyle
    "path": ["Blog list", "Date"],
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
  --blog-list-date-font-weight: 400;
  /* VoogStyle
    "path": ["Blog list", "Date"],
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
  --blog-list-date-font-style: normal;
  /* VoogStyle
    "path": ["Blog list", "Date"],
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
  --blog-list-date-text-decoration: none;
  /* VoogStyle
    "path": ["Blog list", "Date"],
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
  --blog-list-date-text-transform: none;
  /* VoogStyle
    "path": ["Blog list", "Date"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --blog-list-date-color: white;
}

:root {
  /* VoogStyle
     "path": ["Headings", "Title"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --h1-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Headings", "Title"],
     "title": "Alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --h1-alignment: center;
  /* VoogStyle
     "path": ["Headings", "Title"],
     "title": "Padding bottom",
     "editor": "rangePicker",
     "min": 0,
     "max": 150,
     "unit": "px",
     "scope": "global"
  */
  --h1-padding-bottom: 48px;
  /* VoogStyle
     "path": ["Headings", "Title"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --h1-letter-spacing: 0;
  /* VoogStyle
     "path": ["Headings", "Title"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --h1-line-height: 1.1em;
  /* VoogStyle
    "path": ["Headings", "Title"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --h1-font-size: 40px;
  /* VoogStyle
    "path": ["Headings", "Title"],
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
  --h1-font-weight: 600;
  /* VoogStyle
    "path": ["Headings", "Title"],
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
  --h1-font-style: normal;
  /* VoogStyle
    "path": ["Headings", "Title"],
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
  --h1-text-decoration: none;
  /* VoogStyle
    "path": ["Headings", "Title"],
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
  --h1-text-transform: none;
  /* VoogStyle
    "path": ["Headings", "Title"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --h1-color: black;
  /* VoogStyle
     "path": ["Headings", "Heading"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --h2-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Headings", "Heading"],
     "title": "Alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --h2-alignment: left;
  /* VoogStyle
     "path": ["Headings", "Heading"],
     "title": "Padding bottom",
     "editor": "rangePicker",
     "min": 0,
     "max": 150,
     "unit": "px",
     "scope": "global"
  */
  --h2-padding-bottom: 0px;
  /* VoogStyle
     "path": ["Headings", "Heading"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --h2-letter-spacing: 0;
  /* VoogStyle
     "path": ["Headings", "Heading"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --h2-line-height: 1.1em;
  /* VoogStyle
    "path": ["Headings", "Heading"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --h2-font-size: 24px;
  /* VoogStyle
    "path": ["Headings", "Heading"],
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
  --h2-font-weight: 600;
  /* VoogStyle
    "path": ["Headings", "Heading"],
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
  --h2-font-style: normal;
  /* VoogStyle
    "path": ["Headings", "Heading"],
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
  --h2-text-decoration: none;
  /* VoogStyle
    "path": ["Headings", "Heading"],
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
  --h2-text-transform: none;
  /* VoogStyle
    "path": ["Headings", "Heading"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --h2-color: black;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --h3-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --h3-alignment: left;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 150,
     "unit": "px",
     "scope": "global"
  */
  --h3-margin: 20px;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Padding bottom",
     "editor": "rangePicker",
     "min": 0,
     "max": 150,
     "unit": "px",
     "scope": "global"
  */
  --h3-padding-bottom: 0;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --h3-letter-spacing: 0;
  /* VoogStyle
     "path": ["Headings", "Subheading"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --h3-line-height: 1.1em;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --h3-font-size: 20px;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
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
  --h3-font-weight: 600;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
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
  --h3-font-style: normal;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
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
  --h3-text-decoration: none;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
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
  --h3-text-transform: none;
  /* VoogStyle
    "path": ["Headings", "Subheading"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --h3-color: black;
}

:root {
  /* VoogStyle
    "path": ["Content"],
    "title": "Background",
    "editor": "colorPicker",
    "scope": "global"
  */
  --content-background-color: rgba(255, 255, 255, 0);
  /* VoogStyle
     "path": ["Content"],
     "title": "Padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 200,
     "unit": "px",
     "scope": "global"
  */
  --content-padding: 0;
  /* VoogStyle
     "path": ["Content"],
     "title": "Width",
     "editor": "rangePicker",
     "min": 250,
     "max": 1250,
     "step": 10,
     "unit": "px",
     "scope": "global"
  */
  --main-width: 700px;
  /* VoogStyle
     "path": ["Content", "Submenu links", "Normal"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --submenu-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Content", "Submenu links", "Normal"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --submenu-letter-spacing: 0;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--submenu-hover-font-size",
      "--submenu-active-font-size"
    ]
  */
  --submenu-font-size: 14px;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Hover"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --submenu-hover-font-size: 14px;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Active"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --submenu-active-font-size: 14px;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Font weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--submenu-hover-font-weight",
      "--submenu-active-font-weight"
    ]
  */
  --submenu-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Hover"],
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
  --submenu-hover-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Active"],
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
  --submenu-active-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Font style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--submenu-hover-font-style",
      "--submenu-active-font-style"
    ]
  */
  --submenu-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Hover"],
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
  --submenu-hover-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Active"],
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
  --submenu-active-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Text decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--submenu-hover-text-decoration",
      "--submenu-active-text-decoration"
    ]
  */
  --submenu-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Hover"],
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
  --submenu-hover-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Active"],
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
  --submenu-active-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Text transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--submenu-hover-text-transform",
      "--submenu-active-text-transform"
    ]
  */
  --submenu-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Hover"],
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
  --submenu-hover-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Active"],
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
  --submenu-active-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Submenu links", "Normal"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --submenu-color: #818181;
 /* VoogStyle
  "path": ["Content", "Submenu links", "Hover"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --submenu-hover-color: black;
 /* VoogStyle
  "path": ["Content", "Submenu links", "Active"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --submenu-active-color: black;
  /* VoogStyle
     "path": ["Content", "Text"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global",
     "boundVariables": [
       "--form-field-text-font-family"
     ]
  */
  --content-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Content", "Text"],
     "title": "Alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --content-alignment: left;
  /* VoogStyle
     "path": ["Content", "Text"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --content-letter-spacing: 0;
  /* VoogStyle
     "path": ["Content", "Text"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --content-line-height: 1.45 #em;
  /* VoogStyle
    "path": ["Content", "Text"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--form-field-text-font-size"
    ]
  */
  --content-font-size: 18px;
  /* VoogStyle
    "path": ["Content", "Text"],
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
  --content-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Text"],
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
  --content-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Text"],
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
  --content-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Text"],
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
  --content-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Text"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-color: #333;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-size"
    ]
  */
  --content-links-font-size: 18px;
  /* VoogStyle
    "path": ["Content", "Links", "Hover"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --content-links-hover-font-size: 18px;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Font weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-weight"
    ]
  */
  --content-links-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Links", "Hover"],
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
  --content-links-hover-font-weight: 400;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Font style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-style"
    ]
  */
  --content-links-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Links", "Hover"],
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
  --content-links-hover-font-style: normal;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Text decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-text-decoration"
    ]
  */
  --content-links-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Links", "Hover"],
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
  --content-links-hover-text-decoration: none;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Text transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-text-transform"
    ]
  */
  --content-links-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Links", "Hover"],
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
  --content-links-hover-text-transform: none;
  /* VoogStyle
    "path": ["Content", "Links", "Normal"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-links-color: #818181;
 /* VoogStyle
  "path": ["Content", "Links", "Hover"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --content-links-hover-color: black;
}

:root {
  /* VoogStyle
     "path": ["Footer"],
     "title": "Footer background",
     "editor": "colorPicker",
     "scope": "global"
  */
  --footer-background-color: #f4f4f4;
  /* VoogStyle
     "path": ["Footer", "Text"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --footer-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Footer", "Text"],
     "title": "Alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --footer-alignment: center;
  /* VoogStyle
     "path": ["Footer", "Text"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --footer-letter-spacing: 0;
  /* VoogStyle
     "path": ["Footer", "Text"],
     "title": "Line height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --footer-line-height: 1.45 #em;
  /* VoogStyle
    "path": ["Footer", "Text"],
    "title": "Size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --footer-font-size: 10px;
  /* VoogStyle
    "path": ["Footer", "Text"],
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
  --footer-font-weight: 400;
  /* VoogStyle
    "path": ["Footer", "Text"],
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
  --footer-font-style: normal;
  /* VoogStyle
    "path": ["Footer", "Text"],
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
  --footer-text-decoration: none;
  /* VoogStyle
    "path": ["Footer", "Text"],
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
  --footer-text-transform: none;
  /* VoogStyle
    "path": ["Footer", "Text"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --footer-color: #333;
}

:root {
  /* VoogStyle
    "path": ["Tables"],
    "title": "Background",
    "editor": "colorPicker",
    "scope": "global"
  */
  --table-background-color: black;
  /* VoogStyle
    "path": ["Tables"],
    "title": "Border color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --table-border-color: #818181;
  /* VoogStyle
     "path": ["Tables"],
     "title": "Border width",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --table-border-width: 1px;
  /* VoogStyle
     "path": ["Tables"],
     "title": "Padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 100,
     "unit": "px",
     "scope": "global"
  */
  --table-cell-padding: 10px;
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

.main {
  background-color: var(--global-background-color);
}

.header,
.main-menu {
  background-color: var(--header-background-color);
}

body,
.custom-btn,
.lang-menu-btn,
.jq-select,
.form_field_textfield,
.form_field_textarea,
.form_submit input,
.submit,
input[type=submit],
input[type=text],
textarea,
.search-submit,
.lang-menu-btn,
.option-btn {
  font-family: var(--font-main);
}

body,
.header .main-menu-toggler {
  color: var(--main-color);
}

.voog-search-modal-results h3,
.voog-search-modal-results a {
  color: var(--second-color);
}

.option-btn,
blockquote,
.voog-search-modal-result,
.post-header .post-date,
.post-cover .post-cover-inner .edy-img-drop-area-placeholder,
.comment .comment-info {
  color: var(--third-color);
}

.wrap {
  max-width: var(--main-width);
}

main .content.formatted {
  background-color: var(--content-background-color);
  padding: var(--content-padding);
}

main .content-body,
main .post-content {
  color: var(--content-color);
  font-family: var(--content-font-family);
  font-size: var(--content-font-size);
  font-style: var(--content-font-style);
  font-weight: var(--content-font-weight);
  letter-spacing: var(--content-letter-spacing);
  line-height: var(--content-line-height);
  text-align: var(--content-alignment);
  text-decoration: var(--content-text-decoration);
  text-transform: var(--content-text-transform);
}

main .content-body a,
main .post-content a,
main .footer-content a {
  color: var(--content-links-color);
  font-family: var(--content-links-font-family);
  font-style: var(--content-links-font-style);
  font-weight: var(--content-links-font-weight);
  letter-spacing: var(--content-links-letter-spacing);
  text-decoration: var(--content-links-text-decoration);
  text-transform: var(--content-links-text-transform);
}
main .content-body a:hover,
main .post-content a:hover,
main .footer-content a:hover {
  color: var(--content-links-hover-color);
  font-style: var(--content-links-hover-font-style);
  font-weight: var(--content-links-hover-font-weight);
  text-decoration: var(--content-links-hover-text-decoration);
  text-transform: var(--content-links-hover-text-transform);
}

main .content-body a,
main .post-content a {
  font-size: var(--content-links-font-size);
}
main .content-body a:hover,
main .post-content a:hover {
  font-size: var(--content-links-hover-font-size);
}

.formatted h1 {
  color: var(--h1-color);
  font-family: var(--h1-font-family);
  font-size: var(--h1-font-size);
  font-style: var(--h1-font-style);
  font-weight: var(--h1-font-weight);
  letter-spacing: var(--h1-letter-spacing);
  line-height: var(--h1-line-height);
  padding-bottom: var(--h1-padding-bottom);
  text-align: var(--h1-alignment);
  text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}
.formatted h2 {
  color: var(--h2-color);
  font-family: var(--h2-font-family);
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  letter-spacing: var(--h2-letter-spacing);
  line-height: var(--h2-line-height);
  padding-bottom: var(--h2-padding-bottom);
  text-align: var(--h2-alignment);
  text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
}
.formatted h3 {
  color: var(--h3-color);
  font-family: var(--h3-font-family);
  font-size: var(--h3-font-size);
  font-style: var(--h3-font-style);
  font-weight: var(--h3-font-weight);
  letter-spacing: var(--h3-letter-spacing);
  line-height: var(--h3-line-height);
  padding-bottom: var(--h3-padding-bottom);
  text-align: var(--h3-alignment);
  text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}

@media screen and (max-width: 500px) {
  .formatted h1 {
    font-size: calc(var(--h1-font-size) - 4px);
  }
  .formatted h2 {
    font-size: calc(var(--h2-font-size) - 2px);
  }
  .formatted h3 {
    font-size: calc(var(--h3-font-size) - 2px);
  }
}
.site-title {
  color: var(--site-title-color);
  font-family: var(--site-title-font-family);
  font-style: var(--site-title-font-style);
  font-weight: var(--site-title-font-weight);
  letter-spacing: var(--site-title-letter-spacing);
  text-transform: var(--site-title-text-transform);
}
.site-title .site-title-inner {
  text-decoration: var(--site-title-text-decoration);
}
.site-title a {
  color: black;
}

.main-menu ul a {
  color: var(--main-menu-color);
  font-family: var(--main-menu-font-family);
  font-size: var(--main-menu-font-size);
  font-style: var(--main-menu-font-style);
  font-weight: var(--main-menu-font-weight);
  letter-spacing: var(--main-menu-letter-spacing);
  text-decoration: var(--main-menu-text-decoration);
  text-transform: var(--main-menu-text-transform);
}
.main-menu ul a:hover {
  color: var(--main-menu-hover-color);
  font-size: var(--main-menu-hover-font-size);
  font-style: var(--main-menu-hover-font-style);
  font-weight: var(--main-menu-hover-font-weight);
  text-decoration: var(--main-menu-hover-text-decoration);
  text-transform: var(--main-menu-hover-text-transform);
}
.main-menu ul a.active {
  color: var(--main-menu-active-color);
  font-size: var(--main-menu-active-font-size);
  font-style: var(--main-menu-active-font-style);
  font-weight: var(--main-menu-active-font-weight);
  text-decoration: var(--main-menu-active-text-decoration);
  text-transform: var(--main-menu-active-text-transform);
}

.sub-menu a {
  color: var(--submenu-color);
  font-family: var(--submenu-font-family);
  font-size: var(--submenu-font-size);
  font-style: var(--submenu-font-style);
  font-weight: var(--submenu-font-weight);
  letter-spacing: var(--submenu-letter-spacing);
  text-decoration: var(--submenu-text-decoration);
  text-transform: var(--submenu-text-transform);
}
.sub-menu a:hover {
  color: var(--submenu-hover-color);
  font-size: var(--submenu-hover-font-size);
  font-style: var(--submenu-hover-font-style);
  font-weight: var(--submenu-hover-font-weight);
  text-decoration: var(--submenu-hover-text-decoration);
  text-transform: var(--submenu-hover-text-transform);
}
.sub-menu a.active {
  color: var(--submenu-active-color);
  font-size: var(--submenu-active-font-size);
  font-style: var(--submenu-active-font-style);
  font-weight: var(--submenu-active-font-weight);
  text-decoration: var(--submenu-active-text-decoration);
  text-transform: var(--submenu-active-text-transform);
}

.footer {
  background-color: var(--footer-background-color);
}
.footer .footer-content {
  color: var(--footer-color);
  font-family: var(--footer-font-family);
  font-size: var(--footer-font-size);
  font-style: var(--footer-font-style);
  font-weight: var(--footer-font-weight);
  letter-spacing: var(--footer-letter-spacing);
  line-height: var(--footer-line-height);
  text-align: var(--footer-alignment);
  text-decoration: var(--footer-text-decoration);
  text-transform: var(--footer-text-transform);
}

@media screen and (min-width: 500px) {
  .site-title {
    font-size: var(--site-title-font-size);
  }

  .blog-list-page .main .article,
  .blog-list-page .main .new-article {
    width: var(--blog-list-article-width);
  }
}
.blog-list-page .main .article .article-content,
.blog-list-page .main .new-article .article-content {
  text-align: var(--blog-list-alignment);
  left: var(--blog-list-padding);
  right: var(--blog-list-padding);
}
.blog-list-page .main .article h2,
.blog-list-page .main .new-article h2 {
  color: var(--blog-list-headings-color);
  font-family: var(--blog-list-headings-font-family);
  font-size: var(--blog-list-headings-font-size);
  font-style: var(--blog-list-headings-font-style);
  font-weight: var(--blog-list-headings-font-weight);
  letter-spacing: var(--blog-list-headings-letter-spacing);
  line-height: var(--blog-list-headings-line-height);
  text-decoration: var(--blog-list-headings-text-decoration);
  text-transform: var(--blog-list-headings-text-transform);
}
.blog-list-page .main .article .article-date,
.blog-list-page .main .new-article .article-date {
  color: var(--blog-list-date-color);
  font-family: var(--blog-list-date-font-family);
  font-size: var(--blog-list-date-font-size);
  font-style: var(--blog-list-date-font-style);
  font-weight: var(--blog-list-date-font-weight);
  letter-spacing: var(--blog-list-date-letter-spacing);
  padding-top: var(--blog-list-date-padding-top);
  text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
}

textarea {
  font-family: var(--form-field-text-font-family);
}

.form_field_textfield,
.form_field_textarea {
  background-color: var(--form-field-background-color);
  border: var(--form-field-border-width) var(--form-field-border-color) solid;
  color: var(--form-field-text-color);
  font-family: var(--form-field-text-font-family);
  font-size: var(--form-field-text-font-size);
  line-height: var(--form-field-text-line-height);
  font-style: var(--form-field-text-font-style);
  font-weight: var(--form-field-text-font-weight);
  padding-left: var(--form-field-padding);
  padding-right: var(--form-field-padding);
  text-decoration: var(--form-field-text-text-decoration);
  text-transform: var(--form-field-text-text-transform);
}

label .form_field_checkbox + .form_control_indicator::before {
  background: var(--form-field-background-color);
}
label .form_field_radio + .form_control_indicator::before {
  border-color: var(--form-field-background-color);
}
label .form_field_radio:checked + .form_control_indicator::before {
  background-color: var(--form-field-text-color);
}
</style>

{{ site.style_tag }}