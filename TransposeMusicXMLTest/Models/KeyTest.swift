//
//  KeyTest.swift
//  TransposeMusicXMLTest
//
//  Created by Kei Takashima on 15/01/2025.
//

import XCTest
@testable import TransposeMusicXML

final class KeyTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testFifthsFlat() throws {
        XCTAssertEqual(Key.c_major.fifth, 0)
        XCTAssertEqual(Key.a_minor.fifth, 0)
        
        XCTAssertEqual(Key.f_major.fifth, -1)
        XCTAssertEqual(Key.d_minor.fifth, -1)

        XCTAssertEqual(Key.b_flat_major.fifth, -2)
        XCTAssertEqual(Key.g_minor.fifth, -2)

        XCTAssertEqual(Key.e_flat_major.fifth, -3)
        XCTAssertEqual(Key.c_minor.fifth, -3)

        XCTAssertEqual(Key.a_flat_major.fifth, -4)
        XCTAssertEqual(Key.f_minor.fifth, -4)

        XCTAssertEqual(Key.d_flat_major.fifth, -5)
        XCTAssertEqual(Key.b_flat_minor.fifth, -5)

        XCTAssertEqual(Key.g_flat_major.fifth, -6)
        XCTAssertEqual(Key.e_flat_minor.fifth, -6)

        XCTAssertEqual(Key.c_flat_major.fifth, -7)
        XCTAssertEqual(Key.a_flat_minor.fifth, -7)

    }

    func testFifthsSharp() throws {
        XCTAssertEqual(Key.c_major.fifth, 0)
        XCTAssertEqual(Key.a_minor.fifth, 0)

        XCTAssertEqual(Key.g_major.fifth, 1)
        XCTAssertEqual(Key.e_minor.fifth, 1)

        XCTAssertEqual(Key.d_major.fifth, 2)
        XCTAssertEqual(Key.b_minor.fifth, 2)

        XCTAssertEqual(Key.a_major.fifth, 3)
        XCTAssertEqual(Key.f_sharp_minor.fifth, 3)

        XCTAssertEqual(Key.e_major.fifth, 4)
        XCTAssertEqual(Key.c_sharp_minor.fifth, 4)

        XCTAssertEqual(Key.b_major.fifth, 5)
        XCTAssertEqual(Key.g_sharp_minor.fifth, 5)

        XCTAssertEqual(Key.f_sharp_major.fifth, 6)
        XCTAssertEqual(Key.d_sharp_minor.fifth, 6)

        XCTAssertEqual(Key.c_sharp_major.fifth, 7)
        XCTAssertEqual(Key.a_sharp_minor.fifth, 7)

    }

}
