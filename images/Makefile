TARGETS = curvature-no-rotation.png \
		  curvature-with-rotation.png \
		  polarisation_limiting_radius_ppdot.png \
		  braking_index.png \
			beam_width_vs_height.png

all: $(TARGETS)

curvature-%.png: curvature-%.gpi curvature-common.gpi
	gnuplot -e "set terminal pngcairo enhanced size 600,550 font ',14'; set output '$@'" $<

polarisation_limiting_radius_ppdot.png: polarisation_limiting_radius_ppdot.gpi
	gnuplot -e "set terminal pngcairo enhanced size 1000,800; set output '$@'" $<

braking_index.png: braking_index.gpi
	gnuplot $<

beam_width_vs_height.png: beam_width_vs_height.gpi
	gnuplot $<
