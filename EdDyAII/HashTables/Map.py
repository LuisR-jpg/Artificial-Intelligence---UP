class Map:
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
      s += ord(dato[i])*(26**i);
      s %= self.si
    return s
  def insert(self, k, v):
    pos = self.getVal(k)
    for i in self.hasht[pos]:
      if i[0] == k:
        i[1] = v
        return
    self.hasht[pos].append((k, v))
  def remove(self, k):
    pos = self.getVal(k)
    if not self.hasht[pos]: return
    a = self.hasht[0]
    for i in self.hasht[pos]: 
      if i[0] == k:
        a = i
        break
    self.hasht[pos].remove(a)
  def contains(self, k):
    pos = self.getVal(k)
    for i in self.hasht[pos]:
      if i[0] == k: return True
    return False
  def get(self, k):
    pos = self.getVal(k)
    for i in self.hasht[pos]:
      if i[0] == k: return i[1]
  def __str__(self):
    s = ""
    for i in self.hasht:
      if i: 
        for j in i:
          s += "(" + j[0] + "," + j[1] + ")"
    return s + "\n"
m = Map()
print(m.contains("hola"))
m.insert("hola", "hola")
print(m.contains("hola"))
m.remove("adios")
#print(m)
m.insert("Lalito", "robles")
print(m)
m.remove("Lalito")
m.remove("hola")
print(m)
m.insert("jaja", "asies")
print(m.get("jaja"))

