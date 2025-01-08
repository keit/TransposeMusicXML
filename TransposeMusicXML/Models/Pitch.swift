//
//  Pitch.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 09/01/2025.
//

import Foundation


public struct Pitch: CustomStringConvertible, Equatable {
    public static func == (lhs: Pitch, rhs: Pitch) -> Bool {
        lhs.step == rhs.step && lhs.alter == rhs.alter && lhs.octave == rhs.octave
    }
    
    public enum Step: String {
        case C = "C"
        case D = "D"
        case E = "E"
        case F = "F"
        case G = "G"
        case A = "A"
        case B = "B"
    }
    
    let step2Index: [Step: Int] = [
        .C: 0,
        .D: 2,
        .E: 4,
        .F: 5,
        .G: 7,
        .A: 9,
        .B: 11
    ]
    
    let step: Step
    let alter: Int
    @Bounded(wrappedValue: 4, 0...9) private(set) var octave: Int
    let index: Int
    
    public init(step: Step, alter: Int = 0, octave: Int = 4) {
        self.step = step
        self.alter = alter
        self.index = step2Index[step]! + alter
        self.octave = octave
    }
    
    public var description: String {
        return "Pitch(step: \(step), alter: \(alter), octave: \(octave)), index: \(index)"
    }
    
}

