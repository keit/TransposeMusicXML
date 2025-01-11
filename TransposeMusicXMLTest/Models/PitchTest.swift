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
    
    func testUpFromC() throws {
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
