num = input("Por favor, introduzca un numero: ")
#print(num, ("" if "5" in num else "no ") + "tiene el numero 5")
print(num, ("" if num.count("5") else "no ") + "tiene el numero 5")
