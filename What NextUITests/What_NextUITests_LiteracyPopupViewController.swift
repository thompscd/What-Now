//
//  What_NextUITests_LiteracyPopupViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_LiteracyPopupViewController: XCTestCase {

    // check that user is taken to the main login screen after pressing unread
    // notifications popup
    func testLiteracyScreenFormat() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        app.buttons["SignInButton"].forceTapElement()
                                
        // press the dismiss button
        let dismissButton = app/*@START_MENU_TOKEN@*/.buttons["DismissButton"]/*[[".otherElements[\"moodPopupLabel\"].buttons[\"DismissButton\"]",".buttons[\"DismissButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dismissButton.tap();
        
        // close the unread notifications popup
        app.staticTexts["Close"].tap()
              
        // check the user is on the main screen (by checking the search bar exists)
        let searchBar = app.searchFields["Search"]
        XCTAssertTrue(searchBar.exists)
        
    } //testClosePopupScreen
    
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
