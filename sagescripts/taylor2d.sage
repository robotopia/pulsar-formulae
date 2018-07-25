def taylor2d_subst_r_th(expr,r_val,th_val):
    """
    2D Taylor series, up to third order terms, of variables th and r (hard-coded).
    """
    result = []
    # First order term
    try:
        result = expr(th=th_val,r=r_val).simplify_trig()
    except:
        try:
            result = expr(th=th_val).simplify_trig().expand()(r=r_val).simplify_trig()
        except:
            try:
                result = expr(r=r_val).simplify_trig().expand()(th=th_val).simplify_trig()
            except:
                try:
                    result = expr.simplify_trig()(th=th_val).simplify_trig().expand()(r=r_val).simplify_trig()
                except:
                    raise RuntimeError("Couldn't substitute values into expression")
    return result

def taylor2d_r_th(expr,r_val,th_val):
    result = []
    tmp = taylor2d_subst_r_th(expr,r_val,th_val)
    if not tmp == 0:
        result.append([tmp,0,0])
    tmp = taylor2d_subst_r_th(diff(expr,r), r_val,th_val)
    if not tmp == 0:
        result.append([tmp,1,0])
    tmp = taylor2d_subst_r_th(diff(expr,th),r_val,th_val)
    if not tmp == 0:
        result.append([tmp,0,1])
    tmp = taylor2d_subst_r_th(diff(diff(expr,r),r),  r_val,th_val)/2
    if not tmp == 0:
        result.append([tmp,2,0])
    tmp = taylor2d_subst_r_th(diff(diff(expr,r),th), r_val,th_val) 
    if not tmp == 0:
        result.append([tmp,1,1])
    tmp = taylor2d_subst_r_th(diff(diff(expr,th),th),r_val,th_val)/2
    if not tmp == 0:
        result.append([tmp,0,2])
    #tmp = taylor2d_subst_r_th(diff(diff(diff(expr,r),r),r),r_val,th_val)/6
    #if not tmp == 0:
    #    result.append([tmp,3,0])
    #tmp = taylor2d_subst_r_th(diff(diff(diff(expr,r),r),th),r_val,th_val)/2
    #if not tmp == 0:
    #    result.append([tmp,2,1])
    #tmp = taylor2d_subst_r_th(diff(diff(diff(expr,r),th),th),r_val,th_val)/2
    #if not tmp == 0:
    #    result.append([tmp,1,2])
    #tmp = taylor2d_subst_r_th(diff(diff(diff(expr,th),th),th),r_val,th_val)/6
    #if not tmp == 0:
    #    result.append([tmp,0,3])
    return result

def acos_taylor2d_r_th(expr,r_val,th_val):
    result = []
    f     = expr
    fr    = diff(expr,r)
    fth   = diff(expr,th)
    frr   = diff(fr,r)
    fthth = diff(fth,th)
    frth  = diff(fr,th)

    cosz  = taylor2d_subst_r_th(f, r_val, th_val)
    sinz  = sqrt(1 - cosz^2)

    z     = acos(cosz)
    zr    = -taylor2d_subst_r_th(fr,  r_val, th_val) / sinz
    zth   = -taylor2d_subst_r_th(fth, r_val, th_val) / sinz

    if not z == 0:
        result.append([z,0,0])
    if not zr == 0:
        result.append([zr,1,0])
    if not zth == 0:
        result.append([zth,0,1])
    #if not tmp == 0:
    #    result.append([tmp,2,0])
    #tmp = taylor2d_subst_r_th(diff(diff(expr,r),th), r_val,th_val) 
    #if not tmp == 0:
    #    result.append([tmp,1,1])
    #tmp = taylor2d_subst_r_th(diff(diff(expr,th),th),r_val,th_val)/2
    #if not tmp == 0:
    #    result.append([tmp,0,2])
    return result
