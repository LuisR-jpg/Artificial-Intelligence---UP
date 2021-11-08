myFile = read.delim(file.choose(), header = FALSE, sep = " ")
nOperaciones = myFile[1, 1]
nMaquinas = myFile[1, 2]
rows = 1 + nMaquinas
#unlist(myFile[2: 4, 1: 10])
tOperaciones = matrix(unlist(myFile[2: rows, 1: nOperaciones]), byrow = FALSE, nrow = nMaquinas)
tAjuste = list()
typeof(tAjuste)
for(i in 1: nMaquinas){
  nRow = 5 + 10*(i - 1)
  nRowE = nRow + nOperaciones - 1
  m = matrix(unlist(myFile[nRow: nRowE, 1: nOperaciones]), byrow = FALSE, nrow = nOperaciones)
  tAjuste[[i]] = m
}
print(nOperaciones)
print(nMaquinas)
print(tOperaciones)
print(tAjuste)
