load('Adip.sage')

V = V_t(t=0)

Alen = A.norm()

ka = Alen/c^2

ka_mag = obs2mag_scalar(ka, al, 0)
ka_sph = xyz2sph(ka_mag, r, th, si)

#ka_taylor = taylor(ka_sph, th, 0, 1)
