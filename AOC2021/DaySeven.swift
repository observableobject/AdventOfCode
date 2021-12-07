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
        //let crabList = [16,1,2,0,4,2,7,1,2,14]
        
        var fuelNeeded: [Int] = Array(repeating: 0, count: crabList.max()!)

        for position in 0..<crabList.max()! { // iterate over the final position.
            var spaces = 0
            for crab in 0..<crabList.count { // iterate over each crab.
                spaces = abs(crabList[crab]-position)
                
                fuelNeeded[position]+=fuel(spaces)
            }
            
            //print(fuelNeeded)
       }
        print(fuelNeeded.reduce(Int.max, { min($0, $1) }))
        print(fuelNeeded)
    }
    
   
}

public func fuel(_ spaces: Int) -> Int { //10
    return spaces + ((spaces == 0) ? 0 : fuel(spaces-1))
    
}
