//
//  DayOne.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//
import Foundation
import Algorithms

extension AdventOfCode {
    
    public func dayThree() {
        
        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayThree.txt")
            .removeEmptySpace()
            .separateByNewLine()
        
        //partOne
        var gamma: [Int] = []
        for index in 0..<12 {
            var sum = 0
            for number in rawInput {
                sum = sum + Int(String(number[index]))!
            }
            let average = Double(sum) / Double(rawInput.count)
            
            gamma.append(Int(average.rounded()))
        }
        print("Gamma Number is: ", gamma)
        print("Epsilon Number - toggle all digits above\n")
        
        //partTwo
        var filteredInput: [String] = rawInput
        var selector = ""
        let reading: Reading = .co2
        
        for index in 0..<12 {
            var sum = 0
            for number in filteredInput {
                sum = sum + Int(String(number[index]))!
            }
            //oxygen
            switch reading {
            case .oxygen:
                selector = Double(sum) >= (Double(filteredInput.count) / 2.0) ? "1" : "0"
            case .co2:
                selector = Double(sum) >= (Double(filteredInput.count) / 2.0) ? "0" : "1"
            }
            
            filteredInput = filteredInput.filter( {
                String($0[index]).contains(selector)
            })
            
            if filteredInput.count == 1 {
                print("\(reading.stringValue) is:", Int(filteredInput.first!, radix: 2)!)
            }
        }
    }
}

enum Reading: String {
    case oxygen
    case co2
    
    var stringValue: String {
        switch self {
        case .oxygen: return "Oxygen"
        case .co2: return "CO2"
            
        }
    }
}
