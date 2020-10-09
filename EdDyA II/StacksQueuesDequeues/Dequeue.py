class Node:
  def __init__(self, data):
    self.prev = self.next = None
    self.data = data
class Dequeue:
  def __init__(self): self.first = self.last = None
  def push_front(self, data):
    n = Node(data)
    if not self.first: last = n
    n.next = self.first
    self.first = n
  def push_back(self, data):
    n = Node(data)
    if not self.last: self.first = n
    n.prev = self.last
    self.last = n
  def pop_front(self):
    if not self.first: return
    b = self.first.data
    self.first = self.first.next
    if self.first: self.first.prev = None
    else: self.last = None
    return b
  def pop_back(self):
    if not self.last: return
    b = self.last.data
    self.last = self.last.prev
    if self.last: self.last.next = None
    else: self.first = None
    return b
  def front(self):
    if not self.first: return
    return self.first.data
  def back(self):
    if not self.last: return
    return self.last.data
  def isEmpty(self):
    return False if self.first else True
d = Dequeue()
print(d.isEmpty())
for i in range(10):
  d.push_back(i)
print(d.isEmpty())
for i in range(10):
  print(d.back())
print(d.isEmpty())
for i in range(10):
  print(d.pop_back())
print(d.isEmpty())
print(d.isEmpty())
for i in range(10):
  d.push_front(i)
print(d.isEmpty())
for i in range(10):
  print(d.front())
print(d.isEmpty())
for i in range(10):
  print(d.pop_front())
print(d.isEmpty())
