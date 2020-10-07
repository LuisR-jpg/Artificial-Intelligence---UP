class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
    def __str__(self):
        s = str(self.data)
        s += "\t&: " + str(hex(id(self)))
        s += "\tNext: " + str(hex(id(self.next)))
        return s
class Stack:
    def __init__(self): self.first = None
    def push(self, data):
        n = Node(data)
        n.next = self.first
        self.first = n
    def pop(self):
        a = self.first
        if not a: return
        self.first = self.first.next
        return a
    def top(self): return self.first
    def isEmpty(self):
        if self.first is None: return True
        return False
s = Stack()
#s.push(2)
#s.push(10)
#print(s.isEmpty())
#print(s.top())
#print(s.pop())
#print(s.top())
#print(s.pop())
#print(s.top())
print(s.pop())
print(s.isEmpty())
