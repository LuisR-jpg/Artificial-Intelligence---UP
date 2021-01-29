#Devuelve la cantidad en monedas en base a una denominación 
def monedas(cantidad, denominaciones):
    dic = dict()
    for i in denominaciones:
        dic[i] = cantidad // i
        cantidad %= i
    return dic
print(monedas(int(input("Ingrese la cantidad: ")), [100, 50, 20, 10, 5, 2, 1]))
