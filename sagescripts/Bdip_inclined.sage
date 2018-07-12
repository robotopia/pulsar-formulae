load('Bdip.sage')
Bdip_inclined = Bdip(ph=0).simplify_trig()
Blen          = Bdip_inclined.norm()
Bnorm         = (Bdip_inclined / Blen)(mu0=1) # The mu0's should cancel anyway
