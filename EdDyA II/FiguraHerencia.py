class Figura:
    def __init__(self, nombre, color):
        self.__nombre = nombre
        self.__color = color
    @property
    def nombre(self):
        return self.__nombre
    @nombre.setter
    def nombre(self, nombre):
        self.__nombre = nombre
    @property
    def color(self):
        return self.__color
    @color.setter
    def color(self, color):
        self.__color = color
    def calcular_perimetro(self): pass
    def calcular_area(self): pass
    def __str__(self):
        return "La figura es un " + self.__nombre + " de color " + self.__color
class Rectangulo(Figura):
    def __init__(self, nombre, color, base = 1, altura = 1):
        Figura.__init__(self, nombre, color)
        self.__base = base
        self.__altura = altura
    @property
    def altura(self):
        return self.__altura
    @altura.setter
    def altura(self, altura):
        if( altura > 0 ): self.__altura = __altura
        else: print("Altura asignada no valida")
    @property
    def base(self):
        return self.__base
    @base.setter
    def base(self, base):
        if( base > 0 ): self.__base = base
        else: print("Base asignada no valida")
    def calcular_perimetro(self):
        return 2*base + 2*altura
    def calcular_area(self):
        return base*altura
    def __str__(self):
        return str(Figura) + " con base = " + str(self.__base) + " y altura = " + str(self.__altura)
print(Figura("Figurita", "magenta"))
print(Rectangulo("recti", "negro black"))
