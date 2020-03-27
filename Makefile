
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
TEMPLATE_LATEX = template/template.tex

SRC = $(sort $(wildcard manual/*.md)) index_src.md manual.md
OBJ = $(subst .md,.html,$(SRC))
SRCPDF = manual.tex manual/install.tex manual/tutorial.tex manual/advanced.tex manual/grammar.tex manual/command.tex template/main.tex 

all: $(OBJ) DeepSec-manual.pdf

DeepSec-manual.pdf: $(SRCPDF)
	pdflatex template/main.tex
	biber main
	pdflatex template/main.tex
	pdflatex template/main.tex
	mv main.pdf DeepSec-manual.pdf
	rm main.*

manual/%.html: manual/%.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<

manual/%.tex: manual/%.md
	$(PANDOC) \
		--top-level-division=chapter\
	  --bibliography=biblio.bib\
		--biblatex\
	  -t latex -o $@ $<

%.tex: %.md
	$(PANDOC) \
		--top-level-division=chapter\
	  --bibliography=biblio.bib\
		--biblatex\
	  -t latex -o $@ $<

%.html: %.md
	$(PANDOC) \
	  --template $(TEMPLATE_HTML)\
		--bibliography=biblio.bib\
		--csl=ieee.csl\
	  -t html -o $@ $<

template/main.tex: template/main.md
	$(PANDOC) $(FLAGS) template/main.md -o template/main.tex


clean:
	-rm -f manual/*.html *.html *.tex manual/*.tex template/main.tex
