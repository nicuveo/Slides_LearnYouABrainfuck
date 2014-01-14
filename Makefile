##
## Makefile for haskell_pres
## Made by nicuveo <crucuny@gmail.com>
##


## GENERAL INFOS

IMG_DIR   = ./img/

PDF       = brf.pdf
PDF_DEPS  = brf.tex theme.tex $(wildcard img/*)
PDF_CMD   = xelatex
PDF_FLAGS = -interaction nonstopmode

TARBALL   = brf

CLEAN = '*~' '\#*' '.\#*' '.DS_Store' '*.log' '*.aux' '*.toc' '*.nav' '*.out' '*.snm' '*.vrb' '*.o' '*.hi'




## OUTPUT

all: $(PDF);

$(PDF): $(PDF_DEPS)



# CLEANING

clean:
	for f in $(CLEAN) ; do find . -name "$$f" | xargs rm -f ; done

distclean: clean
	rm -f $(TARBALL) $(PDF) $(EXE)

dist tar tarball: distclean
	tar --transform 's,^,$(TARBALL)/,' -cvjf $(TARBALL).tar.bz2 --exclude=".svn" *



## SPECIFIC

%.pdf: %.tex
	$(PDF_CMD) $(PDF_FLAGS) $*.tex && $(PDF_CMD) $(PDF_FLAGS) $*.tex

%.pdf:
	@echo "Unable to find $*.tex, aborting."
	@exit 2



## SPECIALS

.PRECIOUS: %.pdf ;
