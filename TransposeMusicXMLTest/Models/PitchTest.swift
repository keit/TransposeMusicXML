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
        p = Pitch(step: .C)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        p = nil
    }

    func testInit() throws {
        // C
        p = Pitch(step: .C)
        XCTAssertEqual(p.step, .C)
        XCTAssertEqual(p.alter, 0)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 0)

        // C#
        p = Pitch(step: .C, alter: 1)
        XCTAssertEqual(p.step, .C)
        XCTAssertEqual(p.alter, 1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 1)

        // Cb
        p = Pitch(step: .C, alter: -1)
        XCTAssertEqual(p.step, .C)
        XCTAssertEqual(p.alter, -1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, -1)

        // D
        p = Pitch(step: .D)
        XCTAssertEqual(p.step, .D)
        XCTAssertEqual(p.alter, 0)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 2)

        // D#
        p = Pitch(step: .D, alter: 1)
        XCTAssertEqual(p.step, .D)
        XCTAssertEqual(p.alter, 1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 3)

        // Db
        p = Pitch(step: .D, alter: -1)
        XCTAssertEqual(p.step, .D)
        XCTAssertEqual(p.alter, -1)
        XCTAssertEqual(p.octave, 4)
        XCTAssertEqual(p.index, 1)

        // Index of C# and Db should be equal
        XCTAssertEqual(Pitch(step: .C, alter: 1).index, Pitch(step: .D, alter: -1).index)
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
