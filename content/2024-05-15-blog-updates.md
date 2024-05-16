---
title: Blog Updates
author: tinjamin
date: 2024-05-15
tags:
---

Hey there! It has been quite a while... Nearly a year since my last post, and
as I'm sure you can see, the blog has changed quite a bit. Indeed, the design
has become simpler, and I did that on purpose. I found that managing the CSS of
the previous version of the blog was a bit of a hassle. Moreover, being that
this blog is my first fully self-designed/programmed blog, the previous version
did not account for different screensizes...

Put differently: I was (and still am) a noob and did not design my blog to be
responsive. Thus, this time around while giving the blog a new look, I took
the additional step of making it responsive. I am not quite sure how well it
turned out, but I am sure that if it's broken, I will find out soon enough.

However, the majority of the time during this maintenance/upgrade was actually
spent on the backend. Previously, the blog required python, python-markdown,
npm, etc. to convert from markdown to html and generate the posts. Although a
lot of the heavy lifting was done by the converting program, I still had to
manually update the index every time I released a post, which was never...

Now, however, thanks to pnutzh4x0r and the contributors of the NDlug blog
project, I was able to transition to an entirely different system. This one
requires only pandoc and a Makefile. If I am being completely honest, I have
yet to fully understand the Makefile and the `build-index.sh` script that is
used. That being said, the gist of the workflow is as follows:

1. Scan `content/*.md` for the markdown files
2. Convert the markdown files to html using Pandoc and a post html template
3. Feed the location of all the generated html files to `build-index.sh` which
   generates a linked bullet list to the files in html
4. The html linked bullet list is inserted into the `index.html` template via
   sed

This fully automates the conversion from markdown to html along with updating
the index. Hopefully, this new workflow will encourage me to post more because
at this point, it is just typing in a markdown file, and I am not sure what
else I can do to make this process more seamless :}
