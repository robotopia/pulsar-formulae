#!/bin/bash

# Get the catalogue p0, p1, and w10 measurements from ATNF
psrcat -x -c "p0 p1 w10" | \
    awk 'BEGIN {print "# P0 P1 W10";} {print $1, $4, $7}' > p0-p1-w10.dat

# Fit a plane to the data in log-log-log space, and plot!
python p0-p1-w10.py
