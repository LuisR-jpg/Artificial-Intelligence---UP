
tabu <- function(it = 15, tabuS = 2, pesos, beneficios, sol = c(), weightL, printIt = FALSE){
  h = c()
  bProfit = 0
  bSol = c()
  tabuT = seq(0, 0, length.out = tabuS)
  if(length(sol) == 0)
    sol = seq(0, 0, length.out = length(pesos))
  for(i in 1: it){
    newProfit = -1
    newIndex = -1
    for(j in 1: length(sol)){
      sol[j] = !sol[j]
      peso = sum(pesos*sol)
      profit = sum(beneficios*sol)
      if(peso <= weightL && profit > newProfit && !(j %in% tabuT)){
        newProfit = profit
        newIndex = j
      }
      sol[j] = !sol[j]
    }
    bProfit = max(c(bProfit, newProfit))
    hList = list(Iteration = i, CurrentSolution = which(sol == 1), Profit = sum(beneficios*sol), Weight = sum(pesos*sol), TabuActive = tabuT, Move = newIndex)
    h = rbind(h, hList)
    if(printIt) print(hList)
    sol[newIndex] = !sol[newIndex]
    tabuT = c(tabuT, newIndex)
    tabuT = tabuT[2: length(tabuT)]
    
  }
  if(!printIt) print(h)
  return(bProfit)
}
# tabu(
#   it =         30, 
#   tabuS =      4,
#   pesos =      c(7, 12, 8, 9, 8, 6, 11, 5),
#   beneficios = c(10, 14, 9, 8, 7, 5, 9, 3),
#   sol =        c(1, 0, 0, 1, 1, 1, 0, 1),
#   weightL =    38,
#   printIt =    FALSE
# )
tabu( 
  it =    15,
  pesos = c(4990, 1142, 7390, 10372, 3114, 2744, 3102, 7280, 2624, 3020, 2310, 2078, 3926, 9656, 32708, 4830, 2034, 4766, 40006),
  beneficios = c(1945, 321, 2945, 4136, 1107, 1022, 1101, 2890, 962, 1060, 805, 689, 1513, 3878, 13504, 1865, 667, 1833, 16553),
  tabuS = 4, 
  weightL = 31181, 
  printIt = FALSE
)