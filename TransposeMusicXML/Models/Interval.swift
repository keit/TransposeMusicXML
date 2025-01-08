//
//  Interval.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 09/01/2025.
//

import Foundation

public struct Interval {
    // Properties
    @Bounded(wrappedValue: 1, 1...8) private var degrees: Int
    private var alter: Int = 0

    // Predefined immutable instances
    public static let unison = Interval(degrees: 1, alter: 0)
    public static let minorSecond = Interval(degrees: 2, alter: -1)
    public static let majorSecond = Interval(degrees: 2, alter: 0)
    public static let minorThird = Interval(degrees: 3, alter: -1)
    public static let majorThird = Interval(degrees: 3, alter: 0)
    public static let perfectFourth = Interval(degrees: 4, alter: 0)
    public static let diminishedFifth = Interval(degrees: 5, alter: -1)
    public static let perfectFifth = Interval(degrees: 5, alter: 0)
    public static let minorSixth = Interval(degrees: 6, alter: -1)
    public static let majorSixth = Interval(degrees: 6, alter: 0)
    public static let minorSeventh = Interval(degrees: 7, alter: -1)
    public static let majorSeventh = Interval(degrees: 7, alter: 0)
    public static let octave = Interval(degrees: 8, alter: 0)

    // Restrict user instantiation
    private init(degrees: Int, alter: Int = 0) {
        self.degrees = degrees
        self.alter = alter
    }
}
