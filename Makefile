formulae.pdf: formulae.tex biblio.bib images/pulsarangles.png
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<


