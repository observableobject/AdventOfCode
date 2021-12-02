//
//  AdventOfCode.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//

import Foundation

public final class AdventOfCode {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    func run(_ day: Day) {
        
        switch day {
        case .dayOne:
            dayOne()
        case .dayTwo:
            dayTwo()
        case .dayThree:
            print("not yet")
        case .dayFour:
            print("not yet")
        case .dayFive:
            print("not yet")
        case .daySix:
            print("not yet")
        case .daySeven:
            print("not yet")
        case .dayEight:
            print("not yet")
        case .dayNine:
            print("not yet")
        case .dayTen:
            print("not yet")
        }
    }
}