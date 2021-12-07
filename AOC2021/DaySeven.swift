//
//  DaySeven.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/6/21.
//

import Foundation

extension AdventOfCode {
    
    public func daySeven() {
        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/daySeven.txt")
        
        let crabList = rawInput.separateByComma().map( { Int($0)! })
        
        var fuelNeeded: [Int] = Array(repeating: 0, count: crabList.max()!)
        //lazy O(n^2) solution.
        for position in 0..<crabList.max()! { // iterate over the final position.

            for crab in 0..<crabList.count { // iterate over each crab.
                let spaces = abs(crabList[crab]-position)
                
                fuelNeeded[position]+=spaces
            }
       }
        print(fuelNeeded.reduce(Int.max, min))
    }
}

func fuel(_ spaces: Int) -> Int {
    return spaces + ((spaces == 0) ? 0 : fuel(spaces-1))
    
}
