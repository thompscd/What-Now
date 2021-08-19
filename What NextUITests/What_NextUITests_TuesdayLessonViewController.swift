//
//  What_NextUITests_TuesdayLessonViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_TuesdayLessonViewController: XCTestCase {

    // test Tuesday Lesson View controller
    func testTuesdayLesson() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()

        
        app.buttons["Tuesday"].tap()    // go to Tuesday lesson
        
        // check the title is there to confirm on correct screen
        let tuesdayTitle = app.staticTexts["Plural Possessive Apostrophes with plural words "]
        XCTAssertTrue(tuesdayTitle.exists)
    } //testTuesdayLesson
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
