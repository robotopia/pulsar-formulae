load('Adip.sage')
load('Vdip.sage')

# The polarisation angle is what we get when we
#   1) construct a reference vector that is perpendicular to v
#   2) measure the angle between the constructed vector and the acceleration
#      vector
# The reference vector need only be consistently defined, and arguably one of
# the simplest is VxZ/|VxZ|.
# Therefore, we have:
#    cos PA = A.(VxZ)/|VxZ|

print("Calculating normalised acceleration...")
Alen = A.norm()
Anorm = A / Alen

print("Calculating V x Z (also normalised)")
VxZ = Be.cross_product(zhat).simplify_trig()
VxZlen = VxZ.norm().simplify_trig()

print("Calculating cos(PA)...")
cosPA = Anorm.dot_product(VxZ)/VxZlen
cosPA_mag = obs2mag_scalar(cosPA, al, 0)
cosPA_sph = xyz2sph(cosPA_mag, r, th, si)

