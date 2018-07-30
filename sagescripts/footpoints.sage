load('coordinates.sage')

var('s rp')

assume(s,'real')
assume(rp,'real')
assume(rp > 0)

def fixed_s_elim_r(expr):
    return expr(r = rp*sin(th)^2/sin(s*asin(sqrt(rp/rL)))^2)

def fixed_s_elim_th(expr):
    return expr(th = asin(sqrt(r*sin(s*asin(sqrt(rp/rL)))^2/rp)))
