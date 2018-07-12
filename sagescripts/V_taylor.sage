load('V.sage')

# Taylor expansion of the V field near the magnetic axis (i.e. around theta = 0)
# First, transform the V field to magnetic frame coordinates

Be_mag = obs2mag_field(Be,al,0)
Be_mag_sph = xyz2sph(Be_mag,r,th,si)

Be_taylor_x = taylor(Be_mag_sph[0],th,0,1)
Be_taylor_y = taylor(Be_mag_sph[1],th,0,1)
Be_taylor_z = taylor(Be_mag_sph[2],th,0,1)

# Simplify:
# The x component has no order 0 term, so
Be_taylor_x = Be_taylor_x.simplify_trig()
Be_taylor_y = Be_taylor_y.coefficients(th)[0][0].simplify_trig() + Be_taylor_y.coefficients(th)[1][0].simplify_trig()*sin(th)
Be_taylor_z = Be_taylor_z.coefficients(th)[0][0].simplify_trig() + Be_taylor_z.coefficients(th)[1][0].simplify_trig()*sin(th)
