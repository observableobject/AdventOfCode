//
//  DaySix.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/5/21.
//

import Foundation

extension AdventOfCode {
    
    public func daySix() {
        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/daySix.txt")
        
        var input = rawInput.separateByComma().map( { Int($0)! })
        
        let day = 256; //80 for part one
        
        //partOne, comment out if day >100ish
        //        for _ in 0 ..< day {
        //            for i in 0..<input.count {
        //
        //                if input[i] == 0 {
        //                    input.append(8)
        //                    input[i] = 6
        //                }
        //                else {
        //                    input[i] -= 1
        //                }
        //            }
        //        }
        //        print(input.count)
        
        //partTwo
        input = rawInput.separateByComma().map( { Int($0)! })
        
        var fish: [Int] = Array(repeating: 0, count: 9)
        
        for i in 0..<9 {
            fish[i] = input.filter({ $0 == i }).count
        }
        
        for _ in 0 ..< day {
            let newFish = fish.first!
            fish = Array(fish.dropFirst())
            fish.append(newFish)
            fish[6] += newFish
        }
        print(fish.reduce(0, +))
    }
}
