//
//  Helper.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 10/01/2025.
//

import Foundation

@propertyWrapper
struct Bounded<T: Comparable> {
    private var value: T
    private var range: ClosedRange<T>
    
    init(wrappedValue: T, _ range: ClosedRange<T>) {
        self.range = range
        self.value = range.contains(wrappedValue) ? wrappedValue : range.lowerBound
    }
    
    var wrappedValue: T {
        get { value }
        set {
            if range.contains(newValue) {
                value = newValue
            } else {
                print("Value \(newValue) is out of bounds. Keeping the value \(value).")
            }
        }
    }
}
