//
//  What_NextUITests_ActivitySelectionViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ActivitySelectionViewController: XCTestCase {

    // test Activity Selection View controller
    func testActivitySelectionScreen() throws {
    
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["TestLiteracy"].tap()

        app.buttons["Monday"].tap()
        
        // open the acivities selection screen
        app.buttons["LetsMoveOn"].tap()
        
        
        
    } //testActivitySelectionScreen
    
}

/*
extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
 */
