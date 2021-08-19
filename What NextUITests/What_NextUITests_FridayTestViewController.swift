//
//  What_NextUITests_FridayTestViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_FridayTestViewController: XCTestCase {

    // test Friday Test View controller
    func testFridayTest() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        
        app.buttons["Friday"].tap()     // move to Frday screen
        //check the title is there to confirm screen exists
        let fridayTitle = app.staticTexts["Revision"]
        XCTAssertTrue(fridayTitle.exists)
        
        // open the Friday explanation screen
        app.buttons["Let's try our best!"].tap()
        
        // open Friday Test screen
        app.buttons["Let's move on!"].tap()
                                        
    } //testFridayTest
    
}

