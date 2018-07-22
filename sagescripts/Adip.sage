load('Bdip.sage')

var('det c R rL be t')
Om = c/rL

Bdip_t  = Bdip(ph = Om*t)
Blen_t  = Bdip_t.norm()
Bnorm_t = (Bdip_t/ Blen_t)(mu0=1) # The mu0's should cancel anyway


# Reproduce the velocity field

#be = sqrt(1 - 1/ga^2)
be = 1

assume(det,'real')

Ph = vector([-y,x,0])
rh = sqrt(x^2+y^2)
Ph_dot_Bnorm = Ph.dot_product(Bnorm_t)
det = sqrt(Om^2*Ph_dot_Bnorm^2 - (rh^2*Om^2-c^2*be^2))
VBpos_t = -Om*Ph_dot_Bnorm + det
V_t = VBpos_t*Bnorm_t + Om*Ph

# V_t is expressed in x, y, z, t, AND r. But r is a function of
# x, y, and z. So the partial derivative of V_t with x, for example, is
#
#   dV(x,y,z)/dx = dV(x,y,z,r)/dx + dV(x,y,z,r)/dr * dr/dx
#
# Now, dr/dx = x/r, and similarly for y and z. Therefore
#
#   A = dV/dt + Vx (dV/dx + dV/dr x/r) +
#               Vy (dV/dy + dV/dr y/r) +
#               Vz (dV/dz + dV/dr z/r)

dV_dx = diff(V_t, x)
dV_dy = diff(V_t, y)
dV_dz = diff(V_t, z)
dV_dr = diff(V_t, r)
dV_dt = diff(V_t, t)

A_t = dV_dt + V_t[0]*(dV_dx + dV_dr*x/r) + \
                V_t[1]*(dV_dy + dV_dr*y/r) + \
                V_t[2]*(dV_dz + dV_dr*z/r)

A = A_t(t=0)
