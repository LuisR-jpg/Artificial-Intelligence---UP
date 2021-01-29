class Node: 
    def __init__(self, data):
        self.prev = None
        self.data = data
        self.next = None
    def __str__(self):
        s = str(self.data)
        s += "\tPrev: " + str(hex(id(self.prev)))
        s += "\t&: " + str(hex(id(self)))
        s += "\tNext: " + str(hex(id(self.next)))
        return s
class DoublyLinkedList:
    def __init__(self):
        self.first = None
        self.last = None
    def push_front(self, data):
        n = Node(data)
        if self.first is None: self.first = self.last = n
        else:
            n.next = self.first
            self.first.prev = n
            self.first = n
    def push_back(self, data):
        n = Node(data)
        if self.last is None: self.first = self.last = n
        else:
            n.prev = self.last
            self.last.next = n
            self.last = n
    def pop_front(self):
        if self.first is None: return
        if self.first is self.last: self.first = self.last = None
        else:
            self.first = self.first.next
            self.first.prev = None
    def pop_back(self):
        if self.last is None: return
        if self.first is self.last: self.first = self.last = None
        else:
            self.last = self.last.prev
            self.last.next = None
    def remove(self, data):
        aux = self.first
        while aux is not None and aux.data is not data: aux = aux.next
        if aux is None: return -1
        if aux is self.first: self.first = aux.next
        if aux is self.last: self.last = aux.prev
        if aux.prev is not None: aux.prev.next = aux.next
        if aux.next is not None: aux.next.prev = aux.prev
        aux = None
    def print_reverse(self):
        if self.last is None: return "[]"
        s, aux = "", self.last
        while aux is not None:
            s += str(aux) + '\n'
            aux = aux.prev
        return s
    def __str__(self):
        if self.first is None: return "[]"
        s, aux = "", self.first
        while aux is not None:
            s += str(aux) + '\n'
            aux = aux.next
        return s
l = DoublyLinkedList()
l.pop_front()
l.pop_back()
l.remove(5)
l.push_front(10)
l.push_front(5)
l.push_back(6)
l.push_back(4)
l.remove(5)
print(l)
print()
print(l.print_reverse())
