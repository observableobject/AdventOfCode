//
//  DayOne.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//
import Foundation

extension AdventOfCode {
    
    public func dayOne() {

        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayOne.txt")
            .removeEmptySpace()
            .separateByNewLine()
        let input = rawInput.map { Int($0)!}
        
        //partOne
        var count = 0
        
        for (n, depth) in input.enumerated() {
            if n == 0 { continue }
            if depth > input[n-1] {
                count+=1
            }
        }
        
        print(count)
        
        //partTwo
        var count2 = 0
        
        var smoothed: [Int] = [100000000]
        
        for (n, depth) in input.enumerated() {
            if n == 0 || n == 1 { continue }
            
            let temp = smoothed.last
            smoothed.append(input[n-2] + input[n-1] + depth)
            
            if smoothed.count == 0 { continue }
            else {
                if smoothed.last! > temp! {
                    count2+=1
                }
            }
        }
        
        print(count2)
        
    }
}
