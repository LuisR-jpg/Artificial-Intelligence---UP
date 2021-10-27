
library('Deriv')

f <- function(x1, x2){
  x1^2 + x2^2 - 2*x1
}
Newton <- function(x, ev, eg){ #Delta para aproximaciones
    #fx = f(x)
    fDeriv = Deriv(f)
    sDeriv = Deriv(fDeriv)
    # gE = fDeriv(x)
    # hE = sDeriv(x)
    print(sDeriv)

}

Newton(c(5, -5), 1e-8, 1e-6)