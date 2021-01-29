class Node:
  def __init__(self, data):
    self.data = data
    self.next = None
  def __str__(self):
    s = str(self.data)
    s += "\t&: " + str(hex(id(self)))
    s += "\tNext: " + str(hex(id(self.next)))
    return s
class Queue:
    def __init__(self): self.first = self.last = None
    def push(self, data):
      n = Node(data)
      if not self.first: self.first = n
      else: self.last.next = n
      self.last = n
    def pop(self):
      if not self.first: return
      a = self.first.data 
      self.first = self.first.next
      return a
    def top(self):
      if not self.first: return
      return self.first.data
    def isEmpty(self):
      if self.first: return False
      return True
s = Queue()
print(s.top())
print(s.pop())
s.push(2)
s.push(10)
print(s.isEmpty())
print(s.top())
print(s.pop())
print(s.top())
print(s.pop())
print(s.top())
print(s.pop())
print(s.isEmpty())
