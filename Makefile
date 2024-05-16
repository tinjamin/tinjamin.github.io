INDEX = docs/index.html
FULL_MD = $(shell ls content/*.md)
POSTS = $(FULL_MD:content/%.md=docs/posts/%.html)
MD = $(notdir $(FULL_MD))

all: $(POSTS) $(INDEX)

print:
	@echo $(MD)

docs/index.html: templates/index.html $(POSTS)
	@echo "Populating $@ with posts list..."
	@sh util/build-index.sh $< $@

docs/posts/%.html: content/%.md templates/post.html
	@echo "Converting $< to $@..."
	@pandoc -s --template=templates/post.html -f markdown -t html $< -o $@
	@sh util/next-prev-fn.sh "$(MD)" "$(notdir $<)"

clean:
	@echo "Nuking posts and (populated) index..."
	@rm -f $(shell ls docs/posts/*) $(INDEX)
	@# using $(POSTS) wouldn't catch renames

deploy:
	# TODO

.PHONY: all clean deploy
