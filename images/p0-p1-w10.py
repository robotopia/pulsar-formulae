import numpy as np
import matplotlib.pyplot as plt

datafile = 'p0-p1-w10.dat'

# Load the data
data = np.loadtxt(datafile)

# Fit a plane to the data in log-log-log space
def plane(x, y, A, B, C):
    return A*x + B*y + C
