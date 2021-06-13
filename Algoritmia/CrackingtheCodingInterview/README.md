# VI. Big O 38-59
  Metric used to describe the efficiency of algorithms.
  - Big O. Upper bound
  - Big Omega. Lower bound
  - Big theta. Tight bound
  ## Space Complexity.
    It is different to the time complexity.
  ## Drop the constants.
    Big O notation only describes the slope.
  ## Multi-part algorithms.
    ### O(A + B)
      for(auto x: a) cout << 1;
      for(auto x: b) cout << 0;
    ### O(AB) 
      for(auto x: a) 
        for(auto y: b) 
          cout << 10;
  ## Amortized Time
    If complexity changes depending on the case, try to consider both complexities and generalize.
  ## logn runtimes
    Appears commonly the number of elements is divided by two.
  ## Recursive runtimes
    When you have a recursive function that makes multiple calls, the complexity is often O(branches^depth)

IX. Interview Questions
  Data Structures.
    Arrays and Strings
      Hash tables.
        A key is assigned to the values and it is located at a position of an array, so the lookup time is O(1) most of the times.
      Resizable arrays. 
        Most of the times, a resizable arrays doubles its size if the capacity is exceeded, this still has O(1) complexity for insertions. n + n/2 + n/4... is almost 2n.
      Stringbuilder.
        Concatenating n strings of length x takes O(xn²), a StringBuilder is a resizable array that is converted to string only when needed.
      Interview Questions.     
        1.1 Is Unique. Sorting.
        1.2 Check Permutation. Sorting.
        1.3 URLify. Traverse backwards.
        1.4 Palindrome Permutation. Sort, set.
        1.5 One away. Edit distance, check char by char, if not equal, start from the back.
        1.6 String compression. Another string, pointer and compress.
        1.7 Rotate Matrix. *
        1.8 Zero Matrix. Set of rows, set of columns.
        1.9 String Rotation. *
    Linked lists.
      Data structure that represents a sequence of nodes. Every node points to others.
    Stacks and Queues.
      Stack. LIFO
      Queue. FIFO
	3.1 Three in one. *
	3.2 Stack Min. Some kind of DP? Save every item with the smallest so far.
	3.3 Stack of Plates. Ez
	3.4 Queue via stacks. *O(n) approach, is it the best?
	3.5 Sort Stack. Original stack is already sorted. Pop every element smaller than the one you are pushing.
	3.6 Animal Shelter. It's only a pair of queues. Isn't it?
    Trees and Graphs.
      Trees are a kind of graph, it has no cycles, it has a root, every node may have children.
      A node is called a leaf if it has no children.
      Binary Tree.
	Every node has up to two children.
	Binary Search Tree.
	  Every descendant from the left is <= than any right descendant.
	Balanced trees.
	  AVL and Red-Black trees ensure to find and search elements in O(logn)
	Complete binary tree.
	  The only level able to be not filled is the last one, in that case, it's filled from left to right.
	Full Binary Trees.
	  Every node has either two or zero children.
	Perfect binary trees.
	  These trees are both full and complete. This means every leaf are at the same level adn this lever has the maximum number of nodes.
	Binary tree traversal.
	  In-order traversal.
	    Left branch
	    Current Node
	    Rigth branch
	  Pre-order traversal.
	    Current node
	    Left branch
	    Right branch
	  Post-order traversal.
	    Left branch
	    Rigth branch
	    Current node
	Binary heaps.
	  Complete binary tree.
	  For max heaps: Every node is greater than its children.
	  Min heaps: Nodes are smaller than the children.
	  Insertion.
	    Insert the element in the bottommost and rigthmost spot and bubble it with its parent while it's greater.
	  Extract.
	    Remove top element, move the last one to the top and bubble it down with the smaller child until the heap property is maintained.
      Tries.
	Variant of n-ary trees. Good data structure to work with strings and their prefixes.
    Graphs.
      A graph is a collection of edges and nodes.
      They can be:
	Directed or undirected
	Connected or disconnected 
	Cyclic or acyclic
      In programming they can be stored in:
	Adjacency list. A bit more complex
	Adjacency matrix. Less efficient
      Graph search.
	

	
