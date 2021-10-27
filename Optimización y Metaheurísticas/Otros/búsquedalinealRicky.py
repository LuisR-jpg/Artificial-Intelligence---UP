"""# Método de la sección dorada"""

import numpy as np
import matplotlib.pyplot as plt

t = 2/(1 + 5**0.5) # 1 / 1.618033

def dorada(a, b, e, f):
  tt = np.arange(a-1, b+1,.01)
  s = f(tt)
  fig, ax = plt.subplots()
  fig.set_size_inches(10,8)
  ax.plot(tt,s)

  a1 = a*(1-t) + b*t
  a2 = a*t + b*(1-t)
  
  while np.abs(f(a1) - f(a2)) > e:
    if f(a1) > f(a2):
      b = a1
      a1 = a2
      a2 = a*t + b*(1-t)
    else:
      a = a2
      a2 = a1
      a1 = a*(1-t) + b*t
    ax.scatter(a1, f(a1), color='#FF0000')
  
  ax.scatter(a1, f(a1))
  return a1, f(a1)

def function(x):
  return x**2 + 2*np.exp(-x)

dorada(0, 2, 1e-12, function)