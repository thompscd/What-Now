//
//  What_NextUITests_SpeedWritingActivityViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_SpeedWritingActivityViewController: XCTestCase {

    // test Speed Writing Activity  View controller
    func testSpeedWritingActivityScreen() throws {

        let app = XCUIApplication()
        app.launch()

        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Monday"].tap()
        app.buttons["LetsMoveOn"].tap()
        
        // open the speed writing screen
        app.buttons["SpeedWriting"].tap()
                
    } //testSpeedWritingActivityScreen
    
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
