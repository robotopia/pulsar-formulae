formulae.pdf: formulae.tex images/pulsarangles.png
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<


