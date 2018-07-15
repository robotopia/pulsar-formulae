var('t om')
var('c')
function('rh Z')

rL = c/om

# Particle motion:
th = om*t

x = rh(t)*cos(th)
y = rh(t)*sin(th)
z = Z(t)

V = vector([diff(x,t), diff(y,t), diff(z,t)])

Khatp = (V/V.norm()).simplify_trig()

Vrot = om*vector([-y, x, 0])
Brot = -Vrot/c

brot = Brot.norm().simplify_trig()
g = 1/sqrt(1 - brot^2)

bk = Brot.dot_product(Khatp).simplify_trig()

Khat = (Khatp + (g + (g - 1)*bk/brot^2)*Brot) / (g*(1 + bk))

Khat_r  = Khat.norm().simplify_trig()

Khat_rh = sqrt(Khat[0]^2 + Khat[1]^2).simplify_trig()
Khat_th = atan2(Khat[1],Khat[0]).simplify_trig()
Khat_Z  = Khat[2].simplify_trig()
