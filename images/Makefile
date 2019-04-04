curvature-plots: curvature-no-rotation.png curvature-with-rotation.png

curvature-%.png: curvature-%.gpi
	gnuplot -e "set terminal pngcairo enhanced size 600,550 font ',14'; set output '$@'" $<

