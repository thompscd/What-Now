//
//  What_NextUITests_TuesdayExplanantionViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_TuesdayExplanationViewController: XCTestCase {

    // test Tuesday Lesson View controller
    func testTuesdayLesson() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        
        app.buttons["Tuesday"].tap()    // go to Tuesday lesson
        
        // check the title is there to confirm on correct screen
        let tuesdayTitle = app.staticTexts["Plural Possessive Apostrophes with plural words "]
        XCTAssertTrue(tuesdayTitle.exists)
        
        // open the Tuesday Explanation screen
        app.buttons["Let's try our best!"].tap()
                
    } //testTuesdayLesson
}

