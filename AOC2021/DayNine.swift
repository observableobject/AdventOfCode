//
//  DayNine.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/8/21.
//

import Foundation

extension AdventOfCode {
    
    
    public func dayNine() {
        let rawInput = try! String(contentsOfFile: "/Users/vincent/XCode/AOC2021/AOC2021/inputs/dayNine.txt")
        
        let input = rawInput.separateByNewLine()
        
        let width = input[0].count
        
        let height = input.count
        
        var map: [[Int]] = Array(repeating: Array(repeating: 0, count: width+2), count: height+2)
        
        var risks: [Int] = []
        
        for i in 0..<height+2 {
            for j in 0..<width+2 {
                if i == 0 || j == 0{
                    map[i][j] = 9
                    continue
                }
                if i == height+1 || j == width+1 {
                    map[i][j] = 9
                    continue
                }
                else {
                    map[i][j] = Int(String(input[i-1][j-1]))!
                }
            }
        }
        
        //partOne
        for i in 0..<map.count {
            
            for j in 0..<map[0].count {
                
                if i == 0 {
                    if j == 0
                    {
                        if (map[i+1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    else if j == map[0].count-1 {
                        if (map[i+1][j] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    else {
                        if (map[i+1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0{
                            risks.append(map[i][j]+1)
                        }
                    }
                }
                else if i == map.count-1 {
                    if j == 0 {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    else if j == map[0].count-1 {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    else {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0{
                            risks.append(map[i][j]+1)
                        }
                    }
                }
                else {
                    if j == 0 {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 && (map[i+1][j] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    else if j == map[0].count-1 {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0 && (map[i+1][j] - map[i][j]) > 0{
                            risks.append(map[i][j]+1)
                        }
                    }
                    else {
                        if (map[i-1][j] - map[i][j]) > 0 && (map[i][j+1] - map[i][j]) > 0 && (map[i][j-1] - map[i][j]) > 0 && (map[i+1][j] - map[i][j]) > 0 {
                            risks.append(map[i][j]+1)
                        }
                    }
                    
                }
            }
        }
        print(risks.reduce(0, +))
        
        //partTwo
        var localMins: [Point] = []
        for i in 0..<map.count {
            
            for j in 0..<map[0].count {
                if isNotLocalMinimum(i, j) {
                    continue
                }
                localMins.append(Point(i, j, map[i][j]))
            }
            
        }
        
        var basins: [Int] = []
        var checkedPoints = Set<Point>()
        
        for point in localMins {
            checkedPoints.removeAll()
            checkPoint(point)
            basins.append(checkedPoints.count)
        }
        
        let topThreeSizes = basins.sorted().reversed()[0...2]
        
        print(topThreeSizes)
        print(topThreeSizes[0] * topThreeSizes[1] * topThreeSizes[2])
        
        func isNotLocalMinimum(_ x: Int, _ y: Int) -> Bool {
            
            if (x != 0) {
                if (map[x - 1][y] <= map[x][y]) { return true }
            }
            if (y != 0) {
                if (map[x][y - 1] <= map[x][y]) { return true }
            }
            if (x != map.count - 1) {
                if (map[x + 1][y] <= map[x][y]) { return true }
            }
            if (y != map[0].count - 1) {
                if (map[x][y + 1] <= map[x][y]) { return true }
            }
            return false;
        }
        
        func checkPoint(_ point: Point) {
            if map[point.x][point.y] == 9 {
                return
            }
            if checkedPoints.contains(point) {
                return
            }
            checkedPoints.insert(point)
            if (point.x - 1 >= 0) {
                checkPoint(Point(point.x - 1, point.y, point.value))
            }
            if (point.y - 1 >= 0) {
                checkPoint(Point(point.x, point.y - 1, point.value))
            }
            if (point.x + 1 < map.count) {
                checkPoint(Point(point.x + 1, point.y, point.value))
            }
            if (point.y + 1 < map[0].count) {
                checkPoint(Point(point.x, point.y + 1, point.value))
            }
        }
    }
    
    class Point: Hashable {
        
        static func == (lhs: AdventOfCode.Point, rhs: AdventOfCode.Point) -> Bool {
            return (lhs.x == rhs.x && lhs.y == rhs.y) ? true : false
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.x * self.y)
        }
        
        let x: Int
        let y: Int
        let value: Int
        
        init(_ x: Int, _ y: Int, _ value: Int) {
            self.x = x
            self.y = y
            self.value = value
        }
    }
}
