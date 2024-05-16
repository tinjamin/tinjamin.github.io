INDEX = docs/index.html
MD = $(shell ls content/*.md)
POSTS = $(MD:content/%.md=docs/posts/%.html)

all: $(POSTS) $(INDEX) $(FEED)

print:
	@echo $(POSTS)

docs/index.html: templates/index.html $(POSTS)
	@echo "Populating $@ with posts list..."
	@sh util/build-index.sh $< $@

docs/posts/%.html: content/%.md templates/post.html
	@echo "Converting $< to $@..."
	@pandoc -s --template=templates/post.html -f markdown -t html $< -o $@

clean:
	@echo "Nuking posts and (populated) index..."
	@rm -f $(shell ls docs/posts/*) $(INDEX)
	@# using $(POSTS) wouldn't catch renames

deploy:
	# TODO

.PHONY: all clean deploy
