//
//  main.swift
//  Maze
//
//  Created by Сергей Горейко on 29.11.2020.
//

import Foundation

printMaze(maze)
print("")

if let solution = astar(initialState: start, goalTestFn: goalTest, successorFn: successorsForMaze(maze), heuristicFn: manhattanDistance) {
    let path = nodeToPath(solution)
    markMaze(&maze, path: path, start: start, goal: goal)
    printMaze(maze)
} else {
    print("The maze has no solution")
}

