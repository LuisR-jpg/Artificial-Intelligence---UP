class Node:
    def __init__(self, data): 
        self.data = data
        self.left = self.right = self.parent = None
        self.balance, self.height = 0, 1
    def __str__(self):
        s = str(self.data)
        s += "\tH: " + str(self.height)
        s += "\tB: " + str(self.balance)
        return s
    def insert(self, node, root):
        if(node.data <= self.data):
            if not self.left:
                self.left = node
                node.parent = self
            else:
                self.left.insert(node, root)
        else:
            if not self.right:
                self.right = node
                node.parent = self
            else: 
                self.right.insert(node, root)
        return self.mbalance(root)
    def mbalance(self, root):
        lheight = self.left.height if self.left else 0
        rheight = self.right.height if self.right else 0
        self.height = max(lheight, rheight) + 1
        self.balance = lheight - rheight
        if self.balance == -2 and self.right.balance <= 0:
            root = self.rotate_left(self, root)
        elif self.balance == -2 and self.right.balance == 1:
            root = self.rotate_right(self.right, root)
            root = self.rotate_left(self, root)
        elif self.balance == 2 and self.left.balance == -1:
            root = self.rotate_left(self.left, root)
            root = self.rotate_right(self, root)
        elif self.balance == 2 and self.left.balance >= 0: 
            root = self.rotate_right(self, root)
        return root
    def rotate_right(self, node, root):
        p = node.parent
        a, b = node, node.left
        sd = b.right
        a.left = sd
        if sd: sd.parent = a
        b.right, a.parent = a, b
        b.parent = p
        if not p:
            a.mbalance(root)
            b.mbalance(root)
            return b
        elif p.left == a: p.left = b
        elif p.right == a: p.right = b
        a.mbalance(root)
        b.mbalance(root)
        return root
    def rotate_left(self, node, root):
        p = node.parent
        b, a = node, node.right
        sd = a.left
        b.right = sd
        if sd: sd.parent = b
        a.left, b.parent = b, a
        a.parent = p
        if not p:
            b.mbalance(root)
            a.mbalance(root)
            return a
        elif p.left == b: p.left = a
        elif p.right == b: p.right = a
        b.mbalance(root)
        a.mbalance(root)
        return root
class AVL:
    def __init__(self):
        self.root = None
    def insert(self, data):
        n = Node(data)
        if not self.root: self.root = n
        else: self.root = self.root.insert(n, self.root)
    def __print_node(self, node, sp):
        s = sp + node.__str__() + "\n"
        if node.left: s += self.__print_node(node.left, sp + "\tL: ")
        if node.right: s += self.__print_node(node.right, sp + "\tR: ")
        return s
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
        #print("Deleted:", n.data)
        if self.root:
            self.root = self.root.mbalance(self.root)
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
        root = n.mbalance(self.root)
        return root
    def __str__(self):
        if self.root: return self.__print_node(self.root, "")
        else: return ""
t = AVL()
#arr = [10, 5, 1]
arr = [72, 66, 81, 18, 60, 53, 48, 27, 10, 50, 9, 40, 45]
#arr = [1, 2, 3, 4, 5, 6]
#arr = [5, 4, 3, 2, 1, 10]
for i in arr:
    t.insert(i)
print(t)
"""
for i in arr:
    t.remove(i)
print(t)
"""
t.remove(48)
print(t)
t.remove(72)
t.remove(66)
t.remove(81)
t.remove(18)
t.remove(60)
t.remove(53)
print(t)
t.remove(27)
t.remove(10)
t.remove(50)
t.remove(9)
t.remove(40)
t.remove(45)
print(t)
