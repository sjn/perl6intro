# vim: noexpandtab
SOURCES = $(wildcard *.adoc)
HTML-TARGETS = $(patsubst %.adoc,%.html,$(SOURCES))
PDF-TARGETS = $(patsubst %.adoc,%.pdf,$(SOURCES))

all: html pdf

html: $(HTML-TARGETS)

pdf: $(PDF-TARGETS)

$(HTML-TARGETS): $(SOURCES)
	asciidoctor ${@:.html=.adoc}

$(PDF-TARGETS): $(SOURCES)
	asciidoctor-pdf ${@:.pdf=.adoc}

clean:
	rm -f $(HTML-TARGETS) $(PDF-TARGETS)

asciidoctor:
	sudo apt install asciidoctor ruby-pygments.rb

asciidoctor-pdf:
	sudo gem install asciidoctor-pdf

.PHONY: clean
