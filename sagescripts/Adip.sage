load('Bdip.sage')

var('det c R rL be t')

assume(c,'real')
assume(R,'real')
assume(rL,'real')

assume(c > 0)
assume(R > 0)
assume(rL > 0)

Om = c/rL

Bdip_t  = Bdip(ph = Om*t)
Blen_t  = Bdip_t.norm()
Bnorm_t = (Bdip_t/ Blen_t)(mu0=1) # The mu0's should cancel anyway


# Reproduce the velocity field

#be = sqrt(1 - 1/ga^2)
be = 1

assume(det,'real')

print("Calculating time-dependent velocity field...")
Ph = vector([-y,x,0])
rh = sqrt(x^2+y^2)
Ph_dot_Bnorm = Ph.dot_product(Bnorm_t).simplify_trig()
det = (sqrt(Om^2*Ph_dot_Bnorm^2 - (rh^2*Om^2-c^2*be^2))).simplify_trig()
VBpos_t = (-Om*Ph_dot_Bnorm + det).simplify_trig()
V_t = (VBpos_t*Bnorm_t + Om*Ph).simplify_trig()

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

print("Calculating velocity derivatives...")
print("  dV_dx...")
dV_dx = diff(V_t(t=0), x).simplify_trig()
print("  dV_dy...")
dV_dy = diff(V_t(t=0), y).simplify_trig()
print("  dV_dz...")
dV_dz = diff(V_t(t=0), z).simplify_trig()
print("  dV_dr...")
dV_dr = diff(V_t(t=0), r).simplify_trig()
print("  dV_dt...")
dV_dt = diff(V_t, t)(t=0).simplify_trig()

print("Calculating acceleration field at t=0...")
A = dV_dt + V_t[0](t=0)*(dV_dx + dV_dr*x/r) + \
            V_t[1](t=0)*(dV_dy + dV_dr*y/r) + \
            V_t[2](t=0)*(dV_dz + dV_dr*z/r)

A_mag = obs2mag_field(A, al, 0)
A_sph = xyz2sph(A_mag, r, th, si)
