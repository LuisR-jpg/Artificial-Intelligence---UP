con = input("Ingresa una contraseña: ")
print("Es" if not con.isalpha() and len(con) > 7 and con != con.upper() and con != con.lower() else "No es", "valida")
