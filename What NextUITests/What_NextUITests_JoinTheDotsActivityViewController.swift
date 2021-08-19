//
//  What_NextUITests_JoinTheDotsActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_JoinTheDotsActivityViewController: XCTestCase {

    // test Join The Dots Activity  View controller
    func testJoinTheDotsActivityScreen() throws {
        
        let app = XCUIApplication()
        app.launch()

        app.buttons["TestLiteracy"].tap()

        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()

        // move to the Join The Dots screen
        app.buttons["JoinTheDots"].tap()
                                
    } //testJoinTheDotsActivityScreen
    
}

