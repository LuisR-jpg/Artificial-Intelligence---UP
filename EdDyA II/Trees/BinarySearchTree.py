class Node:
    def __init__(self, data):
        self.data = data
        self.left = self.right = None
    def __str__(self):
        return str(self.data)
class BST:
    def __init__(self):
        self.root = None
        print("\tBST()")
    def insert(self, data):
        n = Node(data)
        if not self.root:
            self.root = n
            return
        a = self.root
        while True:
            if n.data <= a.data:
                if a.left: a = a.left
                else:
                    a.left = n
                    return 
            else:
                if a.right: a = a.right
                else: 
                    a.right = n
                    return
    def contains(self, data):
        a = self.root
        if not a: return False
        while a:
            if data == a.data: return True
            elif a.left and data < a.data: a = a.left
            elif a.right and data > a.data: a = a.right
            else: return False
        return False
    def __search(self, data):
        p, n = None, self.root
        while n:
            if data < n.data: p, n = n, n.left
            elif data > n.data: p, n = n, n.right
            else: return p, n
        return None, None
    def remove(self, data):
        p, n = self.__search(data)
        if not n: return
        #print("Parent:", p, "\tNode:", n)
        self.__remove(p, n)
        print("Deleted:", n)
    def __remove(self, p, n):
        if not(n.left or n.right):
            if not p: self.root = None
            elif p.left is n: p.left = None
            elif p.right is n: p.right = None
        elif (not n.left and n.right) or (n.left and not n.right):
            if not p:
                if n.left: self.root = n.left
                elif n.right: self.root = n.right
            elif p.left == n:
                if n.left: p.left = n.left
                elif n.right: p.left = n.right
            elif p.right == n:
                if n.left: p.right = n.left
                elif n.right: p.right = n.right
        elif n.left and n.right: 
            pd, nd = n, n.left
            while nd.right:
                pd = nd
                nd = nd.right
            self.__remove(pd, nd)
            nd.left = n.left
            nd.right = n.right
            if not p: self.root = nd
            elif p.left == n: p.left = nd
            elif p.right == n: p.right = nd
    def printArbol(self, r, i):
        if r.left: self.printArbol(r.left, i + 1)
        for _ in range(i): print("", end = '\t')
        print(r.data)
        if r.right: self.printArbol(r.right, i + 1)
    def __str__(self):
        if self.root: self.printArbol(self.root, 0) 
        else: return "Arbol Vacio"
        return ""
    def preOrden(self):
      self.__preOrden(self.root)
      print()
    def __preOrden(self, r):
      print(r, end = ' ')
      if r.left: self.__preOrden(r.left)
      if r.right: self.__preOrden(r.right)
    def enOrden(self):
      self.__enOrden(self.root)
      print()
    def __enOrden(self, r):
      if r.left: self.__enOrden(r.left)
      print(r, end = ' ')
      if r.right: self.__enOrden(r.right)
    def postOrden(self):
      self.__postOrden(self.root)
      print()
    def __postOrden(self, r):
      if r.left: self.__postOrden(r.left)
      if r.right: self.__postOrden(r.right)
      print(r, end = ' ')
    def BFS(self):
      q= []
      q.append(self.root)
      while len(q):

#BFS, DFS
"""
b = BST()
for i in range(-3, 12):
    b.insert(i)
for i in range(-5, 15):
    print(str(i) + ":\t" + str(b.contains(i)))
print(b)
"""
bst = BST()
bst.insert(10)
bst.insert(3)
bst.insert(15)
bst.insert(1)
bst.insert(6)
bst.insert(14)
bst.insert(18)
bst.insert(5)
bst.insert(9)
bst.insert(13)
bst.insert(20)
bst.insert(8)
bst.preOrden()
bst.enOrden()
bst.postOrden()
print(bst)
for i in range(-5, 15):
    print(str(i) + ":\t" + str(bst.contains(i)))
bst.remove(13)
bst.remove(8)
for i in range(2, 25):
    bst.remove(i)
print(bst)
for i in range(-5, 15):
    print(str(i) + ":\t" + str(bst.contains(i)))
