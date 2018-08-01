load('Adip.sage')
load('Vdip.sage')

# The polarisation angle is what we get when we
#   1) construct a reference vector that is perpendicular to v
#   2) measure the angle between the constructed vector and the acceleration
#      vector
# The reference vector need only be consistently defined, and arguably one of
# the simplest is V x z.
# Therefore, we have:
#    cos PA = A.(V x z)

Alen = A.norm()
Anorm = A / Alen

VxZ = Be.cross_product(zhat)
cosPA = Anorm.dot_product(VxZ/VxZ.norm())
cosPA_mag = obs2mag_scalar(cosPA, al, 0)
cosPA_sph = xyz2sph(cosPA_mag, r, th, si)

