//
//  What_NextUITests_LiteracyViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_LiteracyViewController: XCTestCase {

    // check format of Literacy View controller screen
    func testLiteracyScreenFormat() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()

        
        // check title exists
        let yourLessons = app.staticTexts["YourLessonsThisWeek"]
        XCTAssertTrue(yourLessons.exists)

        //check link for each of the days exist
        let monday = app.buttons["Monday"]
        XCTAssertTrue(monday.exists)
        let tuesday = app.buttons["Tuesday"]
        XCTAssertTrue(tuesday.exists)
        let wednesday = app.buttons["Wednesday"]
        XCTAssertTrue(wednesday.exists)
        let thursday = app.buttons["Thursday"]
        XCTAssertTrue(thursday.exists)
        let friday = app.buttons["Friday"]
        XCTAssertTrue(friday.exists)
        
        
    } //testLiteracyScreenFormat
    
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
