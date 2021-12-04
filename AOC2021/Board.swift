//
//  Board.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/3/21.
//

import Foundation

class Board {
    var board: [Int] = []
    var called: [Bool] = []
    var isInPlay: Bool
    
    init(_ rows: [String]) {
        
        for row in rows {
            let numbers: [Int] = row.separateBySpace().map { Int($0)! }
            for number in numbers {
                board.append(number)
                called.append(false)
            }
        }
        isInPlay = true
    }
    
    func mark(_ number: Int) {
        if board.contains(number) {
            guard let index = board.firstIndex(of: number) else { return }
            called[index] = true
        }
    }
    
    func bingo() -> Bool {
        var bingo = false
        if (checkRow() || checkColumn()) {
            bingo = true
            isInPlay = false
        }
        return bingo
    }
    
    func checkRow() -> Bool {
        var row: Bool = false
        for i in 0..<5 {
            if (called[5*i] && called[5*i+1] && called[5*i+2] && called[5*i+3] && called[5*i+4]) {
                row = true
                break
            }
        }
        return row
    }
    
    func checkColumn() -> Bool {
        var column: Bool = false
        for i in 0..<5 {
            if (called[i] && called[5+i] && called[10+i] && called[15+i] && called[20+i]) {
                column = true
                break
            }
        }
        return column
    }
// Diagonals Don't Count
//    func checkDiagonal() -> Bool {
//        var diagonal: Bool = false
//
//        if (called[0] && called[6] && called[12] && called[18] && called[24]) || (called[4] && called[8] && called[12] && called[16] && called[20]) {
//            diagonal = true
//        }
//        return diagonal
//    }
    
    func display() {
        for i in 0..<5 {
            print(board[5*i] , " " , board[5*i+1], " " , board[5*i+2] , " " , board[5*i+3] , " " , board[5*i+4], "\n")
        }
    }
    
    func score() -> Int {
        var score = 0
        for i in 0..<25 {
            if !called[i] {
                score += board[i]
            }
        }
        return score
    }
}
