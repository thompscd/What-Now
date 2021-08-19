//
//  What_NextUITests_MondayExplanantionViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_MondayExplanantionViewController: XCTestCase {

    // test Monday Lesson View controller
    func testMondayExplanation() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        
        app.buttons["Monday"].tap()     // move to Monday screen
        //check the title is there to confirm screen exists
        let mondayTitle = app.staticTexts["Words with /aw/, spelt with 'augh' and 'au'"]
        XCTAssertTrue(mondayTitle.exists)
        
        // open the Monday Explanation screen
        app.buttons["Let's try our best!"].tap()
                
        
    } //testMondayExplanation
    
}

