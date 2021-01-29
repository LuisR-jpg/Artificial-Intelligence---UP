class Set:
  def __init__(self):
    self.si = 1000
    self.hasht = [[]]
    for i in range(self.si):
      self.hasht.append([])
  def getVal(self, dato):
    if isinstance(dato, int):
      return dato % self.si
    s = 0
    for i in range(len(dato)):
      s += ord(dato[i])*(26**i)
      s %= self.si
    return s
  def insert(self, v):
     pos = self.getVal(v)
     if not v in self.hasht[pos]:
       self.hasht[pos].append(v)
  def remove(self, v):
    pos = self.getVal(v)
    if v in self.hasht[pos]:
      self.hasht[pos].remove(v)
  def contains(self, v):
    pos = self.getVal(v)
    return v in self.hasht[pos]
  def __str__(self):
    s = ""
    for i in self.hasht:
      if i:
        for j in i:
          s += "(" + str(j) + ")"
    return s + "\n"
s = Set()
print(s.contains("hola"))
s.insert("hola")
s.insert(10)
print(s.contains(100))
print(s.contains("hola"))
print(s)
s.remove("adios")
s.remove("hola")
print(s)
s.remove(10)
print(s)
