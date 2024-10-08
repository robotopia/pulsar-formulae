var('x y z')    # Cartesian coordinates
var('r th ph')  # Spherical coordinates
var('rh')       # Cylindrical coordinates

assume(x,'real')
assume(y,'real')
assume(z,'real')
assume(r,'real')
assume(th,'real')
assume(ph,'real')
assume(rh,'real')

assume(r > 0)
assume(rh > 0)

xhat = vector([1,0,0])
yhat = vector([0,1,0])
zhat = vector([0,0,1])

rhat = vector([x/r, y/r, z/r])
phhat = vector([-y/rh, x/rh, 0])

def xyz2sph(V,r,th,ph):
    return V(x = r*cos(ph)*sin(th), y = r*sin(ph)*sin(th), z = r*cos(th))
