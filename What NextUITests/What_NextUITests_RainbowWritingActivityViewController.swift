//
//  What_NextUITests_SpeedWritingActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_RainbowWritingActivityViewController: XCTestCase {

    // test Rainbow Writing Activity  View controller
    func testRainbowWritingActivityScreen() throws {
        
        let app = XCUIApplication()
        app.launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        //app.buttons["LetsMoveOn"].tap()

        // move to the Rainbow Writing screen
        app.buttons["RainbowWriting"].tap()
                
    } //testRainbowWritingActivityScreen
    
}

