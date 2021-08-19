//
//  What_NextUITests_MondayLessonViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_MondayLessonViewController: XCTestCase {

    // test Monday Lesson View controller
    func testMondayLesson() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["TestLiteracy"].tap()
        
        app.buttons["Monday"].tap()     // move to Monday screen
        //check the title is there to confirm screen exists
        let mondayTitle = app.staticTexts["Words with /aw/, spelt with 'augh' and 'au'"]
        XCTAssertTrue(mondayTitle.exists)
        
        /*

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
        
         
         let app = XCUIApplication()
         app/*@START_MENU_TOKEN@*/.staticTexts["Test Literacy"]/*[[".buttons[\"TestLiteracy\"].staticTexts[\"Test Literacy\"]",".staticTexts[\"Test Literacy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
         app.buttons["Monday"].tap()
         app.staticTexts["Words with /aw/, spelt with 'augh' and 'au'"].tap()
         */
        
    } //testMondayLesson
    
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
