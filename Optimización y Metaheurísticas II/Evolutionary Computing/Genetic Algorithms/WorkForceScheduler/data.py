import numpy as np

def rules(solution, breaks, people):
    fitness = 0
    for p in solution:
        # Descansa
        if np.count_nonzero(p == 5) == 1: fitness += 1 
        # Medio día
        if np.count_nonzero(p == 6) + np.count_nonzero(p == 7) == 1: fitness += 1
    return fitness

"""
Descansos
    0 Todo el día
    1 9 - 1
    ...
    5
"""
breaks = ["12 - 2", "1 - 3", "2 - 4", "3 - 5", "4 - 6", "Descansa", "Mañana", "Tarde"]

"""
People
    Karlita
    Lalito
    Gabita
    Luisito    
"""
people = {"Karlita": ["damas", "niños"], "Lalito": ["cajas", "damas"], "Gabita": ["niños", "cajas"], "Luisito": ["caballeros", "cajas"]}
