library('Deriv')

Secante <- function(a, b, e){
  flag = 0
  it = 1
  alpha = (a + b)/2
  fDeriv = Deriv(f)
  sDeriv = Deriv(fDeriv)
  h = c(it, alpha, f(alpha), fDeriv(alpha), sDeriv(alpha))
  while(abs(fDeriv(alpha)) > e){
    if(fDeriv(a)*fDeriv(alpha) < 0){
      b = alpha
      flag = 1
    }
    else a = alpha
    if(flag == 1){
      alpha = b - fDeriv(b)/((fDeriv(b) - fDeriv(a))/(b - a))
      it = it + 1
      h = rbind(h, c(it, alpha, f(alpha), fDeriv(alpha), sDeriv(alpha)))
      if(fDeriv(alpha) > 0)
        b = alpha
      else 
        a = alpha
    }
  }
  cat('Alpha')
}
f <- function(x){
  x^2 + 2*exp(-x)
}
Secante(-4, -3, 1e-8)
