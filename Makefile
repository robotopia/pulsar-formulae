IMAGES = images/pulsarangles.png \
				 images/curvature-no-rotation.png \
				 images/curvature-with-rotation.png \
				 images/braking_index.png \
				 images/beam_width_vs_height.png \
				 images/min_height_ulp.png \
				 images/p0-p1-w10.png

formulae.pdf: formulae.tex biblio.bib $(IMAGES)
	pdflatex $<
	bibtex $(basename $<)
	pdflatex $<
	pdflatex $<

images/%.png:
	$(MAKE) -C $(dir $@)

clean:
	$(RM) formulae.bbl formulae.aux formulae.blg
