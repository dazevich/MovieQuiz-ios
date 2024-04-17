//
//  ArrayTest.swift
//  MovieQuizTests
//
//  Created by Даниил Азевич on 16.04.2024.
//

import XCTest
@testable import MovieQuiz

final class ArrayTest: XCTestCase {
    private let testArray = [1, 2, 3, 4, 5]
    
    func testGetValueInRange() throws {
        XCTAssertNotNil(testArray[safe: 2])
        XCTAssertEqual(testArray[safe: 2], 3)
    }
    
    func testGetValueOutOfRange() throws {
        XCTAssertNil(testArray[safe: 20])
    }
}
