load('Vrot.sage')
load('aberration_dyks.sage')

Vrot_mag = obs2mag_field(Vrot(mu0=1), al, 0)
Vrot_sph = xyz2sph(Vrot_mag, r, th, si)

Knorm_mag = obs2mag_field(Knorm, al, 0)
Knorm_sph = xyz2sph(Knorm_mag, r, th, si)


