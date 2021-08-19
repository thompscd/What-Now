//
//  What_NextUITests_WednesdayLessonViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_WednesdayLessonViewController: XCTestCase {

    // test Wednesday Lesson View controller
    func testWednesdayLesson() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()

        
        app.buttons["Wednesday"].tap() // move to Wednesday lesson
        //check the title is there to confirm screen exists
        let wednesdayTitle = app.staticTexts["Nouns ending in the suffix –ation"]
        XCTAssertTrue(wednesdayTitle.exists)        
        
    } //testWednesdayLesson
    
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
