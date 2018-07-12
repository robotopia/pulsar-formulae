load('3Drotation.sage')

def mag2obs(al,ph): return rotZ(ph)*rotY(al)
def obs2mag(al,ph): return rotY(-al)*rotZ(-ph)

def obs2mag_scalar(S,al,ph):
    Xp = mag2obs(al,ph)*vector([x,y,z])
    return S(x=Xp[0], y=Xp[1], z=Xp[2])

def obs2mag_field(V,al,ph):
    Xp = mag2obs(al,ph)*vector([x,y,z])
    return obs2mag(al,ph)*V(x=Xp[0], y=Xp[1], z=Xp[2])
