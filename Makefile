SHELL=/bin/bash -O extglob
SAMPLE_NAME=sample

all: $(SAMPLE_NAME).pdf

%.pdf: %.tex
	pdflatex --shell-escape $<
	pdflatex --shell-escape $<

clean:
	rm -rf $(SAMPLE_NAME).!(tex) svg-inkscape texput.log
