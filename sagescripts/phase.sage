load('retardation.sage')

sinphase = sin(-atan2(Be[1],Be[0]))
sinphase_mag = obs2mag_scalar(sinphase, al, 0)
sinphase_sph = xyz2sph(sinphase_mag, r, th, si).simplify_trig()

sinphase_taylor = taylor(sinphase_sph, th, 0, 2)
