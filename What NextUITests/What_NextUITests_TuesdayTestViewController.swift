//
//  What_NextUITests_TuesdayTestViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_TuesdayTestViewController: XCTestCase {

    // test Tuesday Test View controller
    func testTuesdayTest() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()

        
        app.buttons["Tuesday"].tap()    // go to Tuesday lesson
        
        // check the title is there to confirm on correct screen
        let tuesdayTitle = app.staticTexts["Plural Possessive Apostrophes with plural words "]
        XCTAssertTrue(tuesdayTitle.exists)
        
        // open the Tuesday Explanation screen
        app.buttons["Let's try our best!"].tap()
        
        //open the Tuesday Test screen
        app.buttons["Let's move on!"].tap()
                
    } //testTuesdayTest
}

