//
//  DayTwo.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//

import Foundation

extension AdventOfCode {
    
    public func dayTwo() {
        
        let input = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayTwo.txt")
            .removeEmptySpace()
            .separateByNewLine()
        //partOne
        var horizontal = 0
        var depth = 0
        
        for command in input {
            if command.first == "f" {
                horizontal = horizontal + Int(String(command.last!))!
            }
            if command.first == "u"
            {
                depth = depth - Int(String(command.last!))!
            }
            if command.first == "d"
            {
                depth = depth + Int(String(command.last!))!
            }
        }
        
        print(horizontal)
        print(depth)
        
        //partTwo
        horizontal = 0
        depth = 0
        var aim = 0
        
        for command in input {
            if command.first == "f" {
                horizontal = horizontal + Int(String(command.last!))!
                depth = depth + aim * Int(String(command.last!))!
            }
            if command.first == "u"
            {
                aim = aim - Int(String(command.last!))!
            }
            if command.first == "d"
            {
                aim = aim + Int(String(command.last!))!
            }
        }
        
        print(horizontal)
        print(depth)
        print(aim)
    }
}
