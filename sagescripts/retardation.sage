load('Vdip.sage')

dph_ret = -(rhat*r).dot_product(Be/be)/rL

dph_ret_mag = obs2mag_scalar(dph_ret, al, 0)
dph_ret_sph = xyz2sph(dph_ret_mag, r, th, si).simplify_trig()

#dph_ret_taylor = taylor(dph_ret_sph, th, 0, 2)

