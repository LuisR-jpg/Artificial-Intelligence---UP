# Lecturaaa
myFile = read.delim(file = "C:/Users/lalor/Documents/Git/School/Optimización y Metaheurísticas/Examen/Parcial II/kcenter-01.txt", header = FALSE, sep = "\t")

# Informacion
nPuntos = myFile[1, 1]
nCentros = myFile[1, 2]
points = myFile[2: 241, ]
soluciones = c()
centros = c()
bsol = c()
sol = c()

# Funcion Objetivo
dist <- function(v){ # Suma total de las distancias
  suma = 0
  for(i in 1: length(v))
    suma = suma + eDist(i, v[i])
  return(suma)
}

# Euclidean Distance
eDist <- function(pU, pD){
  return(sqrt((points[pU, 2] - points[pD, 2])^2 + (points[pU, 3] - points[pD, 3])^2))
}

# Conseguir centros
getCentros <- function(){
  cent = c()
  repeat{
    peque = 10000
    cent = sample(1: nPuntos, nCentros)
    for(i in cent)
      for(j in cent)
        if(i != j)
          peque = min(c(peque, eDist(i, j)))
    if(peque > 175) break
  }
  return(cent)
}

#Busqueda Aleatoria Localizada
busquedaLocalizada <- function(it){
  centros = getCentros()
  x = rep(sample(centros, 1), nPuntos)
  for(i in 1: it){
    vSwap = sample(1: nPuntos, 25)
    for(j in vSwap){
      mDist = eDist(j, x[j])
      for(k in centros){
        if(eDist(k, j) < mDist){
          mDist = eDist(k, j)
          x[j] = k
        }
      }
    }
  } 
  dist(x)
  return(x)
}

for(i in 1: 50){
  sol = busquedaLocalizada(50)
  soluciones = c(soluciones, dist(sol))
  if(i == 1 || dist(sol) < dist(bsol))
    bsol = sol
}

soluciones
min(soluciones)
max(soluciones)
sd(soluciones)
mean(soluciones)

# Grafica
plot(points[, 2], points[, 3], col = "black", pch = 20, xlab = "x", ylab = "y")
for(i in 1: length(bsol)){
  segments(points[i, 2], points[i, 3], points[bsol[i], 2], points[bsol[i], 3])
  if(bsol[i] == i) centros = c(centros, i)
}
points(points[centros, 2], points[centros, 3], col = "red", pch = 19)

mPoints = matrix()
sumas = c()

print(centros)

for(i in centros){
  sumita = 0
  centro = c(i)
  for(j in 1: length(bsol)){
    if(bsol[j] == i && j != i){
      centro = c(centro, j)
      sumita = sumita + eDist(i, j)
    }
  }
  print(centro)
  sumas = c(sumas, sumita)
}
print(sumas)