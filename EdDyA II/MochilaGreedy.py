def mochila(cap, w, g):
    ganancia, objeto, res = 0, [(a, b/a, i) for i, (a, b) in enumerate(zip(w, g))], [0]*len(w)
    objeto.sort(reverse = True, key = lambda tup: tup[1])
    for i in objeto:
        if cap > i[0]:
            res[i[2]] = 1
            cap -= i[0]
            ganancia += i[1] * i[0]
    print("La ganancia es de:", ganancia)
    return res
capacidad, peso, ganancia = 7, [1, 2, 2, 2], [5, 3, 2, 20]
print(mochila(capacidad, peso, ganancia))
