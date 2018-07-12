load('V.sage')

Be_aligned = Be(ph=0,al=0).simplify_trig()
Be_aligned_sph = Be_aligned(x = r*cos(si)*sin(th), y = r*sin(si)*sin(th), z = r*cos(th)).simplify_trig()
