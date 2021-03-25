//
//  funcs.swift
//  Maze
//
//  Created by Сергей Горейко on 29.11.2020.
//

import Foundation

public func printMaze(_ maze: Maze) {
    for i in 0..<maze.count {
        print(String(maze[i].map{ $0.rawValue }))
    }
}


public func == (lhs: MazeLocation, rhs: MazeLocation) -> Bool {
    return lhs.row == rhs.row && lhs.col == rhs.col
}


public func goalTest(ml: MazeLocation) -> Bool {
    return ml == goal
}


public func successorsForMaze(_ maze: Maze) -> (MazeLocation) -> [MazeLocation] {
    func successors(ml: MazeLocation) -> [MazeLocation] {
        var newMLs: [MazeLocation] = [MazeLocation]()
        if (ml.row + 1 < maze.count) && (maze[ml.row + 1][ml.col] != .Blocked) {
            newMLs.append(MazeLocation(row: ml.row + 1, col: ml.col))
        }
        if (ml.row - 1 >= 0) && (maze[ml.row - 1][ml.col] != .Blocked) {
            newMLs.append(MazeLocation(row: ml.row - 1, col: ml.col))
        }
        if (ml.col + 1 < maze[0].count) && (maze[ml.row][ml.col + 1] != .Blocked) {
            newMLs.append(MazeLocation(row: ml.row, col: ml.col + 1))
        }
        if (ml.col - 1 >= 0) && (maze[ml.row][ml.col - 1] != .Blocked) {
            newMLs.append(MazeLocation(row: ml.row, col: ml.col - 1))
        }
        
        return newMLs
    }
    return successors
}


public func < <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return (lhs.cost + lhs.heuristic) < (rhs.cost + rhs.heuristic)
}

public func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs === rhs
}



public func nodeToPath<StateType>(_ node: Node<StateType>) -> [StateType] {
    var path: [StateType] = [node.state]
    var node = node
    while let currentNode = node.parent {
        path.insert(currentNode.state, at: 0)
        node = currentNode
    }
    return path
}

public func markMaze(_ maze: inout Maze, path: [MazeLocation], start: MazeLocation, goal: MazeLocation) {
    for ml in path {
        maze[ml.row][ml.col] = .Path
    }
    maze[start.row][start.col] = .Start
    maze[goal.row][goal.col] = .Goal
}

public func euclideanDistance(ml: MazeLocation) -> Float {
    let xdist = ml.col - goal.col
    let ydist = ml.row - goal.row
    return sqrt(Float((xdist * xdist) + (ydist * ydist)))
}

public func manhattanDistance(ml: MazeLocation) -> Float {
    let xdist = abs(ml.col - goal.col)
    let ydist = abs(ml.row - goal.row)
    return Float(xdist + ydist)
}

public func astar<StateType: Hashable>(initialState: StateType, goalTestFn: (StateType) -> Bool, successorFn: (StateType) -> [StateType], heuristicFn: (StateType) -> Float) -> Node<StateType>? {
    var frontier: PriorityQueue<Node<StateType>> = PriorityQueue<Node<StateType>>(ascending: true, startingValues: [Node(state: initialState, parent: nil, cost: 0, heuristic: heuristicFn(initialState))])
    var explored = Dictionary<StateType, Float>()
    explored[initialState] = 0

    while let currentNode = frontier.pop() {
        let currentState = currentNode.state
        if goalTestFn(currentState) { return currentNode }
        for child in successorFn(currentState) {
            let newcost = currentNode.cost + 1
            if (explored[child] == nil) || (explored[child]! > newcost) {
                explored[child] = newcost
                frontier.push(Node(state: child, parent: currentNode, cost: newcost, heuristic: heuristicFn(child)))
            }
        }
    }
    return nil 
}
