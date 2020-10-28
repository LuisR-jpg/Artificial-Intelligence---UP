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
    def printArbol(self, r, i):
        if r.left: self.printArbol(r.left, i + 1)
        for _ in range(i): print("", end = '\t')
        print(r.data)
        if r.right: self.printArbol(r.right, i + 1)
    def __search(self, data):
        """
        if not self.root: return None, None
        p, n = None, self.root
        while True:
            if data == n.data: return p, n
            elif data < n.data:
                p = n
                n = n.left
            elif data > n.data:
                p = n
                n = n.right
            if not n: return None, None
            """
        p, n = None, self.root
        while n:
            if data < n.data: p, n = n, n.left
            elif data > n.data: p, n = n, n.right
            else: return p, n
        return None, None
    def remove(self, data):
        p, n = self.__search(data)
        if not n: return
        print("Parent:", p, "\tNode:", n)
        if not(n.left or n.right):
            print("Caso 1:")
            if not p: self.root = None
            elif p.left is n: p.left = None
            elif p.right is n: p.right = None
            print("Deleted:", n.data)
        elif (not n.left and n.right) or (n.left and not n.right):
            print("Caso 2:")
        elif n.left and n.right: 
            print("Caso 3:")
        #elif (node.left is None and node.right is not None) or (node.left is not None and node.right is None):
    def __str__(self):
        if self.root: self.printArbol(self.root, 0) 
        else: return "Arbol Vacio"
        return ""

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
print(bst)
bst.remove(13)
bst.remove(8)
print(bst)
