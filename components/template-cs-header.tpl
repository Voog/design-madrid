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
  --header-site-title-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Header", "Site title"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --header-site-title-letter-spacing: 0;
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
  --header-site-title-font-size: 24px;
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
  --header-site-title-font-weight: 400;
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
  --header-site-title-font-style: normal;
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
  --header-site-title-text-decoration: none;
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
  --header-site-title-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Site title"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --header-site-title-color: black;
  /* VoogStyle
     "path": ["Header", "Main menu links", "Normal"],
     "title": "Font family",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --header-mainmenu-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "path": ["Header", "Main menu links", "Normal"],
     "title": "Letter spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --header-mainmenu-letter-spacing: 0;
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
      "--header-mainmenu-hover-font-size",
      "--header-mainmenu-active-font-size"
    ]
  */
  --header-mainmenu-font-size: 16px;
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
  --header-mainmenu-hover-font-size: 16px;
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
  --header-mainmenu-active-font-size: 16px;
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
      "--header-mainmenu-hover-font-weight",
      "--header-mainmenu-active-font-weight"
    ]
  */
  --header-mainmenu-font-weight: 400;
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
  --header-mainmenu-hover-font-weight: 400;
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
  --header-mainmenu-active-font-weight: 400;
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
      "--header-mainmenu-hover-font-style",
      "--header-mainmenu-active-font-style"
    ]
  */
  --header-mainmenu-font-style: normal;
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
  --header-mainmenu-hover-font-style: normal;
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
  --header-mainmenu-active-font-style: normal;
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
      "--header-mainmenu-hover-text-decoration",
      "--header-mainmenu-active-text-decoration"
    ]
  */
  --header-mainmenu-text-decoration: none;
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
  --header-mainmenu-hover-text-decoration: none;
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
  --header-mainmenu-active-text-decoration: none;
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
      "--header-mainmenu-hover-text-transform",
      "--header-mainmenu-active-text-transform"
    ]
  */
  --header-mainmenu-text-transform: uppercase;
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
  --header-mainmenu-hover-text-transform: uppercase;
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
  --header-mainmenu-active-text-transform: uppercase;
  /* VoogStyle
    "path": ["Header", "Main menu links", "Normal"],
    "title": "Color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --header-mainmenu-color: #818181;
 /* VoogStyle
  "path": ["Header", "Main menu links", "Hover"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --header-mainmenu-hover-color: black;
 /* VoogStyle
  "path": ["Header", "Main menu links", "Active"],
  "title": "Color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --header-mainmenu-active-color: black;
}
