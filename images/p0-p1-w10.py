import sys
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# A 2D plane (for curve_fit)
def plane(X, A, B, C):
    x = X[0]
    y = X[1]
    return A*x + B*y + C


def main():

    datafile = sys.argv[1]

    # Load the data
    data = np.loadtxt(datafile)

    logP0s, logP1s, logW10s = np.log10(data).transpose()

    # Fit a plane to the data
    popt, pcov = curve_fit(plane, [logP0s, logP1s], logW10s, nan_policy='omit', p0=[1, 0, 1.5])
    a, b, c = popt
    ae, be, ce = np.sqrt(np.diag(pcov))
    print(f'W10 = (P0/s)^A × (P1)^B × 10^C ms')
    print(f'a = {a:.2f} ± {ae:.2f}')
    print(f'b = {b:.2f} ± {be:.2f}')
    print(f'c = {c:.2f} ± {ce:.2f}')

    # Plot the data
    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    ax.scatter(logP0s, logP1s, logW10s)

    # Plot the fitted plane
    xs = np.linspace(-3.5, 1, 9)
    ys = np.linspace(-22, -9, 9)
    X, Y = np.meshgrid(xs, ys)
    Z = plane([X, Y], *popt)

    ax.plot_wireframe(X, Y, Z, color='k')

    ax.set_xlabel('$\\log_{10}(P/s)$')
    ax.set_ylabel('$\\log_{10}(\\dot{P})$')
    ax.set_zlabel('$\\log_{10}(W_{10}/ms)$')

    plt.tight_layout()
    plt.savefig('p0-p1-w10.png')

if __name__ == '__main__':
    main()
