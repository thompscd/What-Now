//
//  What_NextUITests_BackwardsWordsActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_BackwardsWordsActivityViewController: XCTestCase {

    // test Backwards Words Activity  View controller
    func testBackwardsWordsActivityScreen() throws {

        let app = XCUIApplication()
        app.launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        
        // open the Backwards Words screen
        app.buttons["BackwardsWords"].tap()
        
                
    } //testBackwardsWordsActivityScreen
    
}

