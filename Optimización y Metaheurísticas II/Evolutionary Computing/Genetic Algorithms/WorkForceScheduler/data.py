import numpy as np

def rules(solution, breaks, areas, inventario, people, desc = False):
    faults = []
    fitness = 0
    descanso = np.where(breaks == "Descansa")[0]
    manana = np.where(breaks == "Mañana")[0]
    tarde = np.where(breaks == "Tarde")[0]
    mananaDomingo = np.where(breaks == "MañanaDomingo")[0]
    for i, p in enumerate(solution):
        # Descansa
        if np.count_nonzero(p == descanso) != 1:
            fitness -= 1
            faults.append("Persona {} no tiene un descanso".format(i))

        # Medio día
        if np.count_nonzero(p == manana) + np.count_nonzero(p == tarde) != 1:
            fitness -= 1
            faults.append("Persona {} no tiene un medio dia".format(i))

        # Domingo
        if p[6] in [descanso, tarde, mananaDomingo]:
            fitness -= 1
            faults.append("Persona {} tiene descanso o tarde libre el domingo".format(i))
        if p[6] == manana and not mananaDomingo in p:
            fitness -= 1
            faults.append("Persona {} trabaja domingo y no entra tarde ningún día".format(i))
        if mananaDomingo in p and p[6] != manana:
            fitness -= 1
            faults.append("Persona {} entra tarde pero no tiene domingo".format(i))
        domingos = ["Sonia", "Nancy", "Alberto", "Diana", "Susy"]
        if people[i] in domingos and p[6] != manana:
            fitness -= 1 
            faults.append("Persona {} le corresponde domingo y no tiene".format(i))

        # Inventario
        if inventario == areas[i][len(areas[i]) - 1]:
            if p[2] in [descanso, manana, tarde]:
                faults.append("Persona {} descansa el miercoles y tiene inventario".format(i))
                fitness -= 1
            if p[3] in [descanso, manana, tarde]:
                faults.append("Persona {} descansa el jueves y tiene inventario".format(i))
                fitness -= 1

        # Personas de la misma area no pueden descansar ni comer juntas
        e = 0
        for ia, a in enumerate(solution):
            if i != ia and areas[i][0] == areas[ia][0] and np.sum(a == p):
                c = np.where(a == p)
                for col in c[0]:
                    e += 1
                    faults.append("Persona {} {} igual que {}".format(i, "descansa" if p[col] in [manana, tarde, descanso, mananaDomingo] else "come", ia))
        fitness -= e / 2

        # Specificas de la semana
        if people[i] == "Sonia" and (p[1:] != descanso).any():
            fitness -= np.sum(p[1:] != descanso)
            faults.append("Sonia tiene vacaciones y trabaja {} dias".format(np.sum(p[1:] != descanso)))
        if people[i] == "Alma" and (p != descanso).any():
            fitness -= 1
            faults.append("Alma tiene vacaciones y trabaja {}".format(np.sum(p != descanso)))
        if people[i] == "Samanta" and p[5] != descanso:
            fitness -= 1
            faults.append("Samanta necesita los sabados")
        if people[i] == "Maira" and p[5] != descanso:
            fitness -= 1
            faults.append("Maira quiere el miercoles")
        if people[i] == "Elena" and p[5] != descanso:
            fitness -= 1
            faults.append("Elena descansa los lunes")

    if desc: return fitness, faults
    return fitness

"""
Descansos
    0 Todo el día
    1 9 - 1
    ...
    5
"""
breaks = np.array(["12 - 2", "2 - 4", "4 - 6", "MañanaDomingo", "Descansa", "Mañana", "Tarde"])

"""
People
    Karlita
    Lalito
    Gabita
    Luisito    

    #people = {"Karlita": ["damas", "niños"], "Lalito": ["cajas", "damas"], "Gabita": ["niños", "cajas"], "Luisito": ["caballeros", "cajas"]}

"""
people = ["Samanta", "Luz", "Sonia", "Laura", "Maira", "Gloria", "Fernanda", "Marisol", "Susy", "Diana", "Brayan", "Nallely", "Marlette", "Lucia", "Fabian", "Alberto", "Elena", "Nancy", "Andrea", "Alma"]
areas = [
    ["Damas", "Lenceria"],
    ["Damas", "Ninas"],
    ["Damas", "Moda joven"],
    ["Damas", "Moda joven"],
    ["Damas", "Dama madura"],
    ["Zapateria", "Zapateria damas"],
    ["Zapateria", "Zapato deportivo"],
    ["Zapateria", "Zapato caballero"],
    ["Zapateria", "Zapato caballero"],
    ["Jugueteria"],
    ["Perfumeria"],
    ["Cajas ropa"],
    ["Cajas ropa"],
    ["Caballeros"],
    ["Caballeros", "Ninos"],
    ["Caballeros"],
    ["Paqueteria"],
    ["Caballeros", "Bebes"],
    ["Caballeros", "Bebes"],
    ["Auxiliar"]
]

inventario = "Caballeros"