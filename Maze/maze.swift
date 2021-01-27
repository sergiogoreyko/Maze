//
//  maze.swift
//  Maze
//
//  Created by Сергей Горейко on 29.11.2020.
//

import Foundation

// A Cell represents the status of a grid location in the maze
public enum Cell: Character {
    case Empty = "🟩"
    case Blocked = "🟥"
    case Start = "🏳️"
    case Goal = "🏁"
    case Path = "🐭"
}


public typealias Maze = [[Cell]]
public var maze: Maze = [[.Empty,.Blocked,.Empty,.Blocked,.Empty,.Empty,.Empty,.Blocked,.Empty,.Empty],
                         [.Empty,.Blocked,.Empty,.Empty,.Empty,.Blocked,.Empty,.Blocked,.Empty,.Empty],
                         [.Empty,.Empty,.Empty,.Blocked,.Blocked,.Empty,.Empty,.Empty,.Blocked,.Blocked],
                         [.Empty,.Blocked,.Blocked,.Empty,.Empty,.Empty,.Blocked,.Blocked,.Empty,.Empty],
                         [.Blocked,.Blocked,.Empty,.Empty,.Blocked,.Empty,.Blocked,.Empty,.Empty,.Empty],
                         [.Empty,.Empty,.Empty,.Blocked,.Blocked,.Empty,.Empty,.Empty,.Empty,.Blocked],
                         [.Blocked,.Empty,.Blocked,.Empty,.Empty,.Blocked,.Empty,.Blocked,.Blocked,.Blocked],
                         [.Empty,.Empty,.Blocked,.Empty,.Blocked,.Blocked,.Empty,.Empty,.Empty,.Empty],
                         [.Empty,.Blocked,.Blocked,.Empty,.Empty,.Blocked,.Blocked,.Blocked,.Blocked,.Empty],
                         [.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty,.Empty]
]




public let start = MazeLocation(row: 0, col: 0)
public let goal = MazeLocation(row: 9, col: 9)
