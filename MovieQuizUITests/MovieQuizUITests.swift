//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Даниил Азевич on 16.04.2024.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }
    
    func testYesButton() throws {

        let firstPoster = app.images["Poster"]
        app.buttons["YesButton"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(firstPoster == secondPoster)
        XCTAssertEqual(indexLabel.label, "2/10")
    }
    
    func testNoButton() throws {
        let firstPoster = app.images["Poster"]
        app.buttons["NoButton"].tap()
        sleep(3)
        
        let secondPoster = app.images["Poster"]
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(firstPoster == secondPoster)
        XCTAssertEqual(indexLabel.label, "2/10")
    }
    
    func testAlert() throws {
        for _ in 1...10 {
            app.buttons["YesButton"].tap()
            sleep(2)
        }
        
        let indexLabel = app.staticTexts["Index"]
        XCTAssertEqual(indexLabel.label, "10/10")
    }
}
