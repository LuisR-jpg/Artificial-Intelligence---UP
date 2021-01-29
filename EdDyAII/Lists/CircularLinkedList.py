class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
    def __str__(self):
        s = str(self.data)
        s += "\t&: " + str(hex(id(self)))
        s += "\tNext: " + str(hex(id(self.next)))
        return s
class CircularLinkedList:
    def __init__(self):
        self.first = None
    def insert_head(self, data):
        n = Node(data)
        if self.first is None:
            self.first = n
            n.next = n
            return
        n.next = aux = self.first
        while aux.next is not self.first:
            aux = aux.next
        aux.next = self.first = n
    def insert_tail(self, data):
        n = Node(data)
        if self.first is None: 
            self.first = n
        else: 
            aux = self.first
            while aux.next is not self.first:
                aux = aux.next
            aux.next = n
        n.next = self.first
    def remove(self, data):
        if self.first is None: return -1
        if self.first is self.first.next and self.first.data is data:
            self.first = None
            return
        aux = self.first
        while aux.next is not self.first: aux = aux.next
        while aux.next.data is not data:
            aux = aux.next
            if aux.next is self.first: break
        if aux.next.data is not data: return
        if aux.next is self.first: self.first = self.first.next
        aux.next = aux.next.next
    def __str__(self):
        if self.first is None: return "[]"
        s, aux = str(self.first) + '\n', self.first.next
        while aux is not self.first:
            s += str(aux) + '\n'
            aux = aux.next
        return s
l = CircularLinkedList()
l.insert_tail(5)
l.insert_tail(10)
l.insert_tail(15)
l.insert_tail(22)
l.insert_head(22)
l.remove(10)
print(l)
