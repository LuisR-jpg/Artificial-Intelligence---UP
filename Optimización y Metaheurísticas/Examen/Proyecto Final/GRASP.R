#myFile = read.delim(file.choose(), header = FALSE, sep = " ")
myFile = read.delim("C:\\Users\\lalor\\Documents\\Git\\School\\Optimización y Metaheurísticas\\Examen\\Proyecto Final\\Instancias_sjupm\\Mine\\Instancia2.sjupm", header = FALSE, sep = " ")
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

#print(nOperaciones)
#print(nMaquinas)
#print(tOperaciones)
#cat("tiempo de ajuste\n")
#print(length(tAjuste))
Greedy <- function(){
  top = 3
  matAvg = Reduce('+', tAjuste)/nMaquinas
  vecAvg = colSums(tOperaciones)/nMaquinas
  matAvg = matAvg + vecAvg[col(matAvg)]
  diag(matAvg) = Inf
  minOp = arrayInd(which.min(tOperaciones), dim(tOperaciones))
  assignedOp = c()
  sol = vector(mode = "list", length = nMaquinas)
  times = rep(0, nMaquinas)
  currOp = minOp[2]
  #print(matAvg)
  repeat {
    assignedOp = c(assignedOp, currOp)
    #cat("NUEVA ITERACION", "\n")
    #print(currOp)
    vecValidation = c()
    for(i in 1: nMaquinas){
      suma = times[i] + tOperaciones[1, currOp]
      nOM = length(sol[[i]])
      if(nOM > 0) suma = suma + tAjuste[[i]][sol[[i]][nOM - 1], currOp]
      vecValidation = c(vecValidation, suma)
    }
    assignedM = which.min(vecValidation)
    #print("Sol")
    #print(times + tOperaciones[, currOp])
    #print(which.min(times + tOperaciones[, currOp]))
    sol[[assignedM]] = c(sol[[assignedM]], currOp)
    times[assignedM] = times[assignedM] + tOperaciones[assignedM, currOp]
    nOM = length(sol[[assignedM]]) #Número de operaciones en la máquina asignada
    if(nOM > 1)
      times[assignedM] = times[assignedM] + tAjuste[[assignedM]][sol[[assignedM]][nOM - 1], sol[[assignedM]][nOM]]
    if(length(assignedOp) == nOperaciones) break
    
    vecFila = matAvg[currOp, ]
    neighborhood = c()
    for(i in 1: nOperaciones){
      if(!(i %in% assignedOp)){
        neighborhood = cbind(neighborhood, c(vecFila[i], i))
      }
    }
    if(ncol(neighborhood) > 1)
      neighborhood = neighborhood[, order(neighborhood[1, ])]
    ranElement = 0
    
    if(ncol(neighborhood) < top) ranElement = neighborhood[2, 1]
    else ranElement = sample(neighborhood[2, 1:top], 1)
    currOp = ranElement
  }
  return(sol)
}
#sol           #Solucion Inicial


timeList <- function(solution, prosecutionTime, adjustmentTime){
  times = c()
  #print(length(solution))
  for(i in 1:length(solution)){
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
  return(times)
}

evaluar <- function(vec, indice, prosecutionTime, maquinas){
  tiempo = 0
  for(i in 1: length(vec)){
    tiempo = tiempo + prosecutionTime[indice, vec[i]]
    if(i!=length(vec)){                                     #No agrego el tiempo de ajuste de la última operacion
      tiempo = tiempo + maquinas[[indice]][vec[i],vec[i+1]]
    }
  }
  return (tiempo)
}



local_search_tabu <- function(iter, initialSol, tenor){
  lista_tabu = c()
  tenor_tabu = tenor
  
  best_of_the_best = initialSol
  
  for(i in 1:iter){
    index_peor = which.max(timeList(initialSol,tOperaciones,tAjuste))
    index_mejor = which.min(timeList(initialSol,tOperaciones,tAjuste))
    
    best = 100000000
    sol = c()
    operacion = 0
    quitar = 0
    
    for(i in 1:length(initialSol[[index_peor]])){  
      for(j in 0:length(initialSol[[index_mejor]])){ 
        
        if(!(initialSol[[index_peor]][i] %in% lista_tabu)){
          vec_aux = initialSol[[index_mejor]]  
          vec_aux = append(vec_aux, initialSol[[index_peor]][i] ,j)      #Agregando operacion a una posicion de la maquina menor
          #cat("nueva solucion -> ",vec_aux,"\n")
          
          aux = evaluar(vec_aux, index_mejor, tOperaciones, tAjuste)
          #cat("solucion evaluada",aux,"\n")
          
          if(aux < best){
            quitar = i
            operacion = initialSol[[index_peor]][i]
            best = aux
            sol = vec_aux
          }
        }
      }
    }
    
    #cat("mejor solucion",sol," valor:", best, " y se agrega en el tabu como: Maquina y posicion que hay que bloquear", operacion)
    
    mejor_solucion = initialSol
    index = c(quitar)
    mejor_solucion[[index_peor]]<-mejor_solucion[[index_peor]][-index]    #quitarle a la peor maquina la operacion
    mejor_solucion[[index_mejor]] = sol
    initialSol = mejor_solucion
    #print(initialSol)   
    
    #Comparacion
    maximo1 = max(timeList(initialSol,tOperaciones,tAjuste))
    maximo2 = max(timeList(best_of_the_best,tOperaciones,tAjuste))
    if(maximo1<maximo2)best_of_the_best = initialSol
    
    
    lista_tabu <- append(lista_tabu, operacion)
    if(length(lista_tabu) > tenor_tabu){
      indice <- c(1)
      lista_tabu <- lista_tabu[-indice]
    }
    
  }
  
  return (best_of_the_best)
}

soluciones = c()
for(i in 1: 50){
  mejor = local_search_tabu(150, Greedy(), 2)
  #print(mejor)
  soluciones = c(soluciones, max(timeList(mejor,tOperaciones,tAjuste)))
}
soluciones
mean(soluciones)
sd(soluciones)
min(soluciones)
max(soluciones)
