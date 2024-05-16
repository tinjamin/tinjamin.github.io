#!/bin/sh

MD=$(echo "$1" | sed -E "s/.md/.html/g")
curr_file=$(echo "$2" | sed -E "s/.md/.html/")

result="$(echo "$MD" | tr ' ' '/' | sed -E "s/\/?$curr_file\/?/ $curr_file /" \
        | grep -Eo --color "[^/]*$curr_file[^/]*" | sed -E "s/^ //")"

prev_file="$(echo "$result" | cut -d" " -f1)"

if [ $(echo "$result" | wc -w) -ne 3 ]; then
    if [ "$prev_file" = "$curr_file" ]; then
        prev_file=""
        next_file="$(echo "$result" | cut -d" " -f2)"
    fi
else
    next_file="$(echo "$result" | cut -d" " -f3)"
fi

sed -E -i "s/\{\{prev-post\}\}/$prev_file/g" docs/posts/$curr_file
sed -E -i "s/\{\{next-post\}\}/$next_file/g" docs/posts/$curr_file
