
load('coordinates.sage')
load('pulsarangles.sage')
load('mag2obs.sage')

mu0 = var('mu0')  # "mu nought", the magnetic field strength
mu = mu0*mag2obs(al,ph)*zhat

# Variables
var('c Om rL PH') # PH is the retarded Dyks (Om*t - rn), or Arendt's ((r-r*)/rL)
#rL = c/Om
k = 1/rL

mperp = mu0*sin(al)
mz    = mu0*cos(al)

Bpart1 = mperp*((xhat - rhat*(rhat.dot_product(xhat)))*(k^2*cos(PH)/r) + (3*rhat*(xhat.dot_product(rhat)) - xhat)*(k*r*sin(PH) + cos(PH))/r^3)
Bpart2 = mperp*((rhat*(rhat.dot_product(yhat)) - yhat)*(k^2*sin(PH)/r) + (3*rhat*(yhat.dot_product(rhat)) - yhat)*(k*r*cos(PH) - sin(PH))/r^3)
Bpart3 = mz/r^3 * (3*rhat*(rhat.dot_product(zhat)) - zhat)

Brot = Bpart1 + Bpart2 + Bpart3

Brot_len = Brot.norm().simplify_trig()
Brot_norm = Brot / Brot_len
