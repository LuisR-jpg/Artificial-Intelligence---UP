word = input("Ingresa algo: ")
word = word.lower().replace(' ', "")
print(("Es" if word == word[::-1] else "No es"), "palindromo.")
