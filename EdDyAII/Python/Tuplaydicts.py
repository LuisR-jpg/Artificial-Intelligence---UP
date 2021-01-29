tupla =(( 'Aguascalientes','mujer'), ('Zacatecas','hombre'), ('Guanajuato','mujer'), ('Zacatecas','mujer'), ('Durango','hombre'), ('Aguascalientes','hombre'), ('Zacatecas','hombre'), ('Jalisco','hombre'), ('Zacatecas','hombre'),('Zacatecas','mujer'))
dic = dict()
for i in tupla:
    if( dic.get(i[0]) == None ):
        dic[i[0]] = dict.fromkeys(["hombre", "mujer"], 0)
    dic[i[0]][i[1]] += 1
for i in dic:
    print(i, "tiene", dic[i]["hombre"], "hombres y", dic[i]["mujer"], "mujeres.")
