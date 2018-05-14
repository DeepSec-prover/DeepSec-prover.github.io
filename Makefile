PANDOC = pandoc
IFORMAT = markdown
FLAGS = --standalone --toc --toc-depth=2 --mathjax=$(MATHJAX)
STYLE = css/style.css

ifdef MATHJAX_LOCAL
  MATHJAX = ${MATHJAX_LOCAL}
else
  MATHJAX ?= "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
endif

TEMPLATE_HTML = template/template.html
TEMPLATE_TEX = template/template.latex

SRC = $(sort $(wildcard manual/*.md)) index_src.md manual.md
OBJ = $(subst .md,.html,$(SRC))

all: $(OBJ)

manual/%.html: manual/%.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<

%.html: %.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<

clean:
	-rm -f manual/*.html *.html
