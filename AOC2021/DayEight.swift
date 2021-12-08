//
//  DayEight.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/7/21.
//

import Foundation

import Foundation

extension AdventOfCode {
    
    public func dayEight() {
        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayEight.txt")
        
        let input = rawInput.separateByNewLine()
        
        var sum = 0
        for display in input {
            let signal = String(display.split(separator: "|").first!)
            let wires = signal.separateBySpace().map( { String($0.sorted()) })
            
            let seven = wires.filter( {$0.count == 3}).first!
            let one = wires.filter( {$0.count == 2}).first!
            let four = wires.filter( {$0.count == 4}).first!
            let eight = wires.filter( {$0.count == 7}).first!
            
            let top = seven.subtract(one)
            
            let sixSegments = wires.filter( { $0.count == 6 })
            
            guard let six = sixSegments.filter( { !$0.contains(one[0]) || !$0.contains(one[1]) } ).first else { return }
            
            let fiveSegments = wires.filter { $0.count == 5 }
            
            let three = fiveSegments.filter(  { $0.contains(one[0]) && $0.contains(one[1]) }  ).first!
            
            let topright = eight.subtract(six)
            
            let bottomright = one.subtract(topright)
            
            let leftside = eight.subtract(three)
            
            var sixSegmentMinusLeft: [String] = []
            sixSegments.forEach { segment in
                sixSegmentMinusLeft.append(segment.subtract(leftside))
            }
            
            let nine = sixSegments.first(where: {$0.subtract(leftside).count == 5})!
            
            let bottomleft = eight.subtract(nine)
            
            let bottom = nine.subtract(four).subtract(top)
            
            let five = six.subtract(bottomleft)
            
            let topleft = leftside.subtract(bottomleft)
            
            let fourExceptMiddle = String((topleft + topright + bottomright))
            
            let middle = four.subtract(fourExceptMiddle)
            
            let zero = eight.subtract(middle)
            
            let two = eight.subtract(topleft).subtract(bottomright)
            
            let mapping: [String: Int] = [one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, zero: 0]
            
            let output = Output(from: String(display.split(separator: "|").last!), mapping: mapping)
            
            sum += output.result()
        }
        print(sum)
    }
}

class Output {
    
    var digits: [String] = []
    let mapping: [String: Int]
    
    init(from: String, mapping: [String: Int]) {
        digits = from.separateBySpace()
        self.mapping = mapping
    }
    
    func result() -> Int {
        var sum = ""
        for digit in digits {
            let sorted = String(digit.sorted())
            sum += String(mapping[sorted]!)
        }
        return Int(sum)!
    }
}
