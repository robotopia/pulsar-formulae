# Get dipole magnetic field
load('V.sage')

cosGamma = (Be[2]/be).simplify_trig() # Choosing the z-component = dotting with zhat
cosGamma_mag = obs2mag_scalar(cosGamma, al, 0)
cosGamma_sph = xyz2sph(cosGamma_mag, r, th, si).simplify_trig()

cosGamma_taylor = taylor(cosGamma_sph, th, 0, 2)
