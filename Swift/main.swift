class Graph { 
    var adjacencyList: [Int: [Int]] = [:] 
 
    func addEdge(_ from: Int, _ to: Int) { 
        if adjacencyList[from] == nil { 
            adjacencyList[from] = [] 
        } 
        adjacencyList[from]?.append(to) 
    } 
 
    func depthFirstSearch(_ startNode: Int, _ visited: inout Set<Int>, _ path: inout [Int]) { 
        visited.insert(startNode) 
        path.append(startNode) 
 
        print("Current path: \(path)") 
 
        if let neighbors = adjacencyList[startNode] { 
            for neighbor in neighbors { 
                if !visited.contains(neighbor) { 
                    depthFirstSearch(neighbor, &visited, &path) 
                } 
            } 
        } 
 
        path.removeLast() 
    } 
 
    func startDFS(_ startNode: Int) { 
        var visited: Set<Int> = [] 
        var path: [Int] = [] 
 
        depthFirstSearch(startNode, &visited, &path) 
    } 
} 
 
// set graph
let graph = Graph() 
graph.addEdge(1, 2) 
graph.addEdge(1, 3) 
graph.addEdge(2, 4) 
graph.addEdge(2, 5) 
graph.addEdge(2, 6) 
graph.addEdge(6, 7) 
graph.addEdge(3, 8) 
graph.addEdge(3, 9) 
 
print("DFS traversal starting from node 1:") 
graph.startDFS(1)