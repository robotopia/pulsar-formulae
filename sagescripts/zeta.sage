# Get dipole magnetic field
load('Vdip.sage')

coszeta = (Be[2]/be).simplify_trig() # Choosing the z-component = dotting with zhat
coszeta_mag = obs2mag_scalar(coszeta, al, 0)
coszeta_sph = xyz2sph(coszeta_mag, r, th, si).simplify_trig()
coszeta_taylor = taylor(coszeta_sph, th, 0, 1)

#sinzeta_sph = sin(acos(coszeta_sph))
#sinzeta_taylor = taylor(sinzeta_sph, th, 0, 1)

# Taylor expansion about r = 0

#coszeta_taylor_r = taylor(coszeta_sph, r, 0, 1)
#sinzeta_taylor_r = taylor(sinzeta_sph, r, 0, 1)

# For a fixed s, taking a Taylor expansion around r=0, then solving for r:
load('footpoints.sage')
var('a')
assume(a,'real')
assume(a > 0)
hgt = solve((taylor(fixed_s_elim_th(coszeta_sph),r,0,1)-cos(ze))(r=a^2),a)[0].rhs()^2
