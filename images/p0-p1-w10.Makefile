
# Fit a plane to the data in log-log-log space, and plot!
p0-p1-w10.png: p0-p1-w10.py p0-p1-w10.dat
	python $^

# Get the catalogue p0, p1, and w10 measurements from ATNF
p0-p1-w10.dat:
	psrcat -x -c "p0 p1 w10" | awk 'BEGIN {print "# P0 P1 W10";} {print $$1, $$4, $$7}' | sed 's/\*/nan/g' > $@

