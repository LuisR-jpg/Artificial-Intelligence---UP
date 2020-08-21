def mochila(cap, w, g):
    dic, res, gan = dict(), [], 0
    g.sort(reverse = True)
    for i,j in zip(g, w):
        dic[i] = j
        if dic[i] <= cap:
            cap -= dic[i]
            gan += i
    print("La ganancia sera de:", gan)
    return dic
capacidad, peso, ganancia = 5, [1, 1, 2], [5, 30, 10]
print(mochila(capacidad, peso, ganancia))
