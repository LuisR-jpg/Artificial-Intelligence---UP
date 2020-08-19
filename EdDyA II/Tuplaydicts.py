tupla =(( 'Aguascalientes','mujer'), ('Zacatecas','hombre'), ('Guanajuato','mujer'), ('Zacatecas','mujer'), ('Durango','hombre'), ('Aguascalientes','hombre'), ('Zacatecas','hombre'), ('Jalisco','hombre'), ('Zacatecas','hombre'),('Zacatecas','mujer'))
dic = dict()
for i in tupla:
    if( (x := dic[i[0]]) > 0 ): x += 1
    else: x = 1
print(dic)

