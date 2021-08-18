//
//  What_NextUITests_ThursdayLessonViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ThursdayLessonViewController: XCTestCase {

    // test Monday Lesson View controller
    func testThursdayLesson() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.forceTapElement()
                
        app.buttons["Thursday"].tap()   // move to Thursday lesson
        //check the title is there to confirm screen exists
        let thursdayTitle = app.staticTexts["Adding the prefix ex- (meaning 'out' )"]
        XCTAssertTrue(thursdayTitle.exists)
        
    } //testThursdayLesson
    
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
