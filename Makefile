IMAGES = images/pulsarangles.png \
		 images/curvature-no-rotation.png \
		 images/curvature-with-rotation.png

formulae.pdf: formulae.tex biblio.bib $(IMAGES)
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

images/%.png:
	$(MAKE) -C $(dir $@)
