load('zeta.sage')

r_solved = solve(cos(ze) == coszeta_taylor_r, r)[0].simplify_trig()
