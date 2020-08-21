def mochila(cap, w, g):
    ganancia, objeto, gan, res = 0, [(a, b/a, i) for i, (a, b) in enumerate(zip(w, g))], 0, [0]*len(w)
    objeto.sort(reverse = True, key = lambda tup: tup[1])
    for i in objeto:
        if cap > i[0]:
            res[i[2]] = 1
            cap -= i[0]
            ganancia += i[1] * i[0]
    print("La ganancia es de:", ganancia)
    return res
capacidad, peso, ganancia = 3, [1, 1, 2], [5, 30, 10]
print(mochila(capacidad, peso, ganancia))
