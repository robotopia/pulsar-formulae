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
            result = expr(th=th_val).simplify_trig()(r=r_val).simplify_trig()
        except:
            try:
                result = expr(r=r_val).simplify_trig()(th=th_val).simplify_trig()
            except:
                try:
                    result = expr.simplify_trig()(th=th_val).simplify_trig()(r=r_val).simplify_trig()
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
    return result

def acos_taylor2d_r_th(expr,r_val,th_val):
    result = []
    expr00 = expr
    expr10 = diff(expr,r)
    expr01 = diff(expr,th)
    expr20 = diff(diff(expr,r),r)
    expr02 = diff(diff(expr,th),th)
    expr11 = diff(diff(expr,r),th)

    tmp = acos(taylor2d_subst_r_th(expr00,r_val,th_val))
    if not tmp == 0:
        result.append([tmp,0,0])
    tmp = taylor2d_subst_r_th(diff(-expr10/sin(expr00),r), r_val,th_val)
    if not tmp == 0:
        result.append([tmp,1,0])
    tmp = taylor2d_subst_r_th(diff(-expr01/sin(expr00),th),r_val,th_val)
    if not tmp == 0:
        result.append([tmp,0,1])
    tmp = taylor2d_subst_r_th(diff(diff((-expr20 - cos(expr00)*expr10^2)/sin(expr00),r),r),  r_val,th_val)/2
    if not tmp == 0:
        result.append([tmp,2,0])
    #tmp = taylor2d_subst_r_th(diff(diff(expr,r),th), r_val,th_val) 
    #if not tmp == 0:
    #    result.append([tmp,1,1])
    #tmp = taylor2d_subst_r_th(diff(diff(expr,th),th),r_val,th_val)/2
    #if not tmp == 0:
    #    result.append([tmp,0,2])
    return result
