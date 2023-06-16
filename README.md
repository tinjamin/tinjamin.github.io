# Project Tree

```
.
├── content
│   ├── images
│   ├── pages
│   │   ├── about.html
│   │   ├── archive.html
│   │   └── index.html
│   └── posts
│       └── first-post.html
├── markdown
│   └── first-post.md
├── scripts
│   └── new-post.sh
└── theme
    ├── static
    │   ├── blog-post.css
    │   ├── navbar.css
    │   └── pages.css
    └── templates
        └── blog-post-template.html
```

# Dependencies

* `python`
* `python-markdown`
* `nvim`

# Quickstart Guide

To begin blogging, create a file in the `markdown/` directory. Use markdown to
structure your blog. Then, within the `markdown/` directory, enter the
following command (note that your environment must have the `python-markdown`
package in order for the script to execute correctly)

```sh
$ sh ../new-post.sh <blog markdown file>
```

This command will generate a corresponding HTML file with the same filename as
the one passed to the script and can be located in the `posts/` directory. Then,
update `archive.html` to link the newly created post.

# Understanding Project Structure

The `content/` directory contains all of the HTML files that will be used to
render the blog site. Inside the `content/` directory is the `images/`, `pages/`,
and `posts/` directory. The `images/` directory should contain the images
required for each posts. Optionally, each post should have a corresponding image
directory inside of the `images/` directory for easy management. The `pages/`
directory contains the three HTML file for the three pages that can be accessed
by the user. Finally, the `posts/` directory contains the HTML converted files
corresponding to each post.

The `markdown/` directory contains the markdown versions of the posts before
they are converted into HTML.

The `scripts/` directory contains the script used to convert the markdown to
HTML. The script does this by copying the `blog-post-template.html` in the
`theme/templates/` directory. Then, it fills the template by reading in the
converted HTML posts stored in a temporary file.

The `theme/` directory stores the `static/` and `templates/` directory. The
`static/` directory contains the CSS files that customizes the appearance of
the various types of pages within the site. The `templates/` directory contains
templates that can be reused to create posts so that they retain consistent
formatting and appearance.
