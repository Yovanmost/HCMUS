import queue
import math


class Node:
    def __init__(self, n, i, j, state, costPath, goalPath):
        self.n = n
        self.i = i
        self.j = j
        self.state = state
        self.costPath = costPath
        self.goalPath = goalPath

    def printState(self):
        for i in range(self.n * self.n):
            if i % self.n == 0 and i != 0:
                print()
            print(self.state[i], end=' ')
        print()

    def getStateString(self):
        stateStr = ''
        for num in self.state:
            stateStr += str(num) + " "
        return stateStr

    def __lt__(self, other):
        return self.costPath < other.costPath

# --------------------------------------------------------------------------------

def compareState(a, b):
    return a.state == b.state

def isGoalState(nodeA, goal):
    return nodeA.state == goal

def printState2(state, n):
        for i in range(n * n):
            if i % n == 0 and i != 0:
                print()
            print(state[i], end=' ')
        print()

def getBlank(state):
    n = int(math.sqrt(len(state)))
    for i in range(n*n):
      if (state[i] == 0):
        return i // n, i % n

def getSuccessors(node):
    successors = []
    directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    for dir in directions:
        new_i = node.i + dir[0]
        new_j = node.j + dir[1]
        if 0 <= new_i < node.n and 0 <= new_j < node.n:
            new_state = node.state.copy()
            new_state[node.n * node.i + node.j], new_state[node.n * new_i + new_j] = new_state[node.n * new_i + new_j], new_state[node.n * node.i + node.j]
            successors.append(Node(node.n, new_i, new_j, new_state, node.costPath + 1, node.goalPath + str(new_state[node.n * node.i + node.j]) + " "))
    return successors

def ucs(initialNode, goalState):
    frontier = queue.PriorityQueue()
    reached = {}

    frontier.put((initialNode.costPath, initialNode))
    reached[initialNode.getStateString()] = initialNode

    while not frontier.empty():
        current = frontier.get()

        if current[1].state == goalState:
            print("\nPath cost:", current[1].costPath)
            return current[1].goalPath

        for successor in getSuccessors(current[1]):
            state_str = successor.getStateString()
            if state_str not in reached or successor.costPath < reached[state_str].costPath:
                reached[state_str] = successor
                frontier.put((successor.costPath, successor))

    return "No solution found"

def test1():
    # Example usage:
    # initialNode = Node(3, 2, 2, [[1, 2, 3], [4, 5, 6], [7, 8, 0]], 0, "")
    # initialNode = Node(3, 2, 2, [1, 4, 0, 5, 2, 8, 7, 6, 3], 0, "")
    # initialNode = Node(3, 1, 1, [1, 4, 2, 3, 0, 5, 6, 7, 8], 0, "")
    # initialNode = Node(3, 1, 1, [1,3,5,4,0,2,7,8,6], 0, "")

    # 6 steps:  [1,3,5,4,0,2,7,8,6]
    # 18 steps: [1,4,0,5,2,8,7,6,3]
    # 26 steps: [2,1,7,5,0,8,3,4,6]
    # 27 steps: [8,5,3,4,7,0,6,1,2]
    # 28 steps: [0,6,7,3,8,5,4,2,1]
    # 30 steps: [5,7,0,4,6,8,1,2,3]
    # 31 steps: [8,6,7,2,5,4,3,0,1]

    initialState = [0,6,7,3,8,5,4,2,1]
    cor = getBlank(initialState)
    initialNode = Node(3, cor[0], cor[1], initialState, 0, "")

    print("Init node")
    initialNode.printState()
    print()

    goalState = [1, 2, 3, 4, 5, 6, 7, 8, 0]
    print(ucs(initialNode, goalState))

def test2():
    node = Node(3, 1, 1, [1, 4, 2, 3, 0, 5, 6, 7, 8], 0, "")
    node2 = Node(3, 1, 1, [1, 4, 2, 3, 0, 5, 6, 7, 8], 2, "")
    # Example usage:
    solver = PuzzleSolver()

    # Mark a node as visited
    solver.mark_visited(node2)

    # Check if a node has been visited
    if solver.is_visited(node):
        print("Node has been visited before.")

    # Get a node from the visited nodes
    retrieved_node = solver.get_node(node.getStateString())
    if retrieved_node.costPath > node.costPath:
        print("Node found in visited nodes.")
    else:
        print("Node not found in visited nodes.")

def test3():
    reached = {}
    node = Node(3, 1, 1, [1, 4, 2, 3, 0, 5, 6, 7, 8], 0, "")
    node2 = Node(3, 1, 1, [1, 4, 2, 3, 0, 5, 6, 7, 8], 2, "")
    node2 = Node(3, 1, 1, [1, 0, 2, 3, 4, 5, 6, 7, 8], 2, "")
    reached[node2.getStateString()] = node2

    # if reached[node.getStateString()].costPath > node.costPath:
    #     reached[node.getStateString()] = node
    #     print(reached[node.getStateString()].costPath)
    # else:
    #     print("nothing")

    if node2.getStateString() not in reached:
        print("Not here")
    else:
        print("here")

def main():
    test1()

if __name__ == "__main__":
    main()