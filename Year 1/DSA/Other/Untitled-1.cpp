#include <iostream>
#include <vector>

int main() {
    int V = 5; // Number of vertices
    std::vector<std::vector<int>> adjacencyList(V);

    // Adding edges to the adjacency list
    adjacencyList[0].push_back(1);
    adjacencyList[0].push_back(2);
    adjacencyList[1].push_back(3);
    adjacencyList[2].push_back(3);
    adjacencyList[2].push_back(4);
    adjacencyList[3].push_back(4);

    // Printing the graph
    for (int i = 0; i < V; ++i) {
        std::cout << "Vertex " << i << " -> ";
        for (int neighbor : adjacencyList[i]) {
            std::cout << neighbor << " ";
        }
        std::cout << std::endl;
    }

    return 0;
}
