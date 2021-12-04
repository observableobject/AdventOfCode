//
//  DayTwo.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//

import Foundation

extension AdventOfCode {
    
    public func dayFour() {
        
        //partOneAndTwo
        let input = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayFour.txt")
        
        let lineInput = input.removeEmptySpace().separateByNewLine()
        
        let rawNumbers = lineInput.first!
        
        let numbers = rawNumbers.separateByComma().map { Int($0)!}
        
        print(numbers)
        let rawBoards = Array(lineInput.dropFirst())
        
        var boards: [Board] = []
        for i in 0..<rawBoards.count / 5 {
            let board = Board(Array(rawBoards[5*i...5*i+4]))
            boards.append(board)
        }
        
        for number in numbers {
            print("NEW ROUND!! NUMBER = \(number)")
            for board in boards {
                board.mark(number)
                if board.isInPlay {
                    if board.bingo() {
                        let score = board.score()
                        print("Bingo!\n")
                        print("Winning Number!: ", number)
                        board.display()
                        
                        print("score: \(score)")
                        print("final score: \(score * number)")
                        //For Part One, Uncomment Below
                        //return
                    }
                }
            }
            
        }
    }
}
