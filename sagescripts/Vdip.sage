# Get dipole magnetic field
load('Bdip_inclined.sage')

det = var('det')
c   = var('c')
R   = var('R')
rL  = var('rL')
be  = var('be')

assume(c,'real')
assume(R,'real')
assume(rL,'real')

assume(c > 0)
assume(R > 0)
assume(rL > 0)

Om = c/rL
#be = sqrt(1 - 1/ga^2)
be = 1

assume(det,'real')
assume(rh,'real')
assume(c,'real')
assume(c > 0)

Ph = vector([-y,x,0])
rh = sqrt(x^2+y^2)
Ph_dot_Bnorm = Ph.dot_product(Bnorm)
det = sqrt(Om^2*Ph_dot_Bnorm^2 - (rh^2*Om^2-c^2*be^2))
VBpos = -Om*Ph_dot_Bnorm + det
VBneg = -Om*Ph_dot_Bnorm - det
Vpos = VBpos*Bnorm + Om*Ph
Vneg = VBneg*Bnorm + Om*Ph

# Declare Vpos to be the one we're interested in
V = Vpos
Be = V / c

V_mag = obs2mag_scalar(V, al, 0)
V_sph = xyz2sph(V_mag, r, th, si)

