//
//  Interval.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 09/01/2025.
//

import Foundation

public struct Interval: Equatable {
    public static func == (lhs: Interval, rhs: Interval) -> Bool {
        lhs.halfSteps == rhs.halfSteps
    }
    
//    public static func == (lhs: Pitch, rhs: Pitch) -> Bool {
//        lhs.noteName == rhs.noteName && lhs.alter == rhs.alter && lhs.octave == rhs.octave
//    }

    // Properties
    @Bounded(wrappedValue: 0, 0...12) private(set) var halfSteps: Int

    // Predefined immutable instances
    public static let unison = Interval(halfSteps: 0)
    public static let minorSecond = Interval(halfSteps: 1)
    public static let majorSecond = Interval(halfSteps: 2)
    public static let minorThird = Interval(halfSteps: 3)
    public static let majorThird = Interval(halfSteps: 4)
    public static let perfectFourth = Interval(halfSteps: 5)
    public static let diminishedFifth = Interval(halfSteps: 6)
    public static let perfectFifth = Interval(halfSteps: 7)
    public static let minorSixth = Interval(halfSteps: 8)
    public static let majorSixth = Interval(halfSteps: 9)
    public static let minorSeventh = Interval(halfSteps: 10)
    public static let majorSeventh = Interval(halfSteps: 11)
    public static let octave = Interval(halfSteps: 12)

    // Restrict user instantiation
    private init(halfSteps: Int) {
        self.halfSteps = halfSteps
    }
}
