load('A.sage')

V = V_rot(t=0)

VxA = V.cross_product(A)

ka = VxA.norm()/(be*c)^3

ka_mag = obs2mag_scalar(ka, al, 0)
ka_sph = xyz2sph(ka_mag, r, th, si)

ka_taylor = taylor(ka_sph, th, 0, 1)
