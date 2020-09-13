"""
def mochila(cap, w, g):
    ganancia, objeto, res = 0, [(a, b/a, i) for i, (a, b) in enumerate(zip(w, g))], [0]*len(w)
    objeto.sort(reverse = True, key = lambda tup: tup[1])
    for i in objeto:
        if cap >= i[0]:
            res[i[2]] = 1
            cap -= i[0]
            ganancia += i[1] * i[0]
    print("La ganancia es de:", ganancia)
    return res
"""
def mochila(c, p, g):
    gana = 0
    res = [0]*len(p)
    obj = [(g/w, w, g) for w, g in zip(p, g)]
    obj.sort(reverse = True, key = lambda tup: tup[0])
    print(obj)
    for i, o in enumerate(obj):
        if c >= o[1]:
            gana += o[2]
            c -= o[1]
            res[i] = 1
    print(gana)
    return res
capacidad, peso, ganancia = 10, [5, 3, 8], [1, 9, 16]
#capacidad, peso, ganancia = 5, [1, 2, 2, 2], [5, 3, 2, 20]
#capacidad, peso, ganancia = 20, [20, 10, 5], [1, 5, 5]
print(mochila(capacidad, peso, ganancia))
