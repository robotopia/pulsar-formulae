TARGETS = curvature-no-rotation.png \
		  curvature-with-rotation.png \
		  polarisation_limiting_radius_ppdot.png \
		  braking_index.png \
			beam_width_vs_height.png \
			min_height_ulp.png

all: $(TARGETS)

curvature-%.png: curvature-%.gpi curvature-common.gpi
	gnuplot -e "set terminal pngcairo enhanced size 600,550 font ',14'; set output '$@'" $<

polarisation_limiting_radius_ppdot.png: polarisation_limiting_radius_ppdot.gpi
	gnuplot -e "set terminal pngcairo enhanced size 1000,800; set output '$@'" $<

# Fit a plane to the data in log-log-log space, and plot!
p0-p1-w10.png: p0-p1-w10.py p0-p1-w10.dat
	python $^

# Get the catalogue p0, p1, and w10 measurements from ATNF
p0-p1-w10.dat:
	psrcat -x -c "p0 p1 w10" | awk 'BEGIN {print "# P0 P1 W10";} {print $$1, $$4, $$7}' | sed 's/\*/nan/g' > $@

%.png: %.gpi
	gnuplot $<

