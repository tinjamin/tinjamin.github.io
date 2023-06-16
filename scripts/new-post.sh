#!/usr/bin/sh

# Variables
TEMPLATE_PATH="../theme/templates/blog-post-template.html"
POST_PATH="../content/posts"
MARKDOWN_FILE=$1
BASENAME=$(echo $MARKDOWN_FILE | cut -d. -f 1)  # basename without extension
POST_TITLE=$(echo $BASENAME | sed -e "s/-/ /g" | sed -e "s/\b\(.\)/\u\1/g")

# Functions
format_html() {
    # append newline at the end of every line
    # indent each line by three tabs
    # surround img with <div class="picture"></div>
    nvim --headless $BASENAME.temp \
        -c ':%s/>$/>\r/g' \
        -c ':%s/^/\t\t\t/g' \
        -c ':%s/\(<p><img.*\)/<div class="picture">\r\t\t\t\t\1\r\t\t\t<\/div>/g' \
        -c 'wq'

    # formating code block
    # changing <code></code> to <pre></pre>
    # move first line of code to independent line
    # move last line of code to independent line
    nvim --headless $BASENAME.temp \
        -c ':%s/<\(\/\?\)code>/<\1pre>/g' \
        -c ':%s/\(<pre>\)\(.*\)/\1\r\t\t\t\2/g' \
        -c ':%s/\(.*\)\(<\/pre.*\)/\1\r\t\t\t\2' \
        -c 'wq'
}

# Main Execution

# copying post template to posts directory
cp $TEMPLATE_PATH $POST_PATH/$BASENAME.html

# converting markdown to html
python3 -m markdown $MARKDOWN_FILE -f $BASENAME.temp
format_html

# fill template with post content
nvim --headless $POST_PATH/$BASENAME.html \
    -c "+28" \
    -c ":r $BASENAME.temp" \
    -c ":%s/BLOG POST/$POST_TITLE" \
    -c ":26s/\(Date: \)/\1$(date +%Y.%m.%d)" \
    -c "wq"

# clean up
rm $BASENAME.temp
