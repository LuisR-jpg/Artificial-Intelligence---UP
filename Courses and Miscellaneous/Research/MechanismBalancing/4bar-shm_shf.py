"""
-0.4 <= xc <= 0.4
-0.4 <= yc <= 0.4
0.005 <= t <= 0.04
"""
import numpy 
def ShF2(x_c1,x_c2,x_c3,y_c1,y_c2,y_c3,t_c1,t_c2,t_c3):
    return 2.224e-8 * numpy.sqrt(
    1.897e23 * t_c3 ** 2 * y_c3 ** 6 + 7.785e6 * t_c3 ** 2 * x_c3 * y_c3 ** 5 + 5.691e23 * t_c3 ** 2 * x_c3 ** 2 * y_c3 ** 4 + 1.557e7 * t_c3 ** 2 * x_c3 ** 3 * y_c3 ** 3 + 1.392e18 * t_c3 * y_c3 ** 3 + 2.742e23 * t_c2 * y_c2 ** 3 * t_c3 * y_c3 ** 3 - 1.314e22 * t_c2 * x_c2 * y_c2 ** 2 * t_c3 *
    y_c3 ** 3 + 1.025e22 * t_c2 * y_c2 ** 2 * t_c3 * y_c3 ** 3 + 2.742e23 * t_c2 * x_c2 ** 2 * y_c2 * t_c3 * y_c3 ** 3 - 1.314e22 * t_c2 * x_c2 ** 3 * t_c3 * y_c3 ** 3 + 1.025e22 * t_c2 * x_c2 ** 2 * t_c3 * y_c3 ** 3 + 3.444e22 * t_c1 * y_c1 ** 3 * t_c3 * y_c3 ** 3 + 2.562e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c3 * y_c3 ** 3 + 3.444e22 *
    t_c1 * x_c1 ** 2 * y_c1 * t_c3 * y_c3 ** 3 + 2.562e22 * t_c1 * x_c1 ** 3 * t_c3 * y_c3 ** 3 + 5.691e23 * t_c3 ** 2 * x_c3 ** 4 * y_c3 ** 2 + 3.779e19 * t_c3 * x_c3 * y_c3 ** 2 + 1.314e22 * t_c2 * y_c2 ** 3 * t_c3 * x_c3 * y_c3 ** 2 + 2.742e23 * t_c2 * x_c2 * y_c2 ** 2 * t_c3 * x_c3 * y_c3 ** 2 + 1.377e22 * t_c2 * y_c2 ** 2 * t_c3 * x_c3 *
    y_c3 ** 2 + 1.314e22 * t_c2 * x_c2 ** 2 * y_c2 * t_c3 * x_c3 * y_c3 ** 2 + 2.742e23 * t_c2 * x_c2 ** 3 * t_c3 * x_c3 * y_c3 ** 2 + 1.377e22 * t_c2 * x_c2 ** 2 * t_c3 * x_c3 * y_c3 ** 2 - 2.562e22 * t_c1 * y_c1 ** 3 * t_c3 * x_c3 * y_c3 ** 2 + 3.444e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c3 * x_c3 * y_c3 ** 2 - 2.562e22 * t_c1 * x_c1 ** 2 *
    y_c1 * t_c3 * x_c3 * y_c3 ** 2 + 3.444e22 * t_c1 * x_c1 ** 3 * t_c3 * x_c3 * y_c3 ** 2 + 7.785e6 * t_c3 ** 2 * x_c3 ** 5 * y_c3 + 1.392e18 * t_c3 * x_c3 ** 2 * y_c3 + 2.742e23 * t_c2 * y_c2 ** 3 * t_c3 * x_c3 ** 2 * y_c3 - 1.314e22 * t_c2 * x_c2 * y_c2 ** 2 * t_c3 * x_c3 ** 2 * y_c3 + 1.025e22 * t_c2 * y_c2 ** 2 * t_c3 * x_c3 ** 2 * y_c3
    + 2.742e23 * t_c2 * x_c2 ** 2 * y_c2 * t_c3 * x_c3 ** 2 * y_c3 - 1.314e22 * t_c2 * x_c2 ** 3 * t_c3 * x_c3 ** 2 * y_c3 + 1.025e22 * t_c2 * x_c2 ** 2 * t_c3 * x_c3 ** 2 * y_c3 + 3.444e22 * t_c1 * y_c1 ** 3 * t_c3 * x_c3 ** 2 * y_c3 + 2.562e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c3 * x_c3 ** 2 * y_c3 + 3.444e22 * t_c1 * x_c1 ** 2 * y_c1 *
    t_c3 * x_c3 ** 2 * y_c3 + 2.562e22 * t_c1 * x_c1 ** 3 * t_c3 * x_c3 ** 2 * y_c3 + 1.897e23 * t_c3 ** 2 * x_c3 ** 6 + 3.779e19 * t_c3 * x_c3 ** 3 + 1.314e22 * t_c2 * y_c2 ** 3 * t_c3 * x_c3 ** 3 + 2.742e23 * t_c2 * x_c2 * y_c2 ** 2 * t_c3 * x_c3 ** 3 + 1.377e22 * t_c2 * y_c2 ** 2 * t_c3 * x_c3 ** 3 + 1.314e22 * t_c2 * x_c2 ** 2 *
    y_c2 * t_c3 * x_c3 ** 3 + 2.742e23 * t_c2 * x_c2 ** 3 * t_c3 * x_c3 ** 3 + 1.377e22 * t_c2 * x_c2 ** 2 * t_c3 * x_c3 ** 3 - 2.562e22 * t_c1 * y_c1 ** 3 * t_c3 * x_c3 ** 3 + 3.444e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c3 * x_c3 ** 3 - 2.562e22 * t_c1 * x_c1 ** 2 * y_c1 * t_c3 * x_c3 ** 3 + 3.444e22 * t_c1 * x_c1 ** 3 * t_c3 * x_c3 ** 3 +
    1.115e23 * t_c2 ** 2 * y_c2 ** 6 - 8.982e6 * t_c2 ** 2 * x_c2 * y_c2 ** 5 + 7.882e21 * t_c2 ** 2 * y_c2 ** 5 + 3.346e23 * t_c2 ** 2 * x_c2 ** 2 * y_c2 ** 4 - 9.482e21 * t_c2 ** 2 * x_c2 * y_c2 ** 4 + 7.83e21 * t_c2 ** 2 * y_c2 ** 4 - 1.796e7 * t_c2 ** 2 * x_c2 ** 3 * y_c2 ** 3 + 1.576e22 * t_c2 ** 2 * x_c2 ** 2 * y_c2 ** 3 + 2.315e18 * t_c2 * y_c2 ** 3
    - 2.371e22 * t_c1 * y_c1 ** 3 * t_c2 * y_c2 ** 3 + 1.97e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * y_c2 ** 3 - 2.371e22 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * y_c2 ** 3 + 1.97e22 * t_c1 * x_c1 ** 3 * t_c2 * y_c2 ** 3 + 3.346e23 * t_c2 ** 2 * x_c2 ** 4 * y_c2 ** 2 - 1.896e22 * t_c2 ** 2 * x_c2 ** 3 * y_c2 ** 2 + 1.566e22 * t_c2 ** 2 * x_c2 ** 2 * y_c2 ** 2 +
    2.467e19 * t_c2 * x_c2 * y_c2 ** 2 - 1.97e22 * t_c1 * y_c1 ** 3 * t_c2 * x_c2 * y_c2 ** 2 - 2.371e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * x_c2 * y_c2 ** 2 - 1.97e22 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * x_c2 * y_c2 ** 2 - 2.371e22 * t_c1 * x_c1 ** 3 * t_c2 * x_c2 * y_c2 ** 2 + 3.432e18 * t_c2 * y_c2 ** 2 + 1.12e6 * t_c1 * y_c1 ** 3 *
    t_c2 * y_c2 ** 2 + 3.915e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * y_c2 ** 2 + 1.12e6 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * y_c2 ** 2 + 3.915e22 * t_c1 * x_c1 ** 3 * t_c2 * y_c2 ** 2 - 8.982e6 * t_c2 ** 2 * x_c2 ** 5 * y_c2 + 7.882e21 * t_c2 ** 2 * x_c2 ** 4 * y_c2 + 2.315e18 * t_c2 * x_c2 ** 2 * y_c2 - 2.371e22 * t_c1 * y_c1 ** 3 * t_c2 *
    x_c2 ** 2 * y_c2 + 1.97e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * x_c2 ** 2 * y_c2 - 2.371e22 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * x_c2 ** 2 * y_c2 + 1.97e22 * t_c1 * x_c1 ** 3 * t_c2 * x_c2 ** 2 * y_c2 + 1.115e23 * t_c2 ** 2 * x_c2 ** 6 - 9.482e21 * t_c2 ** 2 * x_c2 ** 5 + 7.83e21 * t_c2 ** 2 * x_c2 ** 4 + 2.467e19 * t_c2 * x_c2 ** 3 -
    1.97e22 * t_c1 * y_c1 ** 3 * t_c2 * x_c2 ** 3 - 2.371e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * x_c2 ** 3 - 1.97e22 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * x_c2 ** 3 - 2.371e22 * t_c1 * x_c1 ** 3 * t_c2 * x_c2 ** 3 + 3.432e18 * t_c2 * x_c2 ** 2 + 1.12e6 * t_c1 * y_c1 ** 3 * t_c2 * x_c2 ** 2 + 3.915e22 * t_c1 * x_c1 * y_c1 ** 2 * t_c2 * x_c2 ** 2 +
    1.12e6 * t_c1 * x_c1 ** 2 * y_c1 * t_c2 * x_c2 ** 2 + 3.915e22 * t_c1 * x_c1 ** 3 * t_c2 * x_c2 ** 2 + 4.894e22 * t_c1 ** 2 * y_c1 ** 6 + 7.438e6 * t_c1 ** 2 * x_c1 * y_c1 ** 5 + 1.468e23 * t_c1 ** 2 * x_c1 ** 2 * y_c1 ** 4 + 1.488e7 * t_c1 ** 2 * x_c1 ** 3 * y_c1 ** 3 - 2.425e18 * t_c1 * y_c1 ** 3 + 1.468e23 * t_c1 ** 2 * x_c1 ** 4 * y_c1 ** 2 +
    8.581e18 * t_c1 * x_c1 * y_c1 ** 2 + 7.438e6 * t_c1 ** 2 * x_c1 ** 5 * y_c1 - 2.425e18 * t_c1 * x_c1 ** 2 * y_c1 + 4.894e22 * t_c1 ** 2 * x_c1 ** 6 + 8.581e18 * t_c1 * x_c1 ** 3 + 2.022e15)

def ShM1(x_c1,x_c2,x_c3,y_c1,y_c2,y_c3,t_c1,t_c2,t_c3):
    return 2.8e-53*numpy.sqrt(5.375e113*t_c3**2*y_c3**8-4.348e113*t_c3**2*y_c3**7+1.0e0*(2.15e114*t_c3**2*x_c3**2+2.099e113*t_c3**2*x_c3+9.452e112*t_c3**2)*y_c3**6+1.0e0*
(-1.304e114*t_c3**2*x_c3**2-6.386e112*t_c3**2*x_c3)*y_c3**5+1.0e0*(3.225e114*t_c3**2*x_c3**4+6.297e113*t_c3**2*x_c3**3+2.48e113*t_c3**2*x_c3**2+1.0e0*(8.006e113*t_c2*y_c2**4-1.029e113*t_c2*y_c2**3+1.0e0*
(1.601e114*t_c2*x_c2**2+7.592e112*t_c2*x_c2-3.816e102*t_c2)*y_c2**2-1.029e113*t_c2*x_c2**2*y_c2+8.006e113*t_c2*x_c2**4+7.592e112*t_c2*x_c2**3-3.816e102*t_c2*x_c2**2-3.578e103*t_c1*y_c1**4-
7.156e103*t_c1*x_c1**2*y_c1**2-3.578e103*t_c1*x_c1**4+4.578e109)*t_c3)*y_c3**4+1.0e0*(-1.304e114*t_c3**2*x_c3**4-1.277e113*t_c3**2*x_c3**3+1.0e0*(-3.173e113*t_c2*y_c2**4+4.913e112*t_c2*y_c2**3+
1.0e0*(-6.346e113*t_c2*x_c2**2-1.79e112*t_c2*x_c2+2.201e102*t_c2)*y_c2**2+4.913e112*t_c2*x_c2**2*y_c2-3.173e113*t_c2*x_c2**4-1.79e112*t_c2*x_c2**3+2.201e102*t_c2*x_c2**2+2.064e103*t_c1*
y_c1**4+4.127e103*t_c1*x_c1**2*y_c1**2+2.064e103*t_c1*x_c1**4-1.66e109)*t_c3)*y_c3**3+1.0e0*(2.15e114*t_c3**2*x_c3**6+6.297e113*t_c3**2*x_c3**5+2.125e113*t_c3**2*x_c3**4+1.0e0*(1.601e114*t_c2*y_c2**4-
2.057e113*t_c2*y_c2**3+1.0e0*(3.202e114*t_c2*x_c2**2+1.518e113*t_c2*x_c2-7.633e102*t_c2)*y_c2**2-2.057e113*t_c2*x_c2**2*y_c2+1.601e114*t_c2*x_c2**4+1.518e113*t_c2*x_c2**3-7.633e102*t_c2*
x_c2**2-7.156e103*t_c1*y_c1**4-1.431e104*t_c1*x_c1**2*y_c1**2-7.156e103*t_c1*x_c1**4+9.155e109)*t_c3*x_c3**2+1.0e0*(2.031e113*t_c2*y_c2**4-3.055e112*t_c2*y_c2**3+1.0e0*
(4.062e113*t_c2*x_c2**2+4.972e112*t_c2*x_c2-3.395e101*t_c2)*y_c2**2-3.055e112*t_c2*x_c2**2*y_c2+2.031e113*t_c2*x_c2**4+4.972e112*t_c2*x_c2**3-3.395e101*t_c2*x_c2**2-3.183e102*t_c1*y_c1**4-
6.366e102*t_c1*x_c1**2*y_c1**2-3.183e102*t_c1*x_c1**4+1.569e109)*t_c3*x_c3)*y_c3**2+1.0e0*(-4.348e113*t_c3**2*x_c3**6-6.386e112*t_c3**2*x_c3**5+1.0e0*(-3.173e113*t_c2*y_c2**4+4.913e112*t_c2*y_c2**3+
1.0e0*(-6.346e113*t_c2*x_c2**2-1.79e112*t_c2*x_c2+2.201e102*t_c2)*y_c2**2+4.913e112*t_c2*x_c2**2*y_c2-3.173e113*t_c2*x_c2**4-1.79e112*t_c2*x_c2**3+2.201e102*t_c2*x_c2**2+2.064e103*t_c1*
y_c1**4+4.127e103*t_c1*x_c1**2*y_c1**2+2.064e103*t_c1*x_c1**4-1.66e109)*t_c3*x_c3**2)*y_c3+5.375e113*t_c3**2*x_c3**8+2.099e113*t_c3**2*x_c3**7+5.898e112*t_c3**2*x_c3**6+1.0e0*(8.006e113*t_c2*y_c2**4-
1.029e113*t_c2*y_c2**3+1.0e0*(1.601e114*t_c2*x_c2**2+7.592e112*t_c2*x_c2-3.816e102*t_c2)*y_c2**2-1.029e113*t_c2*x_c2**2*y_c2+8.006e113*t_c2*x_c2**4+7.592e112*t_c2*x_c2**3-3.816e102*t_c2*
x_c2**2-3.578e103*t_c1*y_c1**4-7.156e103*t_c1*x_c1**2*y_c1**2-3.578e103*t_c1*x_c1**4+4.578e109)*t_c3*x_c3**4+1.0e0*(2.031e113*t_c2*y_c2**4-3.055e112*t_c2*y_c2**3+1.0e0*
(4.062e113*t_c2*x_c2**2+4.972e112*t_c2*x_c2-3.395e101*t_c2)*y_c2**2-3.055e112*t_c2*x_c2**2*y_c2+2.031e113*t_c2*x_c2**4+4.972e112*t_c2*x_c2**3-3.395e101*t_c2*x_c2**2-3.183e102*t_c1*y_c1**4-
6.366e102*t_c1*x_c1**2*y_c1**2-3.183e102*t_c1*x_c1**4+1.569e109)*t_c3*x_c3**3+3.48e113*t_c2**2*y_c2**8-9.982e112*t_c2**2*y_c2**7+1.0e0*(1.392e114*t_c2**2*x_c2**2+4.06e112*t_c2**2*x_c2+1.84e112*t_c2**2)*y_c2**6
+1.0e0*(-2.994e113*t_c2**2*x_c2**2-3.244e111*t_c2**2*x_c2+1.102e102*t_c2**2)*y_c2**5+1.0e0*(2.088e114*t_c2**2*x_c2**4+1.218e113*t_c2**2*x_c2**3+5.705e112*t_c2**2*x_c2**2+1.39e102*t_c2**2*x_c2+1.401e92*
t_c2**2+1.0e0*(-5.095e103*t_c1*y_c1**4-1.019e104*t_c1*x_c1**2*y_c1**2-5.095e103*t_c1*x_c1**4+3.737e109)*t_c2)*y_c2**4+1.0e0*
(-2.994e113*t_c2**2*x_c2**4-6.488e111*t_c2**2*x_c2**3+2.204e102*t_c2**2*x_c2**2+1.0e0*(1.033e103*t_c1*y_c1**4+2.066e103*t_c1*x_c1**2*y_c1**2+1.033e103*t_c1*x_c1**4-5.104e108)*t_c2)*y_c2**3+1.0e0*(
1.392e114*t_c2**2*x_c2**6+1.218e113*t_c2**2*x_c2**5+5.89e112*t_c2**2*x_c2**4+2.781e102*t_c2**2*x_c2**3+1.0e0*
(2.801e92*t_c2**2+1.0e0*(-1.019e104*t_c1*y_c1**4-2.038e104*t_c1*x_c1**2*y_c1**2-1.019e104*t_c1*x_c1**4+7.475e109)*t_c2)*x_c2**2+1.0e0*
(1.303e103*t_c1*y_c1**4+2.607e103*t_c1*x_c1**2*y_c1**2+1.303e103*t_c1*x_c1**4+6.72e108)*t_c2*x_c2+1.0e0*(2.626e93*t_c1*y_c1**4+5.252e93*t_c1*x_c1**2*y_c1**2+2.626e93*t_c1*x_c1**4-9.434e97)*t_c2)*
y_c2**2+1.0e0*(-9.982e112*t_c2**2*x_c2**6-3.244e111*t_c2**2*x_c2**5+1.102e102*t_c2**2*x_c2**4+1.0e0*(1.033e103*t_c1*y_c1**4+2.066e103*t_c1*x_c1**2*y_c1**2+1.033e103*t_c1*x_c1**4-5.104e108)*t_c2*x_c2**2)*
y_c2+3.48e113*t_c2**2*x_c2**8+4.06e112*t_c2**2*x_c2**7+2.025e112*t_c2**2*x_c2**6+1.39e102*t_c2**2*x_c2**5+1.0e0*
(1.401e92*t_c2**2+1.0e0*(-5.095e103*t_c1*y_c1**4-1.019e104*t_c1*x_c1**2*y_c1**2-5.095e103*t_c1*x_c1**4+3.737e109)*t_c2)*x_c2**4+1.0e0*
(1.303e103*t_c1*y_c1**4+2.607e103*t_c1*x_c1**2*y_c1**2+1.303e103*t_c1*x_c1**4+6.72e108)*t_c2*x_c2**3+1.0e0*(2.626e93*t_c1*y_c1**4+5.252e93*t_c1*x_c1**2*y_c1**2+2.626e93*t_c1*x_c1**4-9.434e97)*t_c2*
x_c2**2+1.231e94*t_c1**2*y_c1**8+4.924e94*t_c1**2*x_c1**2*y_c1**6+1.0e0*(7.386e94*t_c1**2*x_c1**4-8.845e98*t_c1)*y_c1**4+1.0e0*(4.924e94*t_c1**2*x_c1**6-1.769e99*t_c1*x_c1**2)*y_c1**2+1.231e94*t_c1**2*x_c1**8-
8.845e98*t_c1*x_c1**4+1.275e105)