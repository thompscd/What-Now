//
//  What_NextUITests_WednesdayExplanationViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_WednesdayExplanationViewController: XCTestCase {

    // test Wednesday Explanation View controller
    func testWednesdayExplanation() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()

        
        app.buttons["Wednesday"].tap() // move to Wednesday lesson
        //check the title is there to confirm screen exists
        let wednesdayTitle = app.staticTexts["Nouns ending in the suffix –ation"]
        XCTAssertTrue(wednesdayTitle.exists)        
        
        // open the explanation screen
        app.buttons["Let's try our best!"].tap()
                
    } //testWednesdayExplanation
    
}

