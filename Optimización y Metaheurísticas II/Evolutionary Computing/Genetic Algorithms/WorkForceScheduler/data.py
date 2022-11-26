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
#people = {"Karlita": ["damas", "niños"], "Lalito": ["cajas", "damas"], "Gabita": ["niños", "cajas"], "Luisito": ["caballeros", "cajas"]}
"""
people = {
    "Samantha": ["Damas", "Lenceria"],
    "Luz": ["Damas", "Ninas"],
    "Sonia": ["Damas", "Moda joven"],
    "Laura": ["Damas", "Moda joven"],
    "Maira": ["Damas", "Dama madura"],
    "Gloria": ["Zapateria", "Zapateria damas"],
    "Fernanda": ["Zapateria", "Zapato deportivo"],
    "Marisol": ["Zapateria", "Zapato caballero"],
    "Susy": ["Zapateria", "Zapato caballero"],
    "Diana": ["Jugueteria"],
    "Brayan": ["Perfumeria"],
    "Nallely": ["Cajas ropa"],
    "Marlette": ["Cajas ropa"],
    "Lucia": ["Caballeros"],
    "Fabian": ["Caballeros", "Ninos"],
    "Alberto": ["Caballeros"],
    "Elena": ["Paqueteria"], # Someone from caballeros tiene que cubrir paqueteria
    "Nancy": ["Caballeros", "Bebes"],
    "Andrea": ["Caballeros", "Bebes"],
}

# Esta semana es inventario de caballeros
# Un descanso y medio a la semana
# Domingo cuenta como medio
# Nadie del area descansa cuando hay inventario en miercoles y jueves
# Personas de la misma area grande no pueden descansar el mismo dia
