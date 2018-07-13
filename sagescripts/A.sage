load('Bdip.sage')

var('det c R rL be t')
Om = c/rL

Bdip_rot  = Bdip(ph = Om*t)
Blen_rot  = Bdip_rot.norm()
Bnorm_rot = (Bdip_rot/ Blen_rot)(mu0=1) # The mu0's should cancel anyway


# Reproduce the velocity field

#be = sqrt(1 - 1/ga^2)
#be = 1

assume(det,'real')
assume(rh,'real')
assume(c,'real')
#assume(c > 0)
assume(r,'real')
#assume(r >= 0)
assume(rL,'real')
#assume(rL >= 0)
assume(x,'real')
assume(y,'real')
assume(z,'real')
assume(t,'real')
assume(al,'real')

Ph = vector([-y,x,0])
rh = sqrt(x^2+y^2)
Ph_dot_Bnorm = Ph.dot_product(Bnorm_rot)
det = sqrt(Om^2*Ph_dot_Bnorm^2 - (rh^2*Om^2-c^2*be^2))
VBpos_rot = -Om*Ph_dot_Bnorm + det
V_rot = VBpos_rot*Bnorm_rot + Om*Ph

# V_rot is expressed in x, y, z, t, AND r. But r is a function of
# x, y, and z. So the partial derivative of V_rot with x, for example, is
#
#   dV(x,y,z)/dx = dV(x,y,z,r)/dx + dV(x,y,z,r)/dr * dr/dx
#
# Now, dr/dx = x/r, and similarly for y and z. Therefore
#
#   A = dV/dt + Vx (dV/dx + dV/dr x/r) +
#               Vy (dV/dy + dV/dr y/r) +
#               Vz (dV/dz + dV/dr z/r)

dV_dx = diff(V_rot, x)
dV_dy = diff(V_rot, y)
dV_dz = diff(V_rot, z)
dV_dr = diff(V_rot, r)
dV_dt = diff(V_rot, t)

A_rot = dV_dt + V_rot[0]*(dV_dx + dV_dr*x/r) + \
                V_rot[1]*(dV_dy + dV_dr*y/r) + \
                V_rot[2]*(dV_dz + dV_dr*z/r)

A = A_rot(t=0)
