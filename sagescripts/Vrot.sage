# Get dipole magnetic field
load('Brot.sage')

det = var('det')
c   = var('c')
R   = var('R')
rL  = var('rL')
be  = var('be')

Om = c/rL
#be = sqrt(1 - 1/ga^2)
#be = 1

assume(det,'real')
assume(rh,'real')
assume(c,'real')
assume(c > 0)

Ph = vector([-y,x,0])
rh = sqrt(x^2+y^2)
Ph_dot_Bnorm = Ph.dot_product(Brot_norm)
det = sqrt(Om^2*Ph_dot_Bnorm^2 - (rh^2*Om^2-c^2*be^2))
VBpos = -Om*Ph_dot_Bnorm + det
VBneg = -Om*Ph_dot_Bnorm - det
Vpos = VBpos*Brot_norm + Om*Ph
Vneg = VBneg*Brot_norm + Om*Ph

# Declare Vpos to be the one we're interested in
Vrot = Vpos
Be_rot = Vrot / c
