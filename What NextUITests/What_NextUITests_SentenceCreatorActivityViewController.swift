//
//  What_NextUITests_SentenceCreatorActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_SentenceCreatorActivityViewController: XCTestCase {

    // test Sentence Creator Activity  View controller
    func testSentenceCreatorActivityScreen() throws {

        let app = XCUIApplication()
        app.launch()

        app.buttons["TestLiteracy"].tap()

        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        
        // open the Sentence Creator screen
        app.buttons["SentenceCreator"].tap()
        
    } //testSentenceCreatorActivityScreen
    
}

