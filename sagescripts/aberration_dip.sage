# Get dipole magnetic field
load('Vdip.sage')

coseta = (Bnorm.dot_product(Be/be)).simplify_trig()
coseta_mag = obs2mag_scalar(coseta, al, 0)
coseta_sph = xyz2sph(coseta_mag, r, th, si).simplify_trig()

coseta_taylor = taylor(coseta_sph, th, 0, 2)

sineta_sph = sin(acos(coseta_sph))
sineta_taylor = taylor(sineta_sph, th, 0, 2)
