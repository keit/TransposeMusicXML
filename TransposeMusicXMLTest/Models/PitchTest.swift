//
//  PitchTest.swift
//  TransposeMusicXMLTest
//
//  Created by Kei Takashima on 11/01/2025.
//

import XCTest
@testable import TransposeMusicXML

final class PitchTest: XCTestCase {
    var p: Pitch!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        p = Pitch(noteName: .C)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        p = nil
    }

    func testInit() throws {
        // C
        p = Pitch(noteName: .C)
        XCTAssertEqual(p.noteName, .C)
        XCTAssertEqual(p.alter, 0)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 0)

        // C#
        p = Pitch(noteName: .C, alter: 1)
        XCTAssertEqual(p.noteName, .C)
        XCTAssertEqual(p.alter, 1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 1)

        // Cb
        p = Pitch(noteName: .C, alter: -1)
        XCTAssertEqual(p.noteName, .C)
        XCTAssertEqual(p.alter, -1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, -1)

        // D
        p = Pitch(noteName: .D)
        XCTAssertEqual(p.noteName, .D)
        XCTAssertEqual(p.alter, 0)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 2)

        // D#
        p = Pitch(noteName: .D, alter: 1)
        XCTAssertEqual(p.noteName, .D)
        XCTAssertEqual(p.alter, 1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 3)

        // Db
        p = Pitch(noteName: .D, alter: -1)
        XCTAssertEqual(p.noteName, .D)
        XCTAssertEqual(p.alter, -1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 1)

        // Index of C# and Db should be equal
        XCTAssertEqual(Pitch(noteName: .C, alter: 1).index, Pitch(noteName: .D, alter: -1).index)
    }
    
    func testUpWithKeyCMaj() throws {
        var newPitch: Pitch!
        newPitch = try p.up(interval: .unison)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 4))

        newPitch = try p.up(interval: .majorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 1, octave: 4))

        newPitch = try p.up(interval: .majorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 4))

        newPitch = try p.up(interval: .perfectFourth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.up(interval: .diminishedFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 1, octave: 4))

        newPitch = try p.up(interval: .perfectFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 1, octave: 4))

        newPitch = try p.up(interval: .majorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 1, octave: 4))

        newPitch = try p.up(interval: .majorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .octave)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))
    }
    func testDownWithKeyCMaj() throws {
        var newPitch: Pitch!
        newPitch = try p.down(interval: .unison)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.down(interval: .minorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 1, octave: 3))

        newPitch = try p.down(interval: .minorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 1, octave: 3))

        newPitch = try p.down(interval: .perfectFourth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 3))

        newPitch = try p.down(interval: .diminishedFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 1, octave: 3))

        newPitch = try p.down(interval: .perfectFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 3))

        newPitch = try p.down(interval: .minorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 1, octave: 3))

        newPitch = try p.down(interval: .minorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 3))

        newPitch = try p.down(interval: .octave)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 3))
    }

    func testUpWithKeyFMaj() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .F, alter: 0, octave: 4)

        newPitch = try p.up(interval: .unison, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 4))

        newPitch = try p.up(interval: .majorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 4))

        newPitch = try p.up(interval: .majorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.up(interval: .perfectFourth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 4))

        newPitch = try p.up(interval: .diminishedFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .perfectFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))

        newPitch = try p.up(interval: .minorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 5))

        newPitch = try p.up(interval: .majorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 5))

        newPitch = try p.up(interval: .minorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 5))

        newPitch = try p.up(interval: .majorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 5))

        newPitch = try p.up(interval: .octave, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 5))
    }
    func testDownWithKeyFMaj() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .F, alter: 0, octave: 4)

        newPitch = try p.down(interval: .unison, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.down(interval: .minorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 4))

        newPitch = try p.down(interval: .minorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 4))

        newPitch = try p.down(interval: .perfectFourth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.down(interval: .diminishedFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 3))

        newPitch = try p.down(interval: .perfectFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 3))

        newPitch = try p.down(interval: .minorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 3))

        newPitch = try p.down(interval: .minorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 3))

        newPitch = try p.down(interval: .octave, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 3))
    }

    func testUpWithKeyDMin() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .D, alter: 0, octave: 4)

        newPitch = try p.up(interval: .unison, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSecond, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 4))

        newPitch = try p.up(interval: .majorSecond, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorThird, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorThird, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 4))

        newPitch = try p.up(interval: .perfectFourth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.up(interval: .diminishedFifth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 4))

        newPitch = try p.up(interval: .perfectFifth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSixth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 4))

        newPitch = try p.up(interval: .majorSixth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .minorSeventh, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))

        newPitch = try p.up(interval: .majorSeventh, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 5))

        newPitch = try p.up(interval: .octave, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 5))

    }
    func testDownWithKeyDMin() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .D, alter: 0, octave: 4)

        newPitch = try p.down(interval: .unison, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.down(interval: .minorSecond, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 4))

        newPitch = try p.down(interval: .majorSecond, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.down(interval: .minorThird, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorThird, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 3))

        newPitch = try p.down(interval: .perfectFourth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 3))

        newPitch = try p.down(interval: .diminishedFifth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 3))

        newPitch = try p.down(interval: .perfectFifth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 3))

        newPitch = try p.down(interval: .minorSixth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 3))

        newPitch = try p.down(interval: .majorSixth, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 3))

        newPitch = try p.down(interval: .minorSeventh, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSeventh, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 3))

        newPitch = try p.down(interval: .octave, key: .d_minor)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 3))
    }

    func testUpWithKeyBbMaj() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .B, alter: -1, octave: 4)

        newPitch = try p.up(interval: .unison, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 4))

        newPitch = try p.up(interval: .minorSecond, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorSecond, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))

        newPitch = try p.up(interval: .minorThird, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 5))

        newPitch = try p.up(interval: .majorThird, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 5))

        newPitch = try p.up(interval: .perfectFourth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 5))

        newPitch = try p.up(interval: .diminishedFifth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 5))

        newPitch = try p.up(interval: .perfectFifth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 5))

        newPitch = try p.up(interval: .minorSixth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 5))

        newPitch = try p.up(interval: .majorSixth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 5))

        newPitch = try p.up(interval: .minorSeventh, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 5))

        newPitch = try p.up(interval: .majorSeventh, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 5))

        newPitch = try p.up(interval: .octave, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 5))

    }
    func testDownWithKeyBbMaj() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .B, alter: -1, octave: 4)

        newPitch = try p.down(interval: .unison, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 4))

        newPitch = try p.down(interval: .minorSecond, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorSecond, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 4))

        newPitch = try p.down(interval: .minorThird, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorThird, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 4))

        newPitch = try p.down(interval: .perfectFourth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.down(interval: .diminishedFifth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 4))

        newPitch = try p.down(interval: .perfectFifth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 4))

        newPitch = try p.down(interval: .minorSixth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorSixth, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 4))

        newPitch = try p.down(interval: .minorSeventh, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorSeventh, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 3))

        newPitch = try p.down(interval: .octave, key: .b_flat_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 3))

    }

    
    func testUpFromCSharpWithKeyC() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .C, alter: 1, octave: 4)
        
        newPitch = try p.up(interval: .unison)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 4))

        newPitch = try p.up(interval: .minorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 1, octave: 4))

        newPitch = try p.up(interval: .minorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 4))

        newPitch = try p.up(interval: .perfectFourth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 1, octave: 4))

        newPitch = try p.up(interval: .diminishedFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.up(interval: .perfectFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 1, octave: 4))

        newPitch = try p.up(interval: .minorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 1, octave: 4))

        newPitch = try p.up(interval: .minorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))

        newPitch = try p.up(interval: .octave)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 5))
    }


    func testDownFromCSharpWithKeyC() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .C, alter: 1, octave: 4)

        newPitch = try p.down(interval: .unison)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 4))

        newPitch = try p.down(interval: .minorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 4))

        newPitch = try p.down(interval: .majorSecond)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 3))

        newPitch = try p.down(interval: .minorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 1, octave: 3))

        newPitch = try p.down(interval: .majorThird)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 3))

        newPitch = try p.down(interval: .perfectFourth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 1, octave: 3))

        newPitch = try p.down(interval: .diminishedFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 3))

        newPitch = try p.down(interval: .perfectFifth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 1, octave: 3))

        newPitch = try p.down(interval: .minorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 3))

        newPitch = try p.down(interval: .majorSixth)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 3))

        newPitch = try p.down(interval: .minorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 1, octave: 3))

        newPitch = try p.down(interval: .majorSeventh)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 3))

        newPitch = try p.down(interval: .octave)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 1, octave: 3))
    }

    
    func testUpFromFSharpWithKeyF() throws {
        var newPitch: Pitch!
        p = Pitch(noteName: .F, alter: 1, octave: 4)
        // The original is F# but is returned as Gb... Is this ok?
        newPitch = try p.up(interval: .unison, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 4))

        newPitch = try p.up(interval: .minorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorSecond, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: -1, octave: 4))

        newPitch = try p.up(interval: .minorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .A, alter: 0, octave: 4))

        newPitch = try p.up(interval: .majorThird, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: -1, octave: 4))

        newPitch = try p.up(interval: .perfectFourth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .B, alter: 0, octave: 4))

        newPitch = try p.up(interval: .diminishedFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .C, alter: 0, octave: 5))

        newPitch = try p.up(interval: .perfectFifth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: -1, octave: 5))

        newPitch = try p.up(interval: .minorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .D, alter: 0, octave: 5))

        newPitch = try p.up(interval: .majorSixth, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: -1, octave: 5))

        newPitch = try p.up(interval: .minorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .E, alter: 0, octave: 5))

        newPitch = try p.up(interval: .majorSeventh, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .F, alter: 0, octave: 5))

        newPitch = try p.up(interval: .octave, key: .f_major)
        XCTAssertEqual(newPitch, Pitch(noteName: .G, alter: -1, octave: 5))
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
