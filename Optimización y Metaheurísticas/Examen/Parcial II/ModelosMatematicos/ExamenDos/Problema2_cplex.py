# Libreria de optimizacion
from docplex.mp.model import Model
import math 

# Cargar los datos

file = open('kcenter-01.txt',"r")

value = file.readline().split()

# Parameters
nPoints =  int(value[0])
nCenters = int(value[1])

file.readline()

coordx = []
coordy = []

for i in range(nPoints):
   value = file.readline().split()
   coordx.append(int(value[1]))
   coordy.append(int(value[2]))

file.close() 


d = [[0 for k in range(nPoints)] for j in range(nPoints)]
for k in range(nPoints):
   for j in range(nPoints):
      d[j][k] = math.sqrt((coordx[j]-coordx[k])**2 + (coordy[j]-coordy[k])**2)     


# construir modelo
m = Model('Problema_examen_2')

# variables de decision
x = {}

for j in range(nPoints):
   for k in range(nPoints):
         x[j,k] = m.binary_var(name='x_'+str(j)+'_'+str(k))

y = {}

for k in range(nPoints):
   y[k] = m.binary_var(name='y_'+str(k))


# funcion objetivo
m.minimize(m.sum(d[j][k]*x[j,k]*y[k] for k in range(nPoints) for j in range(nPoints)))

# Restricciones
m.add_constraint(m.sum(y[k] for k in range(nPoints)) == nCenters)

m.add_constraints(m.sum(x[j,k] for k in range(nPoints)) == 1 for j in range(nPoints))

m.add_constraints(x[j,k] <= y[k] for k in range(nPoints) for j in range(nPoints))

# Escribe modelo para su revision
#m.export_as_lp(basename="docplex_%s", path=".")

# tiempo maximo para el solver
m.parameters.timelimit=60*30
#mdl.parameters.mip.tolerances.mipgap=0.001;

# llamado al solver de optimizacion
solucion = m.solve(log_output=True)

if(solucion):
   print('objective value =', m.sum(d[j][k]*x[j,k].solution_value*y[k].solution_value for k in range(nPoints) for j in range(nPoints)))
   for k in range(nPoints):
         if y[k].solution_value == 1:
            print(y[k].name, end=" ")
   print('\n')

   for k in range(nPoints):
      if y[k].solution_value == 1:
         print('Centro', k)
         for j in range(nPoints):
            if x[j,k].solution_value == 1:
               print(x[j,k].name, end=" ")
         print('\n')

