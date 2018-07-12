load('coordinates.sage')
load('pulsarangles.sage')
load('mag2obs.sage')

mu0 = var('mu0')  # "mu nought", the magnetic field strength
mu = mu0*mag2obs(al,ph)*zhat

Bdip = 1/r^3 * (3*mu.dot_product(rhat)*rhat - mu)
