//
//  What_NextUITests_ThursdayTestViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ThursdayTestViewController: XCTestCase {

    // test Thursday Test View controller
    func testThursdayTest() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
                
        app.buttons["Thursday"].tap()   // move to Thursday lesson
        //check the title is there to confirm screen exists
        let thursdayTitle = app.staticTexts["Adding the prefix ex- (meaning 'out' )"]
        XCTAssertTrue(thursdayTitle.exists)
        
        // open the Thursday explanation screen
        app.buttons["Let's try our best!"].tap()
        
        // open Thursday Test screen
        app.buttons["Let's move on!"].tap()
                        
    } //testThursdayTest
    
}
