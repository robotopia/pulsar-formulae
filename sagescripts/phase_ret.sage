load('phase.sage')
load('retardation.sage')
load('footpoints.sage')

phase_ret = taylor(fixed_s_elim_th(asin(sinphase_sph) + dph_ret_sph),r,0,1)
