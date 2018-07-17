var('t om tau')
var('c')
function('rh Z th_rot th_B s')

rL = c/om

th_rot(t) = om*t

# Particle motion
x = rh(tau) #*cos(th_rot(t) + th_B(t))
y = 0 #rh(t)*sin(th_rot(t) + th_B(t))
#z = Z(t)

# Magnetic field
Bx = rh(t)*cos(th_B(t))
By = rh(t)*sin(th_B(t))
#Bz = Z(t)

#B = vector([Bx, By, Bz]) # 3D
B = vector([Bx, By]) # 2D

#V = vector([diff(x,t), diff(y,t), diff(z,t)]) # 3D
V = vector([diff(x,t), diff(y,t)]) # 2D

Khatp = (V/V.norm()).simplify_trig()

#Vrot = om*vector([-y, x, 0]) # 3D
Vrot = om*vector([-rh(t)*sin(th_rot(t)), rh(t)*cos(th_rot(t))]) # 2D
Brot = -Vrot/c

brot = Brot.norm().simplify_trig()
g = 1/sqrt(1 - brot^2)

bK = Brot.dot_product(Khatp).simplify_trig()

Khat = (Khatp + (g + (g - 1)*bK/brot^2)*Brot) / (g*(1 + bK))

Khat_r  = Khat.norm()#.simplify_trig()

Khat_rh = sqrt(Khat[0]^2 + Khat[1]^2)#.simplify_trig()
Khat_th = atan2(Khat[1],Khat[0])#.simplify_trig()
#Khat_Z  = Khat[2].simplify_trig()

BK = B.dot_product(Khat).simplify_trig()
