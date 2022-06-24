---
title: "Npm ERR"
date: 2022-06-24T11:47:06+08:00
draft: false
# description: "Example article description"
categories:
  - "NPM"
tags:
  - "NPM"
# menu: main # Optional, add page to a menu. Options: main, side, footer

# Theme-Defined params
# thumbnail: "img/placeholder.png" # Thumbnail image
# lead: "Example lead - highlighted near the title" # Lead text
# comments: false # Enable Disqus comments for specific page
# sidebar: "right" # Enable sidebar (on the right side) per page
# widgets: # Enable sidebar widgets in given order per page
#   - "search"
#   - "recent"
#   - "taglist"
---



# Solve NPM ERR! code 128

### An error is reported after NPM install
```
npm ERR! Error while executing:
npm ERR! C:\Program Files\Git\cmd\git.EXE ls-remote -h -t git://github.com/adobe-webplatform/eve.git
npm ERR!
npm ERR! fatal: unable to connect to github.com:
npm ERR! github.com[0: 20.205.243.166]: errno=Unknown error
npm ERR!
npm ERR!
npm ERR! exited with error code: 128

npm ERR! A complete log of this run can be found in:
npm ERR!     C:\Users\kr\AppData\Roaming\npm-cache\_logs\2022-06-24T03_31_32_687Z-debug.log
```

### Solve:

```
git config --global url."https://".insteadOf git://

npm cache clean --force

npm install
```

