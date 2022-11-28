import numpy as np

def rules(solution, breaks, areas, inventario, people, domingos, desc = False):
    faults = []
    fitness = 0
    descanso = np.where(breaks == "Descansa")[0]
    manana = np.where(breaks == "Mañana")[0]
    tarde = np.where(breaks == "Tarde")[0]
    comida = np.where(breaks == "Comida")[0]
    highPriority, mediumPriority, lowPriority = 100, 10, 1
    for i, p in enumerate(solution):
        # Inventario
        if inventario == areas[i][len(areas[i]) - 1]:
            if p[2] in [descanso, manana, tarde]:
                faults.append("Persona {} descansa el miercoles y tiene inventario".format(i))
                fitness -= highPriority
            if p[3] in [descanso, manana, tarde]:
                faults.append("Persona {} descansa el jueves y tiene inventario".format(i))
                fitness -= highPriority

        # Maximize time by area
        

        # Specificas de la semana
        if people[i] == "Samanta" and p[5] != descanso:
            fitness -= mediumPriority
            faults.append("Samanta necesita los sabados")
        if people[i] == "Maira" and p[5] != descanso:
            fitness -= mediumPriority
            faults.append("Maira quiere el miercoles")
        if people[i] == "Elena" and p[5] != descanso:
            fitness -= mediumPriority
            faults.append("Elena descansa los lunes")
        if people[i] == "Nancy" and p[4] != descanso:
            fitness -= mediumPriority
            faults.append("Nancy quiere el viernes")
        if people[i] == "Marisol" and p[1] != descanso:
            fitness -= mediumPriority 
            faults.append("Marisol quiere el martes")
        if people[i] == "Marlette" and p[0] != descanso:
            fitness -= mediumPriority
            faults.append("Marlette necesita lunes")

    if desc: return fitness, faults
    return fitness

"""
Descansos
    0 Todo el día
    1 9 - 1
    ...
    5
"""
#breaks = np.array(["12 - 2", "2 - 4", "4 - 6", "MañanaDomingo", "Descansa", "Mañana", "Tarde"])
#codigos = np.array(["12", "2", "4", "M", "D", "M", "T"])
#breaks = np.array(["Comida", "MañanaDomingo", "Descansa", "Mañana", "Tarde"])
#codigos = np.array(["C", "M", "D", "M", "T"])
breaks = np.array(["Comida", "Descansa", "Mañana", "Tarde"])
codigos = np.array(["C", "D", "M", "T"])
domingos = ["Sonia", "Nancy", "Alberto", "Diana", "Susy"]

"""
People
    Karlita
    Lalito
    Gabita
    Luisito    

    #people = {"Karlita": ["damas", "niños"], "Lalito": ["cajas", "damas"], "Gabita": ["niños", "cajas"], "Luisito": ["caballeros", "cajas"]}

"""
#people = ["Samanta", "Luz", "Sonia", "Laura", "Maira", "Gloria", "Fernanda", "Marisol", "Susy", "Diana", "Brayan", "Nallely", "Marlette", "Lucia", "Fabian", "Alberto", "Elena", "Nancy", "Andrea", "Alma"]
people = ["Samanta", "Luz", "Laura", "Maira", "Gloria", "Fernanda", "Marisol", "Susy", "Diana", "Brayan", "Nallely", "Marlette", "Lucia", "Fabian", "Alberto", "Elena", "Nancy", "Andrea"]
areas = [
    ["Damas", "Lenceria"],              #Samanta
    ["Damas", "Ninas"],                 #Luz
    #["Damas", "Moda joven"],            #Sonia
    ["Damas", "Moda joven"],            #Laura
    ["Damas", "Dama madura"],           #Maira
    ["Zapateria", "Zapateria damas"],   #Gloria
    ["Zapateria", "Zapato deportivo"],  #Fernanda
    ["Caballeros", "Bebes"],            #Marisol
    ["Zapateria", "Zapato caballero"],  #Susy
    ["Jugueteria"],                     #Diana
    ["Perfumeria"],                     #Brayan
    ["Cajas ropa"],                     #Nallely   
    ["Cajas ropa"],                     #Marlette
    ["Caballeros"],                     #Lucia
    ["Caballeros"],                     #Fabian
    ["Zapateria", "Zapato caballero"],  #Alberto
    ["Paqueteria"],                     #Elena
    ["Caballeros", "Ninos"],            #Nancy
    ["Caballeros", "Bebes"],            #Andrea
    #["Auxiliar"]                        #Alma
]

inventario = "Caballeros"