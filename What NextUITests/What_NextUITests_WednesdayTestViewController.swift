//
//  What_NextUITests_WednesdayTestViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_WednesdayTestViewController: XCTestCase {

    // test Wednesday Test View controller
    func testWednesdayTest() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        
        app.buttons["Wednesday"].tap() // move to Wednesday lesson
        //check the title is there to confirm screen exists
        let wednesdayTitle = app.staticTexts["Nouns ending in the suffix –ation"]
        XCTAssertTrue(wednesdayTitle.exists)        
        
        // open the explanation screen
        app.buttons["Let's try our best!"].tap()
        
        // open Wednesday Test screen
        app.buttons["Let's move on!"].tap()
                
    } //testWednesdayTest
    
}

