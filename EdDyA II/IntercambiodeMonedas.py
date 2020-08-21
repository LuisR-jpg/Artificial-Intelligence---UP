#Devuelve la cantidad en monedas en base a una denominación 
def monedas(cantidad, denominaciones):
    dic = dict()
    for i in denominaciones:
        dic[i] = cantidad // i
        cantidad %= i
    return dic
print(monedas(87, [50, 10, 5, 2, 1]))
