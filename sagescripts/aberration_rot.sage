# Get dipole magnetic field
load('Vrot.sage')

coseta = (Brot_norm.dot_product(Be_rot/be))
coseta_mag = obs2mag_scalar(coseta, al, 0)
coseta_sph = xyz2sph(coseta_mag, r, th, si)

#coseta_taylor = taylor(coseta_sph, th, 0, 2)
