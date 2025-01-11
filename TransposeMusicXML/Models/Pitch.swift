//
//  Pitch.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 09/01/2025.
//

import Foundation


enum PitchError: Error {
    case outOfRange
    case invalidStep
    case negativeAlter
}

public struct Pitch: CustomStringConvertible, Equatable {
    public static func == (lhs: Pitch, rhs: Pitch) -> Bool {
        lhs.noteName == rhs.noteName && lhs.alter == rhs.alter && lhs.octave == rhs.octave
    }
    
    
    public enum NoteName: String {
        case C = "C"
        case D = "D"
        case E = "E"
        case F = "F"
        case G = "G"
        case A = "A"
        case B = "B"
    }
    
    let noteName2Index: [NoteName: Int] = [
        .C: 0,
        .D: 2,
        .E: 4,
        .F: 5,
        .G: 7,
        .A: 9,
        .B: 11
    ]
    
    let noteName: NoteName
    let alter: Int
    @Bounded(wrappedValue: 4, 0...9) var octave: Int
    let index: Int
    
    public init(noteName: NoteName, alter: Int = 0, octave: Int = 4) {
        self.noteName = noteName
        self.alter = alter
        self.index = noteName2Index[noteName]! + alter
        self.octave = octave
    }
    
    public var description: String {
        return "Pitch(step: \(noteName), alter: \(alter), octave: \(octave)), index: \(index)"
    }
    
    private func findNoteNames(index: Int) throws -> (lowerNote: NoteName, higherNote: NoteName) {
        if let lowerOrEqualNote = noteName2Index.filter({ $0.value <= index }).max(by: { $0.value < $1.value }),
           let higherOrEqualNote = noteName2Index.filter({ $0.value >= index }).min(by: { $0.value < $1.value }) {
            return (lowerOrEqualNote.key, higherOrEqualNote.key)
        } else {
            throw PitchError.outOfRange
        }
    }
        
    public func up(interval: Interval) throws -> Pitch {
        let toIndex = (self.index + interval.halfSteps) % 12
        let octave = interval == .octave ? self.octave + 1 : self.octave
        
        do {
            let (lowerNote, higherNote) = try findNoteNames(index: toIndex)
            if lowerNote == higherNote {
                let newPitch = Pitch(noteName: lowerNote, alter: 0, octave: octave)
                return newPitch
            } else {
                // Handle flat and sharp. For now, it always return with #
                let newPitch = Pitch(noteName: lowerNote, alter: 1, octave: octave)
                return newPitch
            }
        }
        catch {
            throw error
        }
    }
}

