library('Deriv')

Secante <- function(a, b, e){
  flag = 0
  it = 1
  alpha = 0
  fDeriv = Deriv(f)
  #h = c(it, alpha, f(alpha), fDeriv(alpha))
  h = c()
  repeat{
    alpha = (a + b)/2
    if(fDeriv(a)*fDeriv(alpha) < 0){
      b = alpha;
      break;
    }
    else a = alpha;
    h = c(h, alpha, f(alpha), fDeriv(alpha))
  }
  repeat{
    alpha = b - fDeriv(b)/(fDeriv(b) - fDeriv(a))/(b - a)
    if(fDeriv(alpha) > 0) b = alpha
    else a = alpha
    h = c(h, alpha, f(alpha), fDeriv(alpha))
    if(abs(fDeriv(alpha)) < e) break
  }
  return(matrix(h, ncol = 3, byrow = TRUE))
}
f <- function(x){
  x^2 + 1
}
#Secante(-4, 3, 0.00000001)
write.csv(Secante(-3, 4, 1e-8), file = "Git/School/Optimización y Metaheurísticas/Secante.csv") #CSV
