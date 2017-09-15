all: csaw.pdf output.pdf compile.tar.gz

compile.tar.gz: csaw.tex 
	tar -czf $@ $< plots-ug/ Bioconductor2.sty

csaw.pdf: csaw.tex
	pdflatex $<
	bibtex csaw
	pdflatex $<
	pdflatex $<

output.pdf: csaw.pdf
	Rscript transferUG.R $< $@
