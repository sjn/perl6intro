# vim: noexpandtab
SOURCES = $(wildcard *.adoc)
TARGETS = $(patsubst %.adoc,%.pdf,$(SOURCES))

all: $(TARGETS)

$(TARGETS): $(SOURCES)
	asciidoctor-pdf ${@:.pdf=.adoc}

clean:
	rm -f $(TARGETS)

.PHONY: clean
