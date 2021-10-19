library(Deriv)

f = function(x1, x2){
  (1/2)*((x1^4 - 16*x1^2 + 5*x1)+(x2^4 - 16*x2^2 + 5*x2))
}

f1 = Deriv(f, nderiv = 1)
f2 = Deriv(f1, nderiv = 1)

norma = function(x){
  sum = 0
  for(i in x){
    sum = sum + i^2
  }
  sqrt(sum)
}

newton = function(x, err1, err2){
  repeat{
    xprev = x
    fx = f(x[1],x[2])           #Funcion
    
    fgradiente = f1(x[1],x[2])  #Gradiente
    fgradiente = matrix(fgradiente, ncol = 1)
    
    h = f2(x[1],x[2])           #Hessiano
    h = matrix(h, ncol = 2)
    h1 = solve(h)               #Inversa
    
    s = (-1*h1) %*% fgradiente  #Buscar direccion
    x = x+s                     #Actualizar el vector
    # print(h)
    cat('x*=', x, ' f(x*)=', f(x[1],x[2]), '\n')
    if( abs(f(x[1],x[2])-f(xprev[1],xprev[2])) < err1 || norma(xprev) < err2){
      break
    }
  }
  # cat('x*=', x, ' f(x*)=', f(x[1],x[2]))
  
}

newton(c(-2,-3), 1e-8, 1e-6)