# Get dipole magnetic field
load('Vdip.sage')

cosGamma = mu(mu0=1,ph=0).dot_product(Be/be).simplify_trig()
cosGamma_mag = obs2mag_scalar(cosGamma, al, 0)
cosGamma_sph = xyz2sph(cosGamma_mag, r, th, si).simplify_trig()
cosGamma_taylor = taylor(cosGamma_sph, th, 0, 2)

sinGamma_sph = sin(acos(cosGamma_sph))
sinGamma_taylor = taylor(sinGamma_sph, th, 0, 2)
