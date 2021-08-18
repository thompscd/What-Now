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
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
        
        app.buttons["Monday"].tap()     // move to Monday screen
        
        app.buttons["Let's move on!"].tap() // move to activities screen
        
        //let nowLearnt = app.staticTexts["NowLearnt"]
        //XCTAssertTrue(nowLearnt.exists)
        
        
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
