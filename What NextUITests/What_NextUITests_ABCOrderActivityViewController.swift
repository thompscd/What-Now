//
//  What_NextUITests_ABCOrderActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ABCOrderActivityViewController: XCTestCase {

    // test ABC Order Activity  View controller
    func testABCOrderActivityScreen() throws {

        let app = XCUIApplication()
        app.launch()

        app.buttons["TestLiteracy"].tap()

        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        
        // open the ABC Order screen
        app.buttons["ABCOrder"].tap()
                
    } //testABCOrderActivityScreen
    
}

