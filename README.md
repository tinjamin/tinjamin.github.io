# Dependencies

* `pandoc`

## Creating a New Blog Post

To write a new blog entry do the following:

1. Create a markdown file in `content/`
    * The markdown file should have a header as follows:
        
```
---
title:
author:
date:
tags:
---
```

2. Enter `make` in the root directory and everything should be created

To preview the blog, make sure that you are in the root directory of the blog
and use `$ python3 -m http.server --directory docs`. For a faster local http
server, you can install `miniserve` and run the following command **inside the
`docs/` directory**: `$ miniserve --index index.html`.

# Project Structure

```
.
├── Makefile
├── README.md
├── content
│   ├── 2023-06-16-first-post.md
│   ├── 2023-06-27-rules-to-teach-your-son.md
│   └── 2024-05-15-blog-updates.md
├── docs
│   ├── assets
│   │   ├── img
│   │   └── style
│   │       ├── index.css
│   │       ├── navbar.css
│   │       └── post.css
│   ├── index.html
│   └── posts
│       ├── 2023-06-16-first-post.html
│       ├── 2023-06-27-rules-to-teach-your-son.html
│       └── 2024-05-15-blog-updates.html
├── templates
│   ├── index.html
│   └── post.html
└── util
    └── build-index.sh
```

## Understanding Project Structure

The `content/` directory contains all of the markdown file.

The `docs/` directory contains the html files of the markdown content along
with the `assets/` directory which stores the `img/` and `styles/` directory.

The `templates/` directory contains all of the templates that Pandoc utilizes
when converting from markdown to html.

The `util/` directory contains the script that generates the html listing of
posts for `docs/index.html`.
