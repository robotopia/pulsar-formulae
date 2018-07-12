# Get dipole magnetic field
load('V.sage')

coszeta = (Be[2]/be).simplify_trig() # Choosing the z-component = dotting with zhat
coszeta_mag = obs2mag_scalar(coszeta, al, 0)
coszeta_sph = xyz2sph(coszeta_mag, r, th, si).simplify_trig()
coszeta_taylor = taylor(coszeta_sph, th, 0, 1)

sinzeta_sph = sin(acos(coszeta_sph))
sinzeta_taylor = taylor(sinzeta_sph, th, 0, 1)

# Taylor expansion about r = 0

coszeta_taylor_r = taylor(coszeta_sph, r, 0, 1)
sinzeta_taylor_r = taylor(sinzeta_sph, r, 0, 1)
