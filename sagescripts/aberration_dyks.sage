load('Bdip_inclined.sage')

var('rL si th')

Ph = vector([-y,x,0])
rho = sqrt(x^2+y^2)

Be = Ph/rL

be = Be.norm()
ga = sqrt(1/(1-be^2)).simplify_trig()

Kp_norm = Bnorm

B_dot_Kp = Be.dot_product(Kp_norm).simplify_trig()

Knorm = (Kp_norm + (ga+(ga-1)*B_dot_Kp/be^2)*Be)/(ga*(1 + B_dot_Kp))
