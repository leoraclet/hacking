from math import gcd

def get_values(x1, y1, x2, y2):
    alpha = y1*y1 - x1*x1*x1 - y2*y2 + x2*x2*x2
    delta = x1 - x2
    beta = y2*y2 * x1 - x2*x2*x2 * x1 - x2 * y1*y1 + x2 * x1*x1*x1
    return alpha, beta, delta


def get_diff(alpha1, beta1, delta1, alpha2, beta2, delta2):
    return gcd(delta1 * alpha2 - delta2 * alpha1, delta1 * beta2 - delta2 * beta1)


def get_mult_p(x1, y1, x2, y2, x3, y3):
    """
    A partir de 3 points d'une courbe elliptique y^2=x^3+ax+b [p] (avec a,b et p inconnus),  trouve un multiple de p
    """
    alpha12, beta12, delta12 = get_values(x1, y1, x2, y2)
    alpha23, beta23, delta23 = get_values(x2, y2, x3, y3)
    alpha13, beta13, delta13 = get_values(x1, y1, x3, y3)
    p1 = get_diff(alpha12, beta12, delta12, alpha23, beta23, delta23)
    p2 = get_diff(alpha12, beta12, delta12, alpha13, beta13, delta13)
    p3 = get_diff(alpha13, beta13, delta13, alpha23, beta23, delta23)
    return gcd(gcd(p1, p2), p3)

