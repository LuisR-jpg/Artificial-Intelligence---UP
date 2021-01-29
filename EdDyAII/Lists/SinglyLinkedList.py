class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
    def __str__(self):
        s = str(self.data)
        s += "\t&: " + str(hex(id(self)))
        s += "\tNext: " + str(hex(id(self.next)))
        return s
class SinglyLinkedList:
    def __init__(self):
        self.first = None
    def insert_head(self, data):
        n = Node(data)
        n.next = self.first
        self.first = n
    def insert_tail(self, data):
        n = Node(data)
        if self.first is None:
            self.first = n
        else:
            aux = self.first
            while aux.next is not None:
                aux = aux.next
            aux.next = n
    def remove(self, data):
        if self.first is None: return
        aux = Node(None)
        aux.next = self.first
        while aux.next is not None and aux.next.data is not data:
            aux = aux.next
        if aux.next is self.first: self.first = self.first.next
        if aux.next is not None: aux.next = aux.next.next
        else: return -1
    def __str__(self):
        if self.first is None: return "[]"
        s, aux = "", self.first
        while aux is not None:
            s += str(aux) + '\n'
            aux = aux.next
        return s
l = SinglyLinkedList()
l.insert_head(5)
l.insert_tail(10)
l.remove(5)
l.insert_head(5)
l.remove(10)
l.insert_tail(10)
l.remove(7)
print(l)
