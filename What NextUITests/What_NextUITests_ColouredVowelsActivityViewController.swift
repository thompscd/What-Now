//
//  What_NextUITests_ColouredVowelsActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ColouredVowelsActivityViewController: XCTestCase {

    // test ColoredVowels Activity  View controller
    func testColouredVowelsActivityScreen() throws {

        let app = XCUIApplication()
        app.launch()

        app.buttons["TestLiteracy"].tap()

        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        
        // open the Coloured Vowels screen
        app.buttons["ColouredVowels"].tap()
        
    } //testColouredVowelsActivityScreen
    
}

