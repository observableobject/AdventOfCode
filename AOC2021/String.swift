//
//  String.swift
//  AOC2021
//
//  Created by Vincent Frascello on 12/2/21.
//

//  Thanks Jon :)
extension String {
    func removeEmptySpace() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func separateByNewLine() -> [String] {
        removeEmptySpace().split(separator: "\n").map(String.init)
    }
}
