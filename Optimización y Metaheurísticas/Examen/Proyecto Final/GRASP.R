#myFile = read.delim(file.choose(), header = FALSE, sep = " ")
myFile = read.delim("C:\\Users\\lalor\\Documents\\Git\\School\\Optimización y Metaheurísticas\\Examen\\Proyecto Final\\Instancias_sjupm\\Mine\\Instancia10.sjupm", header = FALSE, sep = " ")
nOperaciones = myFile[1, 1]
nMaquinas = myFile[1, 2]
rows = 1 + nMaquinas
#unlist(myFile[2: 4, 1: 10])
tOperaciones = matrix(unlist(myFile[2: rows, 1: nOperaciones]), byrow = FALSE, nrow = nMaquinas)
tAjuste = list()

for(i in 1: nMaquinas){
  nRow = 2 + nMaquinas + nOperaciones*(i - 1)
  nRowE = nRow + nOperaciones - 1
  m = matrix(unlist(myFile[nRow: nRowE, 1: nOperaciones]), byrow = FALSE, nrow = nOperaciones)
  tAjuste[[i]] = m
}
print(nOperaciones)
print(nMaquinas)
print(tOperaciones)
print(tAjuste)
top = 3
matAvg = Reduce('+', tAjuste)/nMaquinas
vecAvg = colSums(tOperaciones)/nMaquinas
matAvg = matAvg + vecAvg[col(matAvg)]
diag(matAvg) = Inf
minOp = arrayInd(which.min(tOperaciones), dim(tOperaciones))
#which(tOperaciones == min(tOperaciones), arr.ind = TRUE)
assignedOp = c()
sol = vector(mode = "list", length = nMaquinas)
times = rep(0, nMaquinas)
currOp = minOp[2]
print(matAvg)
repeat {
  assignedOp = c(assignedOp, currOp)
  cat("NUEVA ITERACION", "\n")
  print(currOp)
  assignedM = which.min(times + tOperaciones[, currOp])
  #print("Sol")
  #print(times + tOperaciones[, currOp])
  #print(which.min(times + tOperaciones[, currOp]))
  sol[[assignedM]] = c(sol[[assignedM]], currOp)
  times[assignedM] = times[assignedM] + tOperaciones[assignedM, currOp]
  nOM = length(sol[[assignedM]]) #Número de operaciones en la máquina asignada
  if(nOM > 1)
    times[assignedM] = times[assignedM] + tAjuste[[assignedM]][sol[[assignedM]][nOM - 1], sol[[assignedM]][nOM]]
  
  if(length(assignedOp) == nOperaciones) break
  
  vecFila = sort(matAvg[currOp, ])
  neighborhood = c()
  #cat("assignedOp:", assignedOp, "\\n")
  for(i in 1: nOperaciones){
    element = vecFila[i]
    index = which(element == matAvg[currOp, ])
    if(length(index) > 1) index = sample(index, 1)
    if(!(index %in% assignedOp))
      neighborhood = c(neighborhood, element)
  }
  cat("Tamaño:", nOperaciones, length(assignedOp), "\n")
  cat("Neighboor", neighborhood, "\n")
  
  ranElement = sample(neighborhood, 1)
  if(length(neighborhood) == 1) ranElement = neighborhood[1]
  currOp = match(ranElement, matAvg[currOp, ])
  #print(currOp)
}
sol


timeList <- function(solution, prosecutionTime, adjustmentTime)
{
  times = c()
  #print(length(solution))
  for(i in 1:length(solution))
  {
    #cat("i",i)
    time = 0
    for(j in 1:length(solution[[i]]))
    {
      #cat("j",j)
      time = time + prosecutionTime[i,solution[[i]][j]]
      if(j >= 2)
      {
        time = time + adjustmentTime[[i]][solution[[i]][j-1],solution[[i]][j]]
      }
    }
    times = c(times, time)
  }
  #print(times) 
  return(times)
}
timeList(sol, tOperaciones, tAjuste)
