
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

executeTabu <- function(throughFile = FALSE, i = 15, tS = 2, pI = FALSE){
  if(throughFile){
    myFile = read.delim(file.choose(), header = FALSE, sep = " ")
    nObjects = myFile[1, 1]
    tabu(
      it = i,
      tabuS = tS,
      beneficios = myFile[2: nObjects + 1, 1],
      pesos = myFile[2: nObjects + 1, 2],
      weightL = myFile[1, 2],
      printIt = pI
    )
  }
  else {
    tabu(
      it =         i, 
      tabuS =      tS,
      pesos =      c(7, 12, 8, 9, 8, 6, 11, 5),
      beneficios = c(10, 14, 9, 8, 7, 5, 9, 3),
      sol =        c(1, 0, 0, 1, 1, 1, 0, 1),
      weightL =    38,
      printIt =    pI
    )
  }
}

executeTabu(1)