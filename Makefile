PANDOC = pandoc --syntax-definition deepsec.xml
IFORMAT = markdown
# FLAGS = --standalone --toc --toc-depth=2 --mathjax=$(MATHJAX)
FLAGS = --standalone --mathjax=$(MATHJAX) 
# STYLE = style.css

ifdef MATHJAX_LOCAL
  MATHJAX = ${MATHJAX_LOCAL}
else
  MATHJAX ?= "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
endif

TEMPLATE_HTML = template/template.html

all: index.html

index.html: index_src.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<



clean:
	-rm -f *.html


