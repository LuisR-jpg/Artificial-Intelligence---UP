listA, listB, listC = ["a", "b", "c", "d", "e"], [1, 2, 3, 4, 5], []
#listC = [item for sublist in zip(listA, listB) for item in sublist]
for a, b in zip(listA, listB): listC.extend((a, b))
print(listC)
